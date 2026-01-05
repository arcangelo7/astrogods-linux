import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../constants/text_styles.dart';
import '../../utils/snackbar_utils.dart';
import '../../services/google_sign_in_native_service.dart';
import 'google_signin_button.dart';

class GoogleSignInWidget extends StatefulWidget {
  final bool isRegisterMode;
  final VoidCallback? onSuccess;

  const GoogleSignInWidget({
    super.key,
    this.isRegisterMode = false,
    this.onSuccess,
  });

  @override
  State<GoogleSignInWidget> createState() => _GoogleSignInWidgetState();
}

class _GoogleSignInWidgetState extends State<GoogleSignInWidget> {
  final GoogleSignInNativeService _googleNativeService =
      GoogleSignInNativeService();
  StreamSubscription<GoogleSignInAuthenticationEvent>? _authEventSubscription;
  bool _isWebInitialized = false;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _initializeWebAuth();
    }
  }

  Future<void> _initializeWebAuth() async {
    await GoogleSignIn.instance.initialize();
    _setupWebAuthListener();
    if (mounted) {
      setState(() {
        _isWebInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _authEventSubscription?.cancel();
    super.dispose();
  }

  void _setupWebAuthListener() {
    _authEventSubscription = GoogleSignIn.instance.authenticationEvents.listen((event) {
      if (event is GoogleSignInAuthenticationEventSignIn) {
        _handleWebSignInComplete(event.user);
      }
    });
  }

  Future<void> _handleWebSignInComplete(GoogleSignInAccount user) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      final auth = user.authentication;
      final success = await authProvider.loginWithGoogle(
        idToken: auth.idToken ?? '',
        context: context,
      );

      if (mounted) {
        if (success) {
          final l10n = AppLocalizations.of(context)!;
          SnackbarUtils.showSuccess(
            context,
            widget.isRegisterMode
                ? l10n.googleSignUpSuccessful
                : l10n.googleSignInSuccessful,
          );
          widget.onSuccess?.call();
        } else {
          SnackbarUtils.showCopyableErrorSnackBar(
            context,
            authProvider.errorMessage!,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        SnackbarUtils.showCopyableErrorSnackBar(
          context,
          widget.isRegisterMode
              ? l10n.googleSignUpError(e.toString())
              : l10n.googleSignInError(e.toString()),
        );
      }
    }
  }

  Future<void> _handleGoogleSignIn() async {
    // On web, authentication is handled automatically by renderButton()
    // This method is only called on native platforms
    if (kIsWeb) {
      return;
    }

    // Native platforms
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      final googleUser = await _googleNativeService.signIn();

      if (googleUser != null && mounted) {
        final success = await authProvider.loginWithGoogle(
          idToken: googleUser.idToken,
          context: context,
        );

        if (mounted) {
          if (success) {
            final l10n = AppLocalizations.of(context)!;
            SnackbarUtils.showSuccess(
              context,
              widget.isRegisterMode
                  ? l10n.googleSignUpSuccessful
                  : l10n.googleSignInSuccessful,
            );
            widget.onSuccess?.call();
          } else {
            SnackbarUtils.showCopyableErrorSnackBar(
              context,
              authProvider.errorMessage!,
            );
          }
        }
      } else {
        authProvider.stopLoading();
      }
    } on GoogleSignInException catch (e) {
      authProvider.stopLoading();

      if (mounted) {
        // User cancelled - don't show error
        if (e.code == GoogleSignInExceptionCode.canceled) {
          return;
        }

        final l10n = AppLocalizations.of(context)!;
        SnackbarUtils.showCopyableErrorSnackBar(
          context,
          widget.isRegisterMode
              ? l10n.googleSignUpError(e.toString())
              : l10n.googleSignInError(e.toString()),
        );
      }
    } catch (e) {
      authProvider.stopLoading();

      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        SnackbarUtils.showCopyableErrorSnackBar(
          context,
          widget.isRegisterMode
              ? l10n.googleSignUpError(e.toString())
              : l10n.googleSignInError(e.toString()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        const SizedBox(height: 16),

        // Divider
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.white.withValues(alpha: 0.3),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(l10n.or, style: AppTextStyles.getCaptionStyle(context)),
            ),
            Expanded(
              child: Divider(
                color: Colors.white.withValues(alpha: 0.3),
                thickness: 1,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Google Sign-In Button
        if (kIsWeb && _isWebInitialized)
          // Show native Google button on web
          const SizedBox(
            width: double.infinity,
            height: 56,
            child: GoogleSignInButtonWeb(),
          )
        else if (kIsWeb)
          // Show loading placeholder while initializing
          SizedBox(
            width: double.infinity,
            height: 56,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const CircularProgressIndicator(),
            ),
          )
        else
          // Show custom styled button for native platforms
          SizedBox(
            width: double.infinity,
            height: 56,
            child: SignInButton(
              Buttons.google,
              text: l10n.continueWithGoogle,
              onPressed: _handleGoogleSignIn,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 8.0,
              padding: EdgeInsets.zero,
            ),
          ),
      ],
    );
  }
}
