import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/starry_night_background.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/mystical_text_field.dart';
import '../../widgets/auth/auth_container.dart';
import '../../constants/text_styles.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/auth_validators.dart';
import '../../utils/error_utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleForgotPassword() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final email = _emailController.text.trim();

    final success = await authProvider.forgotPassword(email);

    if (mounted) {
      if (success) {
        setState(() {
          _emailSent = true;
        });
        SnackbarUtils.showSuccess(
          context,
          AppLocalizations.of(context)!.emailSentSuccessfully,
        );
      } else {
        SnackbarUtils.showError(
          context,
          translateConnectionError(
            context,
            authProvider.errorMessage ?? 'Failed to send reset email',
          ),
        );
      }
    }
  }

  void _resendEmail() {
    setState(() {
      _emailSent = false;
    });
    _handleForgotPassword();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarryNightBackground(
        showPlanet: true,
        subtle: false,
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (GoRouter.of(context).canPop()) {
                      context.pop();
                    } else {
                      context.go('/login');
                    }
                  },
                ),
                title: Text(l10n.resetPassword),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight - 48.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),

                      // Icon
                      Icon(
                        Icons.lock_reset,
                        size: 80,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 24),

                      // Title
                      Text(
                        l10n.resetPasswordTitle,
                        style: AppTextStyles.getH3Style(context),
                        textAlign: TextAlign.center,
                      ),

                      // Success Message
                      if (_emailSent) ...[
                        const SizedBox(height: 8),
                        Text(
                          l10n.checkYourEmail,
                          style: AppTextStyles.getH4Style(context),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.resetLinkSent(_emailController.text.trim()),
                          style: AppTextStyles.getSubtitleLargeStyle(context),
                          textAlign: TextAlign.center,
                        ),
                      ],

                      const SizedBox(height: 60),

                      // Form or Success Actions
                      AuthContainer(
                        child: _emailSent
                            ? Column(
                                children: [
                                  // Check Email Icon
                                  Icon(
                                    Icons.email_outlined,
                                    size: 60,
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                  const SizedBox(height: 24),

                                  // Didn't receive email text
                                  Text(
                                    l10n.didntReceiveEmail,
                                    style: AppTextStyles.getCaptionStyle(context),
                                  ),
                                  const SizedBox(height: 8),

                                  // Spam folder warning
                                  Text(
                                    l10n.checkSpamFolder,
                                    style: AppTextStyles.getCaptionStyle(context).copyWith(
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),

                                  // Resend Email Button
                                  Consumer<AuthProvider>(
                                    builder: (context, authProvider, child) {
                                      return GradientButton(
                                        text: l10n.resendEmail,
                                        onPressed: _resendEmail,
                                        enabled: !authProvider.isLoading,
                                        isLoading: authProvider.isLoading,
                                        width: double.infinity,
                                      );
                                    },
                                  ),
                                ],
                              )
                            : Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    // Email Field
                                    MysticalTextField(
                                      controller: _emailController,
                                      labelText: l10n.email,
                                      prefixIcon: Icons.email_outlined,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.done,
                                      validator: (value) =>
                                          AuthValidators.validateEmail(value, l10n),
                                      onFieldSubmitted: _handleForgotPassword,
                                    ),

                                    const SizedBox(height: 24),

                                    // Send Reset Link Button
                                    Consumer<AuthProvider>(
                                      builder: (context, authProvider, child) {
                                        return GradientButton(
                                          text: l10n.sendResetLink,
                                          onPressed: _handleForgotPassword,
                                          enabled: !authProvider.isLoading,
                                          isLoading: authProvider.isLoading,
                                          width: double.infinity,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                      ),

                      const SizedBox(height: 24),

                      // Back to Login Link
                      TextButton(
                        onPressed: () {
                          context.go('/login');
                        },
                        child: Text(
                          l10n.backToLogin,
                          style: AppTextStyles.getLinkStyle(context),
                        ),
                      ),
                    ],
                  ),
                ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}