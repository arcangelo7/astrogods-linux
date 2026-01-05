import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../providers/language_provider.dart';
import '../../models/auth_request.dart';
import '../../widgets/starry_night_background.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/location_search_field.dart';
import '../../widgets/mystical_text_field.dart';
import '../../widgets/mystical_password_field.dart';
import '../../widgets/auth/auth_container.dart';
import '../../widgets/auth/google_signin_widget.dart';
import '../../constants/text_styles.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/auth_validators.dart';
import '../../utils/error_utils.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pageController = PageController();

  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _givenNameController = TextEditingController();
  final _familyNameController = TextEditingController();
  final _birthPlaceController = TextEditingController();

  // State
  int _currentPage = 0;
  DateTime? _birthDate;
  TimeOfDay? _birthTime;
  bool _unknownTime = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _givenNameController.dispose();
    _familyNameController.dispose();
    _birthPlaceController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _nextPage() async {
    if (_currentPage < 2) {
      if (await _validateCurrentPage()) {
        setState(() {
          _currentPage++;
        });
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<bool> _validateCurrentPage() async {
    bool isValid = true;

    switch (_currentPage) {
      case 0:
        if (!_formKey.currentState!.validate()) {
          isValid = false;
        } else {
          // Check if email already exists
          final authProvider = Provider.of<AuthProvider>(
            context,
            listen: false,
          );
          final emailExists = await authProvider.checkEmailExists(
            _emailController.text.trim(),
          );

          if (!mounted) return false;

          if (emailExists) {
            isValid = false;
            SnackbarUtils.showErrorWithAction(
              context,
              AppLocalizations.of(context)!.emailAlreadyExists,
              AppLocalizations.of(context)!.goToLogin,
              () {
                Navigator.of(
                  context,
                ).pop(); // Close register screen and go back to login
              },
            );
          } else if (authProvider.errorMessage != null) {
            isValid = false;
            SnackbarUtils.showError(
              context,
              translateConnectionError(context, authProvider.errorMessage!),
            );
          }
        }
        break;
      case 1:
        if (!_formKey.currentState!.validate()) {
          isValid = false;
        }
        break;
      case 2:
        isValid = true; // Birth info is optional
        break;
      default:
        isValid = true;
        break;
    }

    if (!isValid && _currentPage != 0) {
      if (mounted) {
        SnackbarUtils.showError(
          context,
          AppLocalizations.of(context)!.pleaseFillAllFields,
        );
      }
    }

    return isValid;
  }

  Future<void> _selectBirthDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          _birthDate ?? DateTime.now().subtract(const Duration(days: 365 * 25)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  Future<void> _selectBirthTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _birthTime ?? const TimeOfDay(hour: 12, minute: 0),
    );
    if (picked != null && picked != _birthTime) {
      setState(() {
        _birthTime = picked;
      });
    }
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final languageProvider = Provider.of<LanguageProvider>(
      context,
      listen: false,
    );
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    String? birthDateTimeString;
    if (_birthDate != null) {
      DateTime birthDateTime = _birthDate!;
      if (_birthTime != null && !_unknownTime) {
        birthDateTime = DateTime(
          _birthDate!.year,
          _birthDate!.month,
          _birthDate!.day,
          _birthTime!.hour,
          _birthTime!.minute,
        );
      }
      birthDateTimeString = birthDateTime.toIso8601String();
    }

    final request = RegisterRequest(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      preferredLanguage: languageProvider.currentLocale.languageCode,
      givenName: _givenNameController.text.trim().isNotEmpty
          ? _givenNameController.text.trim()
          : null,
      familyName: _familyNameController.text.trim().isNotEmpty
          ? _familyNameController.text.trim()
          : null,
      birthDatetime: birthDateTimeString,
      birthLatitude: null,
      birthLongitude: null,
      birthPlace: _birthPlaceController.text.trim().isNotEmpty
          ? _birthPlaceController.text.trim()
          : null,
      unknownTime: _unknownTime,
    );

    final success = await authProvider.register(request, context: context);

    if (mounted) {
      if (success) {
        SnackbarUtils.showSuccess(
          context,
          AppLocalizations.of(context)!.registrationSuccessful,
        );
        
        // Check if we need to redirect to birth chart reading
        await _handlePostRegistrationRedirect();
      } else {
        SnackbarUtils.showCopyableErrorSnackBar(
          context,
          translateConnectionError(context, authProvider.errorMessage!),
        );
      }
    }
  }

  Future<void> _handlePostRegistrationRedirect() async {
    // Close registration screen - redirect will be handled by HomeScreen
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildAccountInfoPage(bool isDark) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MysticalTextField(
          controller: _emailController,
          labelText: l10n.email,
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) => AuthValidators.validateEmail(value, l10n),
        ),

        const SizedBox(height: 20),

        MysticalPasswordField(
          controller: _passwordController,
          labelText: l10n.password,
          textInputAction: TextInputAction.next,
          validator: (value) => AuthValidators.validatePassword(value, l10n),
        ),

        const SizedBox(height: 20),

        MysticalPasswordField(
          controller: _confirmPasswordController,
          labelText: l10n.confirmPassword,
          textInputAction: TextInputAction.done,
          validator: (value) => AuthValidators.validateConfirmPassword(
            value,
            _passwordController.text,
            l10n,
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalInfoPage(bool isDark) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First Name Field
        MysticalTextField(
          controller: _givenNameController,
          labelText: l10n.firstName,
          prefixIcon: Icons.person_outline,
          textInputAction: TextInputAction.next,
          validator: (value) =>
              AuthValidators.validateRequiredField(value, l10n),
        ),

        const SizedBox(height: 20),

        // Last Name Field
        MysticalTextField(
          controller: _familyNameController,
          labelText: l10n.lastName,
          prefixIcon: Icons.person_outline,
          textInputAction: TextInputAction.done,
          validator: (value) =>
              AuthValidators.validateRequiredField(value, l10n),
        ),
      ],
    );
  }

  Widget _buildBirthInfoPage() {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Birth Date
        GestureDetector(
          onTap: _selectBirthDate,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _birthDate != null
                        ? DateFormat.yMMMd().format(_birthDate!)
                        : l10n.birthDate,
                    style: TextStyle(
                      color: _birthDate != null 
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                      fontSize: AppTextStyles.bodySize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Birth Time
        if (_birthDate != null) ...[
          GestureDetector(
            onTap: _unknownTime ? null : _selectBirthTime,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _unknownTime
                    ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3)
                    : Theme.of(context).colorScheme.surface.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _unknownTime
                      ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)
                      : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: _unknownTime 
                        ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)
                        : Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _birthTime != null && !_unknownTime
                          ? _birthTime!.format(context)
                          : l10n.birthTime,
                      style: TextStyle(
                        color: _birthTime != null && !_unknownTime
                            ? Theme.of(context).colorScheme.onSurface
                            : _unknownTime
                            ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)
                            : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                        fontSize: AppTextStyles.bodySize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Checkbox(
                value: _unknownTime,
                onChanged: (value) {
                  setState(() {
                    _unknownTime = value ?? false;
                    if (_unknownTime) {
                      _birthTime = null;
                    }
                  });
                },
                activeColor: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l10n.dontKnowBirthTime,
                  style: AppTextStyles.getCaptionStyle(context),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],

        // Birth Place
        LocationSearchField(
          controller: _birthPlaceController,
          labelText: l10n.birthPlace,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
                title: Text(l10n.createAccount),
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

                      // Title and Subtitle
                      Text(
                        l10n.createAccount,
                        style: AppTextStyles.getH3Style(context),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.signUp,
                        style: AppTextStyles.getSubtitleLargeStyle(context),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 40),

                      // Progress Indicator
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          children: List.generate(3, (index) {
                            return Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: index < 2 ? 8 : 0,
                                ),
                                height: 4,
                                decoration: BoxDecoration(
                                  color: index <= _currentPage
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Form Content
                      AuthContainer(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 280,
                                child: PageView(
                                  controller: _pageController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    _buildAccountInfoPage(isDark),
                                    _buildPersonalInfoPage(isDark),
                                    _buildBirthInfoPage(),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Navigation Buttons
                              Row(
                                children: [
                                  if (_currentPage > 0)
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: _previousPage,
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                            color: Theme.of(context).colorScheme.outline,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          l10n.previous,
                                          style: AppTextStyles.getBodyStyle(
                                            context,
                                          ),
                                        ),
                                      ),
                                    ),

                                  if (_currentPage > 0)
                                    const SizedBox(width: 16),

                                  Expanded(
                                    child: Consumer<AuthProvider>(
                                      builder: (context, authProvider, child) {
                                        return GradientButton(
                                          text: _currentPage < 2
                                              ? l10n.next
                                              : l10n.finish,
                                          onPressed: _currentPage < 2
                                              ? _nextPage
                                              : _handleRegister,
                                          enabled: !authProvider.isLoading,
                                          padding: _currentPage == 2
                                              ? const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 18,
                                                )
                                              : null,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              // Google Sign-In (only on first page)
                              if (_currentPage == 0)
                                GoogleSignInWidget(
                                  isRegisterMode: true,
                                  onSuccess: () => Navigator.of(context).pop(),
                                ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.alreadyHaveAccount,
                            style: AppTextStyles.getCaptionStyle(context),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              l10n.signIn,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: AppTextStyles.semibold,
                              ),
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
