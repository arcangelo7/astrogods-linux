import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/starry_night_background.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/mystical_password_field.dart';
import '../../widgets/auth/auth_container.dart';
import '../../constants/text_styles.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/auth_validators.dart';
import '../../utils/error_utils.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String token;

  const ResetPasswordScreen({
    super.key,
    required this.token,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleResetPassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final success = await authProvider.resetPassword(
      widget.token,
      _passwordController.text,
    );

    if (mounted) {
      if (success) {
        SnackbarUtils.showSuccess(
          context,
          AppLocalizations.of(context)!.passwordResetSuccessful,
        );
        // Navigate to login screen
        context.go('/login');
      } else {
        SnackbarUtils.showError(
          context,
          translateConnectionError(
            context,
            authProvider.errorMessage ??
                AppLocalizations.of(context)!.invalidResetToken,
          ),
        );
      }
    }
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
                        l10n.enterNewPassword,
                        style: AppTextStyles.getH3Style(context),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.resetPasswordTitle,
                        style: AppTextStyles.getSubtitleLargeStyle(context),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 60),

                      // Reset Password Form
                      AuthContainer(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // New Password Field
                              MysticalPasswordField(
                                controller: _passwordController,
                                labelText: l10n.newPassword,
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    AuthValidators.validatePassword(value, l10n),
                              ),

                              const SizedBox(height: 20),

                              // Confirm Password Field
                              MysticalPasswordField(
                                controller: _confirmPasswordController,
                                labelText: l10n.confirmNewPassword,
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return l10n.pleaseFillAllFields;
                                  }
                                  if (value != _passwordController.text) {
                                    return l10n.passwordsDoNotMatch;
                                  }
                                  return null;
                                },
                                onFieldSubmitted: _handleResetPassword,
                              ),

                              const SizedBox(height: 24),

                              // Reset Password Button
                              Consumer<AuthProvider>(
                                builder: (context, authProvider, child) {
                                  return GradientButton(
                                    text: l10n.resetPassword,
                                    onPressed: _handleResetPassword,
                                    enabled: !authProvider.isLoading,
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