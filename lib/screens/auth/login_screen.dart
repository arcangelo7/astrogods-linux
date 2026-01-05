import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/starry_night_background.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/mystical_text_field.dart';
import '../../widgets/mystical_password_field.dart';
import '../../widgets/auth/auth_container.dart';
import '../../widgets/auth/google_signin_widget.dart';
import '../../constants/text_styles.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/auth_validators.dart';
import '../../utils/error_utils.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  final String? error;

  const LoginScreen({super.key, this.error});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _errorShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.error != null && !_errorShown && mounted) {
      _errorShown = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          SnackbarUtils.showError(context, widget.error!);
        }
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      SnackbarUtils.showError(
        context,
        AppLocalizations.of(context)!.pleaseFillAllFields,
      );
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final success = await authProvider.login(
      _emailController.text.trim(),
      _passwordController.text,
      context: context,
    );

    if (mounted) {
      if (success) {
        SnackbarUtils.showSuccess(
          context,
          AppLocalizations.of(context)!.loginSuccessful,
        );
        
        // Check if we need to redirect to birth chart reading
        await _handlePostLoginRedirect();
      } else {
        SnackbarUtils.showCopyableErrorSnackBar(
          context,
          translateConnectionError(context, authProvider.errorMessage!),
        );
      }
    }
  }

  Future<void> _handlePostLoginRedirect() async {
    // Simply go to home - the redirect will be handled by HomeScreen
    if (mounted) {
      context.go('/');
    }
  }

  void _navigateToRegister() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
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
                      context.go('/');
                    }
                  },
                ),
                title: Text(l10n.signIn),
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

                      // Title
                      Text(
                        l10n.welcomeBack,
                        style: AppTextStyles.getH3Style(context),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.loginToAccount,
                        style: AppTextStyles.getSubtitleLargeStyle(context),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 60),

                      // Login Form
                      AuthContainer(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Email Field
                              MysticalTextField(
                                controller: _emailController,
                                labelText: l10n.email,
                                prefixIcon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    AuthValidators.validateEmail(value, l10n),
                              ),

                              const SizedBox(height: 20),

                              // Password Field
                              MysticalPasswordField(
                                controller: _passwordController,
                                labelText: l10n.password,
                                textInputAction: TextInputAction.done,
                                validator: (value) =>
                                    AuthValidators.validatePassword(
                                      value,
                                      l10n,
                                    ),
                                onFieldSubmitted: _handleLogin,
                              ),

                              const SizedBox(height: 12),

                              // Forgot Password
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    context.go('/forgot-password');
                                  },
                                  child: Text(
                                    l10n.forgotPassword,
                                    style: AppTextStyles.getLinkStyle(context),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Login Button
                              Consumer<AuthProvider>(
                                builder: (context, authProvider, child) {
                                  return GradientButton(
                                    text: l10n.signIn,
                                    onPressed: _handleLogin,
                                    enabled: !authProvider.isLoading,
                                    width: double.infinity,
                                  );
                                },
                              ),

                              GoogleSignInWidget(
                                isRegisterMode: false,
                                onSuccess: () => context.go('/'),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Register Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.dontHaveAccount,
                            style: AppTextStyles.getCaptionStyle(context),
                          ),
                          TextButton(
                            onPressed: _navigateToRegister,
                            child: Text(
                              l10n.signUp,
                              style: AppTextStyles.getLinkStyle(context),
                            ),
                          ),
                        ],
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
