import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../constants/text_styles.dart';
import '../../utils/snackbar_utils.dart';
import '../../services/auth_service.dart';
import '../../services/google_sign_in_native_service.dart';
import '../../services/google_sign_in_desktop_service.dart';
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
  bool _isInitialized = false;
  bool _isInitializing = false;
  String? _initError;

  @override
  void initState() {
    super.initState();
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    if (_isInitializing || _isInitialized) return;

    setState(() {
      _isInitializing = true;
      _initError = null;
    });

    try {
      final authService = AuthService(context: context);
      final config = await authService.getOAuthConfig();

      if (kIsWeb) {
        await GoogleSignIn.instance.initialize();
        _setupWebAuthListener();
      } else if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
        await GoogleSignInDesktopService().initialize(
          config['clientId']!,
          config['clientSecret']!,
        );
      } else {
        await _googleNativeService.initialize(config['clientId']);
      }

      if (mounted) {
        setState(() {
          _isInitialized = true;
          _isInitializing = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _initError = e.toString();
          _isInitializing = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _authEventSubscription?.cancel();
    super.dispose();
  }

  void _setupWebAuthListener() {
    _authEventSubscription =
        GoogleSignIn.instance.authenticationEvents.listen((event) {
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
    if (kIsWeb) {
      return;
    }

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
    if (_initError != null) {
      return const SizedBox.shrink();
    }

    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        const SizedBox(height: 16),

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
              child:
                  Text(l10n.or, style: AppTextStyles.getCaptionStyle(context)),
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

        if (!_isInitialized)
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
        else if (kIsWeb)
          const SizedBox(
            width: double.infinity,
            height: 56,
            child: GoogleSignInButtonWeb(),
          )
        else
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
