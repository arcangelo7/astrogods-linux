import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('it'),
  ];

  /// No description provided for @previewDescription.
  ///
  /// In en, this message translates to:
  /// **'Preview of your birth chart analysis'**
  String get previewDescription;

  /// No description provided for @fullPersonalityAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Full personality analysis'**
  String get fullPersonalityAnalysis;

  /// No description provided for @detailedPlanetaryInterpretation.
  ///
  /// In en, this message translates to:
  /// **'Detailed planetary interpretation'**
  String get detailedPlanetaryInterpretation;

  /// No description provided for @personalizedInsights.
  ///
  /// In en, this message translates to:
  /// **'Personalized insights'**
  String get personalizedInsights;

  /// No description provided for @getFullReading.
  ///
  /// In en, this message translates to:
  /// **'Get full reading'**
  String get getFullReading;

  /// No description provided for @generating.
  ///
  /// In en, this message translates to:
  /// **'Generating...'**
  String get generating;

  /// No description provided for @generatingReading.
  ///
  /// In en, this message translates to:
  /// **'Generating reading...'**
  String get generatingReading;

  /// No description provided for @compatibilityAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Compatibility Analysis'**
  String get compatibilityAnalysis;

  /// No description provided for @generateDetailedCompatibilityAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Generate a detailed compatibility analysis between {relationshipTitle}'**
  String generateDetailedCompatibilityAnalysis(Object relationshipTitle);

  /// No description provided for @generateAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Generate Analysis'**
  String get generateAnalysis;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorTitle;

  /// No description provided for @generatingTopic.
  ///
  /// In en, this message translates to:
  /// **'Generating: {topic}...'**
  String generatingTopic(Object topic);

  /// No description provided for @synastry.
  ///
  /// In en, this message translates to:
  /// **'Synastry'**
  String get synastry;

  /// No description provided for @personA.
  ///
  /// In en, this message translates to:
  /// **'Person A'**
  String get personA;

  /// No description provided for @personB.
  ///
  /// In en, this message translates to:
  /// **'Person B'**
  String get personB;

  /// No description provided for @synastryBetween.
  ///
  /// In en, this message translates to:
  /// **'Synastry between {person1} and {person2}'**
  String synastryBetween(Object person1, Object person2);

  /// No description provided for @birthChartOf.
  ///
  /// In en, this message translates to:
  /// **'Birth chart of {name}'**
  String birthChartOf(Object name);

  /// No description provided for @preparingReading.
  ///
  /// In en, this message translates to:
  /// **'Preparing reading...'**
  String get preparingReading;

  /// No description provided for @loadingImage.
  ///
  /// In en, this message translates to:
  /// **'Loading image...'**
  String get loadingImage;

  /// No description provided for @read.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get read;

  /// No description provided for @logoutSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Logout successful'**
  String get logoutSuccessful;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'AstroGods'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitle;

  /// No description provided for @personalityTitle.
  ///
  /// In en, this message translates to:
  /// **'Personality'**
  String get personalityTitle;

  /// No description provided for @relationshipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Relationships'**
  String get relationshipsTitle;

  /// No description provided for @predictionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Forecast'**
  String get predictionsTitle;

  /// No description provided for @dailyPredictionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Predictions'**
  String get dailyPredictionsTitle;

  /// No description provided for @monthlyPredictionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Monthly Predictions'**
  String get monthlyPredictionsTitle;

  /// No description provided for @codexTitle.
  ///
  /// In en, this message translates to:
  /// **'Codex'**
  String get codexTitle;

  /// No description provided for @savedChartsTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved analyses'**
  String get savedChartsTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @italian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkMode;

  /// No description provided for @systemMode.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemMode;

  /// No description provided for @unveilHeart.
  ///
  /// In en, this message translates to:
  /// **'Unveil the heart of a person through their birth chart'**
  String get unveilHeart;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @birthPlace.
  ///
  /// In en, this message translates to:
  /// **'Birth Place'**
  String get birthPlace;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'birth date'**
  String get birthDate;

  /// No description provided for @birthTime.
  ///
  /// In en, this message translates to:
  /// **'birth time'**
  String get birthTime;

  /// No description provided for @dontKnowBirthTime.
  ///
  /// In en, this message translates to:
  /// **'I don\'t know the birth time'**
  String get dontKnowBirthTime;

  /// No description provided for @withoutBirthTimeWarning.
  ///
  /// In en, this message translates to:
  /// **'Without the time of birth the reading will not take the Ascendant into account'**
  String get withoutBirthTimeWarning;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'GET STARTED'**
  String get getStarted;

  /// No description provided for @subtitlePart1.
  ///
  /// In en, this message translates to:
  /// **'Align'**
  String get subtitlePart1;

  /// No description provided for @subtitlePart2.
  ///
  /// In en, this message translates to:
  /// **'with your'**
  String get subtitlePart2;

  /// No description provided for @subtitlePart3.
  ///
  /// In en, this message translates to:
  /// **'sky'**
  String get subtitlePart3;

  /// No description provided for @birthChartReading.
  ///
  /// In en, this message translates to:
  /// **'Birth Chart Reading'**
  String get birthChartReading;

  /// No description provided for @birthChartFor.
  ///
  /// In en, this message translates to:
  /// **'Birth Chart for {name}'**
  String birthChartFor(Object name);

  /// No description provided for @place.
  ///
  /// In en, this message translates to:
  /// **'Place: {place}'**
  String place(Object place);

  /// No description provided for @at.
  ///
  /// In en, this message translates to:
  /// **'at'**
  String get at;

  /// No description provided for @errorLoadingChart.
  ///
  /// In en, this message translates to:
  /// **'Error loading chart: {error}'**
  String errorLoadingChart(Object error);

  /// No description provided for @chartNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Chart not available.'**
  String get chartNotAvailable;

  /// No description provided for @readingGeneratedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Reading generated successfully!'**
  String get readingGeneratedSuccessfully;

  /// No description provided for @subscriptionRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'You need an active subscription to generate readings after your free reading. Subscribe to continue exploring other birth charts.'**
  String get subscriptionRequiredMessage;

  /// No description provided for @discoverHeartOfRelationship.
  ///
  /// In en, this message translates to:
  /// **'Discover the heart of a relationship through its synastry'**
  String get discoverHeartOfRelationship;

  /// No description provided for @birthChartsMustBeDifferent.
  ///
  /// In en, this message translates to:
  /// **'The two birth charts must be different'**
  String get birthChartsMustBeDifferent;

  /// No description provided for @errorLoadingSavedCharts.
  ///
  /// In en, this message translates to:
  /// **'Error loading saved charts'**
  String get errorLoadingSavedCharts;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @noSavedBirthCharts.
  ///
  /// In en, this message translates to:
  /// **'No saved birth charts'**
  String get noSavedBirthCharts;

  /// No description provided for @needTwoBirthChartsForSynastry.
  ///
  /// In en, this message translates to:
  /// **'To create a synastry you need at least two saved birth charts.'**
  String get needTwoBirthChartsForSynastry;

  /// No description provided for @oneMoreChartNeeded.
  ///
  /// In en, this message translates to:
  /// **'You have one chart. Create a second for synastry'**
  String get oneMoreChartNeeded;

  /// No description provided for @needBirthChartForPredictions.
  ///
  /// In en, this message translates to:
  /// **'You need a birth chart first for predictions'**
  String get needBirthChartForPredictions;

  /// No description provided for @createBirthChart.
  ///
  /// In en, this message translates to:
  /// **'Create birth chart'**
  String get createBirthChart;

  /// No description provided for @createFirstChart.
  ///
  /// In en, this message translates to:
  /// **'Create first chart'**
  String get createFirstChart;

  /// No description provided for @createSecondChart.
  ///
  /// In en, this message translates to:
  /// **'Create second chart'**
  String get createSecondChart;

  /// No description provided for @searchBirthCharts.
  ///
  /// In en, this message translates to:
  /// **'Search birth charts...'**
  String get searchBirthCharts;

  /// No description provided for @searchByNameOrPlace.
  ///
  /// In en, this message translates to:
  /// **'Search by name or place'**
  String get searchByNameOrPlace;

  /// No description provided for @selectFirstBirthChart.
  ///
  /// In en, this message translates to:
  /// **'Select the first birth chart'**
  String get selectFirstBirthChart;

  /// No description provided for @selectSecondBirthChart.
  ///
  /// In en, this message translates to:
  /// **'Select the second birth chart'**
  String get selectSecondBirthChart;

  /// No description provided for @creating.
  ///
  /// In en, this message translates to:
  /// **'Creating...'**
  String get creating;

  /// No description provided for @createSynastry.
  ///
  /// In en, this message translates to:
  /// **'Create synastry'**
  String get createSynastry;

  /// No description provided for @synastryDescription.
  ///
  /// In en, this message translates to:
  /// **'Synastry is the art of comparing two birth charts to understand the dynamics of a relationship.'**
  String get synastryDescription;

  /// No description provided for @transitDescription.
  ///
  /// In en, this message translates to:
  /// **'Transits are the movements of planets that, passing over natal sky positions, activate temporary astrological influences.'**
  String get transitDescription;

  /// No description provided for @birthChartDescription.
  ///
  /// In en, this message translates to:
  /// **'The birth chart is the symbolic representation of the positions of celestial bodies at the moment of birth.'**
  String get birthChartDescription;

  /// No description provided for @viewPlans.
  ///
  /// In en, this message translates to:
  /// **'View plans'**
  String get viewPlans;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @pleaseSelectBirthPlace.
  ///
  /// In en, this message translates to:
  /// **'Please select a birth place'**
  String get pleaseSelectBirthPlace;

  /// No description provided for @searching.
  ///
  /// In en, this message translates to:
  /// **'Searching...'**
  String get searching;

  /// No description provided for @searchInProgress.
  ///
  /// In en, this message translates to:
  /// **'Search in progress...'**
  String get searchInProgress;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @forSearchTerm.
  ///
  /// In en, this message translates to:
  /// **'for \"{term}\"'**
  String forSearchTerm(Object term);

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get resetPasswordTitle;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send reset link'**
  String get sendResetLink;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to login'**
  String get backToLogin;

  /// No description provided for @checkYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get checkYourEmail;

  /// No description provided for @resetLinkSent.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a password reset link to {email}'**
  String resetLinkSent(Object email);

  /// No description provided for @didntReceiveEmail.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the email?'**
  String get didntReceiveEmail;

  /// No description provided for @checkSpamFolder.
  ///
  /// In en, this message translates to:
  /// **'Please also check your spam or junk folder'**
  String get checkSpamFolder;

  /// No description provided for @resendEmail.
  ///
  /// In en, this message translates to:
  /// **'Resend email'**
  String get resendEmail;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enterNewPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirmNewPassword;

  /// No description provided for @passwordResetSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Password reset successful'**
  String get passwordResetSuccessful;

  /// No description provided for @invalidResetToken.
  ///
  /// In en, this message translates to:
  /// **'Invalid or expired reset token'**
  String get invalidResetToken;

  /// No description provided for @emailSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Email sent successfully'**
  String get emailSentSuccessfully;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcomeBack;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get createAccount;

  /// No description provided for @loginToAccount.
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get loginToAccount;

  /// No description provided for @pleaseFillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all required fields'**
  String get pleaseFillAllFields;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long'**
  String get passwordTooShort;

  /// No description provided for @loginSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Login successful!'**
  String get loginSuccessful;

  /// No description provided for @registrationSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Registration successful!'**
  String get registrationSuccessful;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @birthInfo.
  ///
  /// In en, this message translates to:
  /// **'Birth Information'**
  String get birthInfo;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @emailAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'This email address is already registered'**
  String get emailAlreadyExists;

  /// No description provided for @goToLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get goToLogin;

  /// No description provided for @chartsCountSingular.
  ///
  /// In en, this message translates to:
  /// **'1 saved analysis'**
  String get chartsCountSingular;

  /// No description provided for @chartsCountPlural.
  ///
  /// In en, this message translates to:
  /// **'{count} saved analyses'**
  String chartsCountPlural(Object count);

  /// No description provided for @birthChartsCountSingular.
  ///
  /// In en, this message translates to:
  /// **'1 saved birth chart'**
  String get birthChartsCountSingular;

  /// No description provided for @birthChartsCountPlural.
  ///
  /// In en, this message translates to:
  /// **'{count} saved birth charts'**
  String birthChartsCountPlural(Object count);

  /// No description provided for @synastriesCountSingular.
  ///
  /// In en, this message translates to:
  /// **'1 saved synastry'**
  String get synastriesCountSingular;

  /// No description provided for @synastriesCountPlural.
  ///
  /// In en, this message translates to:
  /// **'{count} saved synastries'**
  String synastriesCountPlural(Object count);

  /// No description provided for @chartRemovedFromSaved.
  ///
  /// In en, this message translates to:
  /// **'Chart removed from saved'**
  String get chartRemovedFromSaved;

  /// No description provided for @synastryRemovedFromSaved.
  ///
  /// In en, this message translates to:
  /// **'Synastry removed from saved'**
  String get synastryRemovedFromSaved;

  /// No description provided for @chartSetAsPersonal.
  ///
  /// In en, this message translates to:
  /// **'Chart set as personal'**
  String get chartSetAsPersonal;

  /// No description provided for @chartRemovedFromPersonal.
  ///
  /// In en, this message translates to:
  /// **'Chart removed from personal'**
  String get chartRemovedFromPersonal;

  /// No description provided for @viewReading.
  ///
  /// In en, this message translates to:
  /// **'View reading'**
  String get viewReading;

  /// No description provided for @generateReading.
  ///
  /// In en, this message translates to:
  /// **'Generate reading'**
  String get generateReading;

  /// No description provided for @removeFromPersonal.
  ///
  /// In en, this message translates to:
  /// **'Not my theme'**
  String get removeFromPersonal;

  /// No description provided for @setAsPersonal.
  ///
  /// In en, this message translates to:
  /// **'This is my theme'**
  String get setAsPersonal;

  /// No description provided for @removeFromSaved.
  ///
  /// In en, this message translates to:
  /// **'Remove from saved'**
  String get removeFromSaved;

  /// No description provided for @removeChart.
  ///
  /// In en, this message translates to:
  /// **'Remove chart'**
  String get removeChart;

  /// No description provided for @removeChartConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove \"{name}\" from saved charts?'**
  String removeChartConfirmation(Object name);

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noSavedCharts.
  ///
  /// In en, this message translates to:
  /// **'No saved charts'**
  String get noSavedCharts;

  /// No description provided for @noSavedChartsDescription.
  ///
  /// In en, this message translates to:
  /// **'Birth charts you save will appear here.'**
  String get noSavedChartsDescription;

  /// No description provided for @noSavedAnalyses.
  ///
  /// In en, this message translates to:
  /// **'No saved analyses'**
  String get noSavedAnalyses;

  /// No description provided for @noSavedAnalysesDescription.
  ///
  /// In en, this message translates to:
  /// **'Analyses you save will appear here.'**
  String get noSavedAnalysesDescription;

  /// No description provided for @noSavedSynastries.
  ///
  /// In en, this message translates to:
  /// **'No saved synastries'**
  String get noSavedSynastries;

  /// No description provided for @noSavedSynastriesDescription.
  ///
  /// In en, this message translates to:
  /// **'Synastries you create will appear here.'**
  String get noSavedSynastriesDescription;

  /// No description provided for @noSavedBirthChartsDescription.
  ///
  /// In en, this message translates to:
  /// **'Birth charts you save will appear here.'**
  String get noSavedBirthChartsDescription;

  /// No description provided for @personal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personal;

  /// No description provided for @readingAvailable.
  ///
  /// In en, this message translates to:
  /// **'Reading available'**
  String get readingAvailable;

  /// No description provided for @generateReadingAction.
  ///
  /// In en, this message translates to:
  /// **'Generate reading'**
  String get generateReadingAction;

  /// No description provided for @regenerateReading.
  ///
  /// In en, this message translates to:
  /// **'Regenerate reading'**
  String get regenerateReading;

  /// No description provided for @searchCharts.
  ///
  /// In en, this message translates to:
  /// **'Search charts...'**
  String get searchCharts;

  /// No description provided for @searchSynastries.
  ///
  /// In en, this message translates to:
  /// **'Search synastries...'**
  String get searchSynastries;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @googleSignInSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Successfully signed in with Google'**
  String get googleSignInSuccessful;

  /// No description provided for @googleSignUpSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Successfully signed up with Google'**
  String get googleSignUpSuccessful;

  /// No description provided for @googleSignInError.
  ///
  /// In en, this message translates to:
  /// **'Google Sign-In error: {error}'**
  String googleSignInError(Object error);

  /// No description provided for @googleSignUpError.
  ///
  /// In en, this message translates to:
  /// **'Google Sign-Up error: {error}'**
  String googleSignUpError(Object error);

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdatedSuccessfully;

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get userNotFound;

  /// No description provided for @notProvided.
  ///
  /// In en, this message translates to:
  /// **'Not provided'**
  String get notProvided;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. All your data, saved charts, and profile pictures will be permanently deleted.'**
  String get deleteAccountWarning;

  /// No description provided for @deleteAccountConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you absolutely sure you want to delete your account?'**
  String get deleteAccountConfirmation;

  /// No description provided for @typeDeleteToConfirm.
  ///
  /// In en, this message translates to:
  /// **'Type DELETE to confirm'**
  String get typeDeleteToConfirm;

  /// No description provided for @deleteConfirmationWord.
  ///
  /// In en, this message translates to:
  /// **'DELETE'**
  String get deleteConfirmationWord;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editBirthChart.
  ///
  /// In en, this message translates to:
  /// **'Edit Birth Chart'**
  String get editBirthChart;

  /// No description provided for @givenNameRequired.
  ///
  /// In en, this message translates to:
  /// **'First name is required'**
  String get givenNameRequired;

  /// No description provided for @familyNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Last name is required'**
  String get familyNameRequired;

  /// No description provided for @birthTimeRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter time or check unknown time'**
  String get birthTimeRequired;

  /// No description provided for @birthChartUpdated.
  ///
  /// In en, this message translates to:
  /// **'Birth chart updated successfully'**
  String get birthChartUpdated;

  /// No description provided for @editDaily.
  ///
  /// In en, this message translates to:
  /// **'Edit daily newsletter'**
  String get editDaily;

  /// No description provided for @editMonthly.
  ///
  /// In en, this message translates to:
  /// **'Edit monthly newsletter'**
  String get editMonthly;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @updateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Newsletter updated successfully'**
  String get updateSuccess;

  /// No description provided for @accountDeleted.
  ///
  /// In en, this message translates to:
  /// **'Account deleted successfully'**
  String get accountDeleted;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get appVersion;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @dailyPredictionsContent.
  ///
  /// In en, this message translates to:
  /// **'Your personalized daily astrological predictions.'**
  String get dailyPredictionsContent;

  /// No description provided for @monthlyPredictionsContent.
  ///
  /// In en, this message translates to:
  /// **'Your detailed monthly astrological predictions.'**
  String get monthlyPredictionsContent;

  /// No description provided for @pleaseEnterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Please enter first name'**
  String get pleaseEnterFirstName;

  /// No description provided for @pleaseEnterLastName.
  ///
  /// In en, this message translates to:
  /// **'Please enter last name'**
  String get pleaseEnterLastName;

  /// No description provided for @pleaseSelectBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Please select a birth date'**
  String get pleaseSelectBirthDate;

  /// No description provided for @pleaseSelectBirthTime.
  ///
  /// In en, this message translates to:
  /// **'Please select birth time'**
  String get pleaseSelectBirthTime;

  /// No description provided for @errorCreatingBirthChart.
  ///
  /// In en, this message translates to:
  /// **'Error creating birth chart: {error}'**
  String errorCreatingBirthChart(Object error);

  /// No description provided for @analyzing.
  ///
  /// In en, this message translates to:
  /// **'ANALYZING...'**
  String get analyzing;

  /// No description provided for @chooseAstrologicalPath.
  ///
  /// In en, this message translates to:
  /// **'Nourish to be nourished'**
  String get chooseAstrologicalPath;

  /// No description provided for @semiannual.
  ///
  /// In en, this message translates to:
  /// **'Semiannual'**
  String get semiannual;

  /// No description provided for @annual.
  ///
  /// In en, this message translates to:
  /// **'Annual'**
  String get annual;

  /// No description provided for @premiumMonthly.
  ///
  /// In en, this message translates to:
  /// **'Premium - monthly'**
  String get premiumMonthly;

  /// No description provided for @standardMonthly.
  ///
  /// In en, this message translates to:
  /// **'Standard - monthly'**
  String get standardMonthly;

  /// No description provided for @premiumSemiannual.
  ///
  /// In en, this message translates to:
  /// **'Premium - semiannual'**
  String get premiumSemiannual;

  /// No description provided for @standardSemiannual.
  ///
  /// In en, this message translates to:
  /// **'Standard - semiannual'**
  String get standardSemiannual;

  /// No description provided for @premiumAnnual.
  ///
  /// In en, this message translates to:
  /// **'Premium - annual'**
  String get premiumAnnual;

  /// No description provided for @standardAnnual.
  ///
  /// In en, this message translates to:
  /// **'Standard - annual'**
  String get standardAnnual;

  /// No description provided for @monthPeriod.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get monthPeriod;

  /// No description provided for @billedMonthly.
  ///
  /// In en, this message translates to:
  /// **'Billed monthly'**
  String get billedMonthly;

  /// No description provided for @billedSemiannually.
  ///
  /// In en, this message translates to:
  /// **'Billed every 6 months'**
  String get billedSemiannually;

  /// No description provided for @billedAnnually.
  ///
  /// In en, this message translates to:
  /// **'Billed annually'**
  String get billedAnnually;

  /// No description provided for @save20Percent.
  ///
  /// In en, this message translates to:
  /// **'Save 20%'**
  String get save20Percent;

  /// No description provided for @save40Percent.
  ///
  /// In en, this message translates to:
  /// **'Save 40%'**
  String get save40Percent;

  /// No description provided for @save33Percent.
  ///
  /// In en, this message translates to:
  /// **'Save 33%'**
  String get save33Percent;

  /// No description provided for @oneMonthFree.
  ///
  /// In en, this message translates to:
  /// **'1 month FREE'**
  String get oneMonthFree;

  /// No description provided for @fourMonthsFree.
  ///
  /// In en, this message translates to:
  /// **'4 months FREE'**
  String get fourMonthsFree;

  /// No description provided for @birthChartReadings.
  ///
  /// In en, this message translates to:
  /// **'Birth chart readings'**
  String get birthChartReadings;

  /// No description provided for @couplesChartReadings.
  ///
  /// In en, this message translates to:
  /// **'Couple\'s chart readings'**
  String get couplesChartReadings;

  /// No description provided for @horoscopeNewsletter.
  ///
  /// In en, this message translates to:
  /// **'Daily and monthly horoscope newsletter'**
  String get horoscopeNewsletter;

  /// No description provided for @sevenDaysFreeTrial.
  ///
  /// In en, this message translates to:
  /// **'7 days of free trial'**
  String get sevenDaysFreeTrial;

  /// No description provided for @startNow.
  ///
  /// In en, this message translates to:
  /// **'Start now'**
  String get startNow;

  /// No description provided for @moneyBackGuarantee.
  ///
  /// In en, this message translates to:
  /// **'30-day money-back guarantee'**
  String get moneyBackGuarantee;

  /// No description provided for @birthChartPreview.
  ///
  /// In en, this message translates to:
  /// **'Birth chart preview'**
  String get birthChartPreview;

  /// No description provided for @loginRequiredForFullReading.
  ///
  /// In en, this message translates to:
  /// **'Please login to get your complete personalized reading'**
  String get loginRequiredForFullReading;

  /// No description provided for @previewTitle.
  ///
  /// In en, this message translates to:
  /// **'Your birth chart is ready!'**
  String get previewTitle;

  /// No description provided for @backToForm.
  ///
  /// In en, this message translates to:
  /// **'Back to form'**
  String get backToForm;

  /// No description provided for @paymentProcessingError.
  ///
  /// In en, this message translates to:
  /// **'Payment processing error occurred'**
  String get paymentProcessingError;

  /// No description provided for @subscriptionActivated.
  ///
  /// In en, this message translates to:
  /// **'Subscription activated successfully!'**
  String get subscriptionActivated;

  /// No description provided for @subscriptionConfirmationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to confirm subscription. Please contact support.'**
  String get subscriptionConfirmationFailed;

  /// No description provided for @confirmingSubscription.
  ///
  /// In en, this message translates to:
  /// **'Confirming your subscription...'**
  String get confirmingSubscription;

  /// No description provided for @subscriptionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get subscriptionsTitle;

  /// No description provided for @subscriptionAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get subscriptionAmount;

  /// No description provided for @subscriptionStartDate.
  ///
  /// In en, this message translates to:
  /// **'Started'**
  String get subscriptionStartDate;

  /// No description provided for @subscriptionEndDate.
  ///
  /// In en, this message translates to:
  /// **'Renews'**
  String get subscriptionEndDate;

  /// No description provided for @subscriptionCancelsOn.
  ///
  /// In en, this message translates to:
  /// **'Cancels'**
  String get subscriptionCancelsOn;

  /// No description provided for @manageSubscription.
  ///
  /// In en, this message translates to:
  /// **'Manage subscription'**
  String get manageSubscription;

  /// No description provided for @noActiveSubscription.
  ///
  /// In en, this message translates to:
  /// **'No subscription'**
  String get noActiveSubscription;

  /// No description provided for @reactivateSubscription.
  ///
  /// In en, this message translates to:
  /// **'Reactivate'**
  String get reactivateSubscription;

  /// No description provided for @subscriptionActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get subscriptionActive;

  /// No description provided for @subscriptionTrialing.
  ///
  /// In en, this message translates to:
  /// **'Trial'**
  String get subscriptionTrialing;

  /// No description provided for @loadingSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Loading subscriptions...'**
  String get loadingSubscriptions;

  /// No description provided for @failedToLoadSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Failed to load subscriptions'**
  String get failedToLoadSubscriptions;

  /// No description provided for @paymentFailed.
  ///
  /// In en, this message translates to:
  /// **'Payment Failed'**
  String get paymentFailed;

  /// No description provided for @paymentFailedDescription.
  ///
  /// In en, this message translates to:
  /// **'Your subscription payment could not be processed. Please update your payment method to continue using our services.'**
  String get paymentFailedDescription;

  /// No description provided for @updatePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Update Payment Method'**
  String get updatePaymentMethod;

  /// No description provided for @subscriptionPastDue.
  ///
  /// In en, this message translates to:
  /// **'Payment Overdue'**
  String get subscriptionPastDue;

  /// No description provided for @subscriptionUnpaid.
  ///
  /// In en, this message translates to:
  /// **'Payment Failed'**
  String get subscriptionUnpaid;

  /// No description provided for @subscriptionIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Payment Incomplete'**
  String get subscriptionIncomplete;

  /// No description provided for @house1Alt.
  ///
  /// In en, this message translates to:
  /// **'Identity and self-expression'**
  String get house1Alt;

  /// No description provided for @house2Alt.
  ///
  /// In en, this message translates to:
  /// **'Material resources and values'**
  String get house2Alt;

  /// No description provided for @house3Alt.
  ///
  /// In en, this message translates to:
  /// **'Communication and learning'**
  String get house3Alt;

  /// No description provided for @house4Alt.
  ///
  /// In en, this message translates to:
  /// **'Family and emotional foundation'**
  String get house4Alt;

  /// No description provided for @house5Alt.
  ///
  /// In en, this message translates to:
  /// **'Creativity and self-expression'**
  String get house5Alt;

  /// No description provided for @house6Alt.
  ///
  /// In en, this message translates to:
  /// **'Work and health'**
  String get house6Alt;

  /// No description provided for @house8Alt.
  ///
  /// In en, this message translates to:
  /// **'Transformation and hidden matters'**
  String get house8Alt;

  /// No description provided for @house9Alt.
  ///
  /// In en, this message translates to:
  /// **'Higher knowledge and spirituality'**
  String get house9Alt;

  /// No description provided for @house10Alt.
  ///
  /// In en, this message translates to:
  /// **'Career and public image'**
  String get house10Alt;

  /// No description provided for @house11Alt.
  ///
  /// In en, this message translates to:
  /// **'Friendships and innovation'**
  String get house11Alt;

  /// No description provided for @house12Alt.
  ///
  /// In en, this message translates to:
  /// **'Transcendence and hidden realms'**
  String get house12Alt;

  /// No description provided for @exploreMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get exploreMore;

  /// No description provided for @cavernDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Book of Caverns'**
  String get cavernDetailsTitle;

  /// No description provided for @generalIntroduction.
  ///
  /// In en, this message translates to:
  /// **'General Introduction'**
  String get generalIntroduction;

  /// No description provided for @birthChartNotFound.
  ///
  /// In en, this message translates to:
  /// **'Birth chart not found'**
  String get birthChartNotFound;

  /// No description provided for @synastryNotFound.
  ///
  /// In en, this message translates to:
  /// **'Synastry not found'**
  String get synastryNotFound;

  /// No description provided for @goToHome.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get goToHome;

  /// No description provided for @bookOfCaverns.
  ///
  /// In en, this message translates to:
  /// **'Book of Caverns'**
  String get bookOfCaverns;

  /// No description provided for @bookOfCavernsDescription.
  ///
  /// In en, this message translates to:
  /// **'Explore the ancient Egyptian Book of Caverns and its connection to the astrological houses'**
  String get bookOfCavernsDescription;

  /// No description provided for @cavernComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Cavern {number} - Coming Soon'**
  String cavernComingSoon(Object number);

  /// No description provided for @tapToExploreCavern.
  ///
  /// In en, this message translates to:
  /// **'Tap to explore this cavern'**
  String get tapToExploreCavern;

  /// No description provided for @contentComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Content coming soon'**
  String get contentComingSoon;

  /// No description provided for @bookOfCavernsIntroduction.
  ///
  /// In en, this message translates to:
  /// **'## Egyptian Funerary Texts and Astrology\n\nThis treatment of the **12 astrological houses** is based on Egyptian funerary texts from the New Kingdom describing the sun god Ra\'s journey through the underworld, following Angelo Angelini\'s astrological interpretation.\n\n## The Two Source Texts\n\nThe twelve caverns presented here derive from two distinct Egyptian texts:\n\n### Caverns 1-6: The Book of Caverns Proper\nA Ramesside funerary text describing Ra\'s nocturnal journey through six sections of the Duat. Characterized by scenes of punishment for Ra and Osiris\'s enemies, this text is attested in its most complete versions in the tomb of Ramses VI (KV9) and the Osireion of Seti I at Abydos.\n\nContemporary Egyptology maintains that the Book of Caverns actually contains all twelve caverns, organized with multiple caverns per section ([Power, 2015](https://doi.org/10.17638/03032971)). For this astrological treatment, however, we follow Angelini\'s interpretation that assimilates each of the six sections to an astrological house.\n\n### Caverns 8-12: The Book of the Twelve Caves\nAlso known as **Spell of the Twelve Caves**, this text was long considered part of the Book of the Dead. Alexandre Piankoff demonstrated it is an independent composition with a benevolent liturgical character: deities grant favors to the deceased without scenes of punishment.\n\nThe first seven caverns of the Book of the Twelve Caves are represented in an extremely synthetic and schematic manner, providing very little information about their content, while only the last five (from 8 to 12) are described in detail.\n\nAngelo Angelini interprets the eighth cavern of the Book of the Twelve Caves as the eighth astrological house—a symbolic, not philological connection.\n\n## The Meaning of \"Cavern\"\n\nIn Egyptian: **Kerreret** or **Kerret**\n\n![Hieroglyph of Kerreret](caverna.webp)\n\nAccording to Angelo Angelini, the hieroglyph combines:\n- **Q** (triangle): matter to be worked\n- **Seeds**: time\n- **Open rectangle**: space\n\nThe term thus indicates \"a temporal space\"—the essence of astrological domification, where celestial time (planetary transits) crystallizes into earthly experience.\n\n## Sources\n\n### Book of Caverns (caverns 1-6)\n- **Philological reconstruction**: Werning, D. A. (2019). The Book of Caverns in Theban Tomb 33: Late Period reception process and individual adaptation. *Bulletin de l\'Institut français d\'archéologie orientale*, *118*, 525-554. [https://doi.org/10.4000/bifao.5059](https://doi.org/10.4000/bifao.5059)\n- **Iconographic interpretation**: Power, D. M. (2019). *Aspects of iconography and transmission in the Book of Caverns* [Doctoral dissertation]. University of Liverpool. [https://doi.org/10.17638/03032971](https://doi.org/10.17638/03032971)\n- **Iconographic source**: [Theban Mapping Project](https://thebanmappingproject.com/tombs/kv-09-rameses-v-and-rameses-vi), tomb of Ramses VI\n\n### Book of the Twelve Caves (caverns 8-12)\n- **Philological reconstruction**: Méndez Rodríguez, D. M. (2015). The transmission of the Book of the Twelve Caverns. In G. Rosati & M. C. Guidotti (Eds.), *Proceedings of the XI International Congress of Egyptologists* (pp. 405-409). Archaeopress. [https://doi.org/10.2307/j.ctv177tjnf.77](https://doi.org/10.2307/j.ctv177tjnf.77)\n- **Iconographic interpretation**: Piankoff, A. (1974). *The wandering of the soul*. Princeton University Press. [https://archive.org/details/wanderingofsoul0006pian](https://archive.org/details/wanderingofsoul0006pian)\n- **Iconographic source**: [Papyrus EA 10478](https://www.britishmuseum.org/collection/object/Y_EA10478-6), British Museum\n\n### Astrological Interpretation\n- Angelini, A. (1992). *Manuale di astrologia egizia*. Kemi.\n\n**Note**: Colors in illustrations of caverns 1-6 are suggestive and serve a communicative function to evoke the underworld atmosphere, not philological, as the originals on tomb walls are heavily deteriorated. For caverns 8-12, original colors from Papyrus EA 10478 of the British Museum have been used.'**
  String get bookOfCavernsIntroduction;

  /// No description provided for @firstCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'First cavern - The entrance portal'**
  String get firstCavernTitle;

  /// No description provided for @firstCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'The first division is composed of five registers (R) and 13 scenes (S), with a precise iconographic structure:\n\n[TABLE_CAVERNA_1]\n\n![Division structure](prima_divisione.webp)\n\nThis division begins with three serpentine guardians that Ra must convince to allow him to enter the afterlife.\n\nThis division also contains the first appearance of deities enclosed in ovals and the first appearance of Osiris in a sanctuary. It also includes elements of Osiris\' body, represented by the two discs raised above the heads of the deities and by the pieces of flesh that appear in the mounds in R4, S3. The inclusion of parts of Osiris\' body symbolizes the elements necessary for **solar-Osirian unity** - the process through which Ra (the daytime sun) and Osiris (the nighttime sun and the regenerative force of death) merge to complete the cosmic cycle of death and rebirth, allowing the daily resurrection of the sun.\n\nThe lower register is finally reserved for the punishment of the enemies of Ra and Osiris.'**
  String get firstCavernLiteralMeaning;

  /// No description provided for @firstCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## Sons of earth\n\nAt the entrance to the caverns, Ra addresses the three guardian serpents with the words: \"O son of earth\". This invocation introduces the fundamental theme of the **terrestrial dimension of domification**: astrological houses are born from the encounter between heaven (the zodiac) and earth (the horizon at the time of birth), rooting cosmic energies in the concrete reality of human experience.\n\n## Ovals as magnetic envelopes\n\nThe **ovals that enclose the deities** are traditionally identified as sarcophagi. However, at a deeper level of interpretation, they are to be interpreted as **magnetic envelopes**: auras that surround the divine entities preventing their energies from dispersing. The bodies in their sepulchers are therefore bundles of energies that resolve into matter, enveloped by this magnetic ampule.\n\n## The first house\n\nIn astrological terms, the first cavern corresponds to the **first house**: the house of the ascendant, of the self and individual identity. This cavern represents the beginning of the initiatory journey through the twelve astrological houses, where the human soul must confront terrestrial and celestial forces to complete its process of spiritual evolution.'**
  String get firstCavernEsotericMeaning;

  /// No description provided for @secondCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'Second cavern - The cavern of sustenance'**
  String get secondCavernTitle;

  /// No description provided for @secondCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'Division Two consists of five registers (R) and 10 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_2]\n\n![Structure of the second division](seconda_divisione.webp)\n\nThis division begins, like the first, with serpent doorkeepers whom Ra must convince to gain access to the Underworld. It contains various groups of ovals with solar and Osirian elements.\n\n## The catfish-headed deities\n\nThe **catfish-headed deities** (R1, S2) are called **Nariu** and are associated with the inscription: \"O Nariu, lords of sustenance, who have become as Osiris...\".\n\n## The death of Osiris\n\nThe death of Osiris is highlighted by the **deities who mourn him** (R2, S1) and by the deities who guard a **chest containing the body of Osiris** (R3, S2).'**
  String get secondCavernLiteralMeaning;

  /// No description provided for @secondCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## The cavern of nourishment\n\nAccording to Angelini, the Second Cavern has nourishment and abundance as its central theme. Ra addresses the deities: \"I illuminate you, oh afflicted ones, and make you satisfied with your sustenance\". The **Nariu** are primeval gods of abundance and nourishment, represented with catfish heads.\n\n## The second astrological house\n\nThis cavern corresponds to the **second house**: the place where the individual finds the resources necessary for their physical survival. It is the house of earnings and income, which reveals the impulse to gather and accumulate everything needed to maintain and protect material existence.'**
  String get secondCavernEsotericMeaning;

  /// No description provided for @thirdCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'Third cavern - The cavern of formative relationships'**
  String get thirdCavernTitle;

  /// No description provided for @thirdCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'Division Three consists of 3 registers (R) and 13 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_3]\n\n![Structure of the third division](terza_divisione.webp)\n\nIn this division Ra physically enters the Underworld after gaining access from the doorkeepers. This division is the starting point for the **Solar-Osirian unity**, a process necessary for the sun god Ra to be reborn in the morning. The unity is represented in the central scene (R2, S3) where the reposing ithyphallic Osiris appears with a sun disk above his erect phallus.\n\n## The catfish-headed deities\n\nIn the first register (R1, S2) appear **7 catfish-headed deities** standing under a serpent. These are associated with the text addressing the \"gods who are in the sheepfold of Neheb-Kau\".\n\n## The double sphinx Aker\n\nThe central scene shows the **double sphinx Aker** with ithyphallic Osiris encircled by a serpent, representing the moment when the unity between Ra and Osiris begins. Aker is the ancient Egyptian earth deity and guardian of the Underworld, depicted as a double sphinx that protects the sun god during his nightly journey through the afterlife.'**
  String get thirdCavernLiteralMeaning;

  /// No description provided for @thirdCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## The cavern of spiritual qualities\n\nAccording to Angelini, the Third Cavern is characterized by the presence of **Neheb-Kau**, the great primeval serpent god. His name means \"He who unites the Ka\" and is also conceptually translated as \"Bestower of dignities\", that is, he who assigns positions and honors in the afterlife. The **Ka** in Egyptian conception is the life force, the spiritual double that distinguishes the living from the dead and must be nourished and preserved to ensure continuity in the afterlife.\n\n## The unifier of attributes\n\nNeheb-Kau is called in ancient texts \"unifier of attributes\", that is, he who reunites and coordinates the different spiritual qualities and characteristics necessary for complete existence in the afterlife. He is considered the \"Ka of every god\" and his function was to endow gods and humans with life.\n\n## The third astrological house\n\nThis cavern corresponds to the **third house**: the place of gathering elements for the formation of the Spirit. It is the house of instruction, of ideas that form the new personality and of relationships with others. According to Angelini, it represents the centripetal movement directed toward acquiring qualities that nourish the Spirit.'**
  String get thirdCavernEsotericMeaning;

  /// No description provided for @divisionStructureAlt3.
  ///
  /// In en, this message translates to:
  /// **'Structure of the third division'**
  String get divisionStructureAlt3;

  /// No description provided for @divisionStructureAlt4.
  ///
  /// In en, this message translates to:
  /// **'Structure of the fourth division'**
  String get divisionStructureAlt4;

  /// No description provided for @literalMeaning.
  ///
  /// In en, this message translates to:
  /// **'Literal meaning'**
  String get literalMeaning;

  /// No description provided for @esotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'Esoteric meaning'**
  String get esotericMeaning;

  /// No description provided for @cavernDetailsNotFound.
  ///
  /// In en, this message translates to:
  /// **'Cavern details not found'**
  String get cavernDetailsNotFound;

  /// No description provided for @firstDivisionTitle.
  ///
  /// In en, this message translates to:
  /// **'First Division'**
  String get firstDivisionTitle;

  /// No description provided for @secondDivisionTitle.
  ///
  /// In en, this message translates to:
  /// **'Division Two'**
  String get secondDivisionTitle;

  /// No description provided for @table1R1S1.
  ///
  /// In en, this message translates to:
  /// **'3 coiled serpents'**
  String get table1R1S1;

  /// No description provided for @table1R1S2.
  ///
  /// In en, this message translates to:
  /// **'9 cobras'**
  String get table1R1S2;

  /// No description provided for @table1R1S3.
  ///
  /// In en, this message translates to:
  /// **'9 bull-headed deities'**
  String get table1R1S3;

  /// No description provided for @table1R2S1.
  ///
  /// In en, this message translates to:
  /// **'9 male deities in ovals'**
  String get table1R2S1;

  /// No description provided for @table1R2S2.
  ///
  /// In en, this message translates to:
  /// **'9 jackal-headed deities'**
  String get table1R2S2;

  /// No description provided for @table1R2S3.
  ///
  /// In en, this message translates to:
  /// **'Male and female deity holding a disc above their heads'**
  String get table1R2S3;

  /// No description provided for @table1R3S1.
  ///
  /// In en, this message translates to:
  /// **'11 deities'**
  String get table1R3S1;

  /// No description provided for @table1R3S2.
  ///
  /// In en, this message translates to:
  /// **'Osiris in a sanctuary with 8 male and female deities in ovals surrounding him'**
  String get table1R3S2;

  /// No description provided for @table1R4S1.
  ///
  /// In en, this message translates to:
  /// **'9 female deities standing on baskets'**
  String get table1R4S1;

  /// No description provided for @table1R4S2.
  ///
  /// In en, this message translates to:
  /// **'8 female deities in ovals'**
  String get table1R4S2;

  /// No description provided for @table1R4S3.
  ///
  /// In en, this message translates to:
  /// **'2 male deities on sides of a mound; 2 female deities on sides of a mound; Mongoose-headed deity'**
  String get table1R4S3;

  /// No description provided for @table1R5S1.
  ///
  /// In en, this message translates to:
  /// **'3 coiled serpents'**
  String get table1R5S1;

  /// No description provided for @table1R5S2.
  ///
  /// In en, this message translates to:
  /// **'16 male enemies (8 decapitated)'**
  String get table1R5S2;

  /// No description provided for @table2R1S1.
  ///
  /// In en, this message translates to:
  /// **'Serpent raised on its tail + 4 coiled serpents'**
  String get table2R1S1;

  /// No description provided for @table2R1S2.
  ///
  /// In en, this message translates to:
  /// **'4 catfish-headed deities and 8 shrewmouse-headed deities in ovals + two hawk-headed deities'**
  String get table2R1S2;

  /// No description provided for @table2R1S3.
  ///
  /// In en, this message translates to:
  /// **'7 female deities in ovals + male deity'**
  String get table2R1S3;

  /// No description provided for @table2R2S1.
  ///
  /// In en, this message translates to:
  /// **'Shrewmouse-headed deity + 9 male mourners'**
  String get table2R2S1;

  /// No description provided for @table2R2S2.
  ///
  /// In en, this message translates to:
  /// **'12 mummified male deities in ovals + ram-headed deity'**
  String get table2R2S2;

  /// No description provided for @table2R3S1.
  ///
  /// In en, this message translates to:
  /// **'Ram-headed deity + 9 male deities'**
  String get table2R3S1;

  /// No description provided for @table2R3S2.
  ///
  /// In en, this message translates to:
  /// **'4 males around the chest of Osiris + 4 ram-headed standards + 4 jackal-headed standards'**
  String get table2R3S2;

  /// No description provided for @table2R4S1.
  ///
  /// In en, this message translates to:
  /// **'Hawk-headed deity + 12 Osiride figures in ovals + male deity'**
  String get table2R4S1;

  /// No description provided for @table2R4S2.
  ///
  /// In en, this message translates to:
  /// **'Ram-headed deity + 9 ram-headed deities in ovals + 1 ram-headed deity'**
  String get table2R4S2;

  /// No description provided for @table2R5S1.
  ///
  /// In en, this message translates to:
  /// **'4 male deities with bullhorns holding knives + 16 male enemies (4 are decapitated; 4 are laying face down; last 8 are upside down)'**
  String get table2R5S1;

  /// No description provided for @table3R1S1.
  ///
  /// In en, this message translates to:
  /// **'Sun disk + 2 coiled serpents + 1 male deity in an oval'**
  String get table3R1S1;

  /// No description provided for @table3R1S2.
  ///
  /// In en, this message translates to:
  /// **'7 catfish-headed deities standing under a serpent'**
  String get table3R1S2;

  /// No description provided for @table3R1S3.
  ///
  /// In en, this message translates to:
  /// **'2 mummified ram-headed deities in mounds'**
  String get table3R1S3;

  /// No description provided for @table3R1S4.
  ///
  /// In en, this message translates to:
  /// **'3 male and female deities in ovals'**
  String get table3R1S4;

  /// No description provided for @table3R1S5.
  ///
  /// In en, this message translates to:
  /// **'Osiris in a shrine + 10 male and female deities in ovals'**
  String get table3R1S5;

  /// No description provided for @table3R2S1.
  ///
  /// In en, this message translates to:
  /// **'Ram-headed deity'**
  String get table3R2S1;

  /// No description provided for @table3R2S2.
  ///
  /// In en, this message translates to:
  /// **'4 Osiride figures'**
  String get table3R2S2;

  /// No description provided for @table3R2S3.
  ///
  /// In en, this message translates to:
  /// **'Double sphinx Aker + reposing ithyphallic Osiris encircled by a serpent'**
  String get table3R2S3;

  /// No description provided for @table3R2S4.
  ///
  /// In en, this message translates to:
  /// **'3 ovals encircled by an ouroboros serpent + 4 male deities'**
  String get table3R2S4;

  /// No description provided for @table3R2S5.
  ///
  /// In en, this message translates to:
  /// **'Mongoose-headed deity standing on a serpent + 2 male deities'**
  String get table3R2S5;

  /// No description provided for @table3R3S1.
  ///
  /// In en, this message translates to:
  /// **'4 upside down male figures + 4 upside down female figures + 1 male figure'**
  String get table3R3S1;

  /// No description provided for @table3R3S2.
  ///
  /// In en, this message translates to:
  /// **'8 upside down male enemies (4 decapitated)'**
  String get table3R3S2;

  /// No description provided for @table3R3S3.
  ///
  /// In en, this message translates to:
  /// **'4 upside down female enemies + 4 upside down ba birds'**
  String get table3R3S3;

  /// No description provided for @centralScene.
  ///
  /// In en, this message translates to:
  /// **'central scene'**
  String get centralScene;

  /// No description provided for @fourthCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'Fourth cavern - The cavern of origins'**
  String get fourthCavernTitle;

  /// No description provided for @fourthCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'Division Four consists of 3 registers (R) and 9 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_4]\n\n![Structure of the fourth division](quarta_divisione.webp)\n\nIn this division the theme of **Solar-Osirian unity** that began in Division Three continues. The theme is present in the first register (R1, S1) which shows an image of Osiris bent in a crescent shape, with a sun disk at his feet, being lifted by Isis and Nephthys.'**
  String get fourthCavernLiteralMeaning;

  /// No description provided for @fourthCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## The cavern of family\n\nAccording to Angelini, the Fourth Cavern represents the **root, paternal home, origin and hearth**. The central figures are members of the divine family: Osiris (the father), Horus (the son and heir), Isis and Nephthys (the sisters who protect and regenerate). These family relationships show how this cavern is the foundation of existence.\n\n## The fourth astrological house\n\nThis cavern corresponds to the **fourth house**: the house of family origins and ancestral roots. It is the place where the individual finds their primary identity and sense of belonging. It represents the emotional foundations on which existence is built, the family nucleus that provides security and continuity.'**
  String get fourthCavernEsotericMeaning;

  /// No description provided for @table4R1S1.
  ///
  /// In en, this message translates to:
  /// **'Human Osiris bent in crescent shape lifted by Isis and Nephthys'**
  String get table4R1S1;

  /// No description provided for @table4R1S2.
  ///
  /// In en, this message translates to:
  /// **'Anubis + human Osiris + Horus'**
  String get table4R1S2;

  /// No description provided for @table4R1S3.
  ///
  /// In en, this message translates to:
  /// **'Male deity with bull horns + 2 ovals'**
  String get table4R1S3;

  /// No description provided for @table4R2S1.
  ///
  /// In en, this message translates to:
  /// **'Ram-headed deity + 3 human Osiris figures'**
  String get table4R2S1;

  /// No description provided for @table4R2S2.
  ///
  /// In en, this message translates to:
  /// **'Horus + coiled serpent separating 2 ovals, each containing a mummiform figure'**
  String get table4R2S2;

  /// No description provided for @table4R2S3.
  ///
  /// In en, this message translates to:
  /// **'Anubis + human Osiris + ba bird'**
  String get table4R2S3;

  /// No description provided for @table4R3S1.
  ///
  /// In en, this message translates to:
  /// **'4 upside down male enemies + cat-headed deity'**
  String get table4R3S1;

  /// No description provided for @table4R3S2.
  ///
  /// In en, this message translates to:
  /// **'Lion-headed female deity + 1 female deity + 1 reposing male deity'**
  String get table4R3S2;

  /// No description provided for @table4R3S3.
  ///
  /// In en, this message translates to:
  /// **'4 upside down male enemies + male figure'**
  String get table4R3S3;

  /// No description provided for @fifthCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'Fifth cavern - The cavern of divine children'**
  String get fifthCavernTitle;

  /// No description provided for @fifthCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'Division Five represents **the beginning of the rebirth of the sun god Ra**, as clearly indicated in the ancient texts. It is structured in three registers with fourteen scenes:\n\n[TABLE_CAVERNA_5]\n\n![Structure of the fifth division](quinta_divisione.webp)\n\nThe start of the rebirth process is symbolized by the **large image of Nut** at the beginning of the division, the sky goddess who gives birth to the sun each morning.\n\nAt the center of the division appears the **large figure of ithyphallic Osiris** - Osiris depicted with an erect phallus, symbol of regenerative power and resurrection - that continues the Solar-Osirian unity process: the temporary nightly union of Ra (the sun) with Osiris (regenerative death) necessary for the sun to be reborn each morning.\n\nRebirth is further symbolized by **two seated children in an oval** (R1, S3-1), called \"The Youth Ra\" and \"The Child Ra\", representing the first manifestations of the sun god. In scene **R1, S1(2)** appear the **pieces of flesh of Osiris**, elements of the dismembered body that must be reassembled to allow resurrection.'**
  String get fifthCavernLiteralMeaning;

  /// No description provided for @fifthCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## The fifth astrological house\n\nThis cavern corresponds to the **fifth house**: the house of love, creativity and generation. It is the place where vital energy expresses itself through creation, both material and spiritual. It represents children, artistic expression and everything born from the individual\'s creative impulse.'**
  String get fifthCavernEsotericMeaning;

  /// No description provided for @table5Division.
  ///
  /// In en, this message translates to:
  /// **'Fifth Division'**
  String get table5Division;

  /// No description provided for @table5R1S1P1.
  ///
  /// In en, this message translates to:
  /// **'Human Osiris + 4 standing serpents with human heads'**
  String get table5R1S1P1;

  /// No description provided for @table5R1S2P1.
  ///
  /// In en, this message translates to:
  /// **'Tatenen flanked by 2 male deities'**
  String get table5R1S2P1;

  /// No description provided for @table5R1S3P1.
  ///
  /// In en, this message translates to:
  /// **'Male deity + 2 ovals'**
  String get table5R1S3P1;

  /// No description provided for @table5R1S1P2.
  ///
  /// In en, this message translates to:
  /// **'Oval flanked by a male deity and a ram-headed deity'**
  String get table5R1S1P2;

  /// No description provided for @table5R2S1P1.
  ///
  /// In en, this message translates to:
  /// **'4 hawk-headed mummies + Anubis + oval'**
  String get table5R2S1P1;

  /// No description provided for @table5R2S2P1.
  ///
  /// In en, this message translates to:
  /// **'4 female deities each in an oval'**
  String get table5R2S2P1;

  /// No description provided for @table5R2S1P2.
  ///
  /// In en, this message translates to:
  /// **'Ram-headed deity + female deity'**
  String get table5R2S1P2;

  /// No description provided for @table5R2S2P2.
  ///
  /// In en, this message translates to:
  /// **'Human Osiris with Horus with a ram head between them'**
  String get table5R2S2P2;

  /// No description provided for @table5R3S1P1.
  ///
  /// In en, this message translates to:
  /// **'Female deity holding a pole in each hand, with 2 kneeling male enemies in front of them'**
  String get table5R3S1P1;

  /// No description provided for @table5R3S2P1.
  ///
  /// In en, this message translates to:
  /// **'Serpent headed (?) figure kneeling in front of a cauldron containing 4 heads and 4 hearts'**
  String get table5R3S2P1;

  /// No description provided for @table5R3S3P1.
  ///
  /// In en, this message translates to:
  /// **'2 cobras on either side of a cauldron containing 4 upside down decapitated male enemies'**
  String get table5R3S3P1;

  /// No description provided for @table5R3S1P2.
  ///
  /// In en, this message translates to:
  /// **'2 kneeling female deities on either side of a cauldron containing 4 upside down ba birds + 4 fans'**
  String get table5R3S1P2;

  /// No description provided for @largeIthyphallicOsiris.
  ///
  /// In en, this message translates to:
  /// **'Large Ithyphallic Osiris'**
  String get largeIthyphallicOsiris;

  /// No description provided for @largeNut.
  ///
  /// In en, this message translates to:
  /// **'Large Nut'**
  String get largeNut;

  /// No description provided for @swipeToView.
  ///
  /// In en, this message translates to:
  /// **'Swipe to view'**
  String get swipeToView;

  /// No description provided for @sixthCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'Sixth cavern - The cavern of service'**
  String get sixthCavernTitle;

  /// No description provided for @sixthCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'Division Six represents **the completion of the rebirth process** begun in the fifth division. It is structured in three registers with thirteen scenes:\n\n[TABLE_CAVERNA_6]\n\n![Structure of the sixth division](sesta_divisione.webp)\n\nThe central theme is the **imminent birth of the sun god Ra**. This is symbolized by the figure of the **scarab beetle emerging from between two mounds** (R2, S1), an image representing the sun god about to be born after completing his nightly journey through the Underworld.\n\nThe division also contains other figures connected to rebirth: the image of **Tatenen** (R2, S3), funerary deity representing the land that emerged from primordial Chaos, creator of primordial energy, **rams** (R1, S2) and **ram heads** (R1, S3 and R2, S3), all symbols associated with the sun god and the regenerative process.\n\nThe lower register maintains the customary representation of **decapitated enemies** (R3, S1), symbolizing the defeat of the forces of chaos that oppose solar rebirth.'**
  String get sixthCavernLiteralMeaning;

  /// No description provided for @sixthCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## The sixth astrological house\n\nThis cavern corresponds to the **sixth house**: the house of work, health and service, which **ends the dark zone of domification**. It is the house of **defeating chaos**, symbolized by the decapitated heads (R3, S1) representing the forces of disorder definitively vanquished.\n\nThe Sixth House represents the **fulcrum of spiritual transformation through sacrifice**. It is the place where, through discipline, service and acceptance of difficulties, the individual defeats inner chaos and can access higher planes of awareness. Just as Ra is reborn every morning after defeating the forces of nightly chaos, so sacrifice becomes an instrument of regeneration, transforming suffering into spiritual growth.'**
  String get sixthCavernEsotericMeaning;

  /// No description provided for @table6Division.
  ///
  /// In en, this message translates to:
  /// **'Sixth Division'**
  String get table6Division;

  /// No description provided for @table6R1S1.
  ///
  /// In en, this message translates to:
  /// **'Anubis standing between two ovals, each containing a mummified deity + a ba bird on top of each oval'**
  String get table6R1S1;

  /// No description provided for @table6R1S2.
  ///
  /// In en, this message translates to:
  /// **'Anubis + three ovals'**
  String get table6R1S2;

  /// No description provided for @table6R1S3.
  ///
  /// In en, this message translates to:
  /// **'2 female deities flanking 2 ovals'**
  String get table6R1S3;

  /// No description provided for @table6R1S4.
  ///
  /// In en, this message translates to:
  /// **'Osiris-Orion standing on top of a mound containing a decapitated enemy + male deity + hawk sitting on top of a mound'**
  String get table6R1S4;

  /// No description provided for @table6R2S1.
  ///
  /// In en, this message translates to:
  /// **'Scarab emerging between 2 mounds + 4 male deities'**
  String get table6R2S1;

  /// No description provided for @table6R2S2.
  ///
  /// In en, this message translates to:
  /// **'Scarab surrounded by a serpent + 2 male deities in ovals'**
  String get table6R2S2;

  /// No description provided for @table6R2S3.
  ///
  /// In en, this message translates to:
  /// **'Mound with coiled serpent and ram head emerging + Tatenen in a mound emerging from the ground + 2 male deities'**
  String get table6R2S3;

  /// No description provided for @table6R2S4.
  ///
  /// In en, this message translates to:
  /// **'2 deities in ovals'**
  String get table6R2S4;

  /// No description provided for @table6R2S5.
  ///
  /// In en, this message translates to:
  /// **'4 decapitated enemies in ovals'**
  String get table6R2S5;

  /// No description provided for @table6R3S1.
  ///
  /// In en, this message translates to:
  /// **'4 decapitated enemies + male and female deities with knives + female deity'**
  String get table6R3S1;

  /// No description provided for @table6R3S2.
  ///
  /// In en, this message translates to:
  /// **'2 Anubis-headed female deities + 4 female enemies'**
  String get table6R3S2;

  /// No description provided for @table6R3S3.
  ///
  /// In en, this message translates to:
  /// **'Male and female deities + 4 kneeling male enemies'**
  String get table6R3S3;

  /// No description provided for @table6R3S4.
  ///
  /// In en, this message translates to:
  /// **'Osiris emerging from between a serpent + 2 upside down male figures with their heads in the ground'**
  String get table6R3S4;

  /// No description provided for @seventhCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'Seventh cavern - The cavern of the sacred union'**
  String get seventhCavernTitle;

  /// No description provided for @seventhCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'Following Angelo Angelini\'s interpretation, the **first six caverns** correspond to the six sections of the Book of the Twelve Caverns in the Osireion at Abydos, while the **other caverns are represented only in papyri**.\n\nAccording to this interpretation, the Seventh Cavern has **no attestation** in either source: it is absent from the Osireion reliefs and **\"Manca nei Papiri\"** (\"Missing in the Papyri\") as Angelini explicitly states.'**
  String get seventhCavernLiteralMeaning;

  /// No description provided for @seventhCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## The seventh astrological house\n\nThis cavern corresponds to the **seventh house**: the house of partnerships, marriage, open enemies, and legal contracts. However, according to Angelini, **\"Della settima casa nulla si può dire poichè non si hanno elementi di discusione\"** (\"Of the seventh house nothing can be said since there are no elements for discussion\").\n\n## The passage from night to day\n\nThe seventh cavern represents **the passage from the nocturnal to the diurnal part of domification**, namely that below the ascendant line and that above the ascendant line. The complete absence of this cavern from all sources - both the Osireion reliefs and the papyri - keeps hidden the esoteric meaning of this transitional house.'**
  String get seventhCavernEsotericMeaning;

  /// No description provided for @eighthCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'Eighth cavern - The cavern of transformation'**
  String get eighthCavernTitle;

  /// No description provided for @eighthCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'The Eighth Cavern, called **\"She who protects the Souls, She who judges, distinguishing truth from falsehood\"**, is organized into **seven groups of deities**, each with specific functions in the divine organization of the Netherworld.\n\n![Structure of the eighth division](ottava_divisione.webp)\n\n## Different representations across sources\n\nAncient sources present two modes of representation:\n\n- **In the Osireion at Abydos**: Each group is depicted *in extenso* with all deities (generally four per group) shown in procession\n- **In papyri** (such as British Museum 10.478 shown above): **Each group is symbolically represented by a single figure inscribed in a rectangle**, with the number of group members indicated below the figure. This single deity represents the entire collective.\n\n## The Seven Groups of Deities\n\n### Group 1: \"Those who carry [the ones who are seated] upon them\"\n**Papyrus representation**: A deity walking carrying a female child seated on the shoulder, with the number \"4\" below.\n**Meaning**: Four deities who guarantee the deceased \"sees Ra at his rising\" and follows him \"in Ra\'s bark.\"\n\n### Group 2: \"Those who carry the ones who are [seated] upon them\"\n**Papyrus representation**: A deity carrying a male child seated on the shoulder, with the number \"4\".\n**Meaning**: Four deities who transport specifically male seated figures, granting the same benefits as the first group.\n\n### Group 3: \"Those who mourn for Ra\"\n**Papyrus representation**: A goddess prostrate face down with hair locks hanging before her face and hands raised, with the number \"4\".\n**Meaning**: Four figures who guarantee \"offerings come to the deceased as they come to Ra\'s followers at his setting.\"\n\n### Group 4: \"Those who carry gifts\"\n**Papyrus representation**: A goddess prostrate face down with hands raised, with the number \"4\".\n**Meaning**: Four figures who hold round bread and grant the deceased to \"be like those who are in the Netherworld.\"\n\n### Group 5: \"The Tired Ones\"\n**Papyrus representation**: A goddess prostrate with hair before her face and hands raised inward.\n**Meaning**: Four figures who allow the deceased to \"pass through the Wide Hall of the Two Truths.\"\n\n### Group 6: \"Those who render homage\"\n**Papyrus representation**: A bowing god, with the number \"4\".\n**Meaning**: Four deities who guarantee the deceased can \"follow Ra in his bark.\"\n\n### Group 7: \"Those who carry offerings\"\n**Papyrus representation**: A god walking holding a conical object.\n**Meaning**: Four deities who grant \"offerings and food to the deceased in the Necropolis.\"'**
  String get eighthCavernLiteralMeaning;

  /// No description provided for @eighthCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## The cavern of divine assistance and spiritual discernment\n\nAccording to Angelini, the Eighth Cavern represents first and foremost **divine assistance for spiritual ascension**. The deities who \"carry those seated upon them to heaven\" concretely symbolize how higher spiritual forces provide a vehicle of elevation through profound introspection.\n\n## Discernment between truth and falsehood\n\nThe cavern\'s very name - \"She who judges, distinguishing truth from falsehood\" - reveals its essential function. The deities described as \"judges of souls\" represent not an external tribunal, but the **inner discernment process** that every spiritual seeker must develop. The prostrate figures (Groups 3, 4, 5) show the dangers of this search: \"Those who mourn for Ra\" warn of possible deviations in metaphysical studies and afterlife research.\n\n## The duality of spiritual and material resources\n\nWhile the second cavern governs earnings from one\'s own work, the eighth rules **resources received through others**: \"Those who carry gifts\" and \"Those who carry offerings\" (Groups 4 and 7) indicate both material gifts (inheritances, legacies) and transformative experiences that arrive unexpectedly. Angelini specifies that these \"gifts\" may also derive from marriage to wealthier individuals.\n\n## The danger of occult research\n\nThe prostrate figures represent the **death-bringing significance of the eighth house**: research in supernatural studies carries real risks. \"The Tired Ones\" (Group 5) symbolize \"those who reach life\'s end\" for having incorrectly traveled the path of hidden knowledge. However, those who succeed in \"distinguishing truth from falsehood\" can \"pass through the Wide Hall of the Two Truths.\"\n\n## The eighth house as alchemical process\n\nThis cavern represents the **alchemical process of death and rebirth** - the dissolution of old forms to allow new spiritual growth. It is the house of radical transformation, where investigation into \"hidden things\" can lead to both illumination and spiritual destruction.'**
  String get eighthCavernEsotericMeaning;

  /// No description provided for @ninthCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'Ninth cavern - The cavern of divine wisdom'**
  String get ninthCavernTitle;

  /// No description provided for @ninthCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'The Ninth Cavern, called **\"She of mysterious forms, who cuts off the [vital] air\"**, is organized into **twenty groups of deities**, the most complex among all caverns.\n\n![Structure of the ninth division](nona_divisione.webp)\n\n## Different representations across sources\n\nAs with the Eighth Cavern, sources present two modes:\n- **In the Osireion at Abydos**: Each group shown with all deities\n- **In papyri**: Symbolic representation with one figure per group\n\n## The Twenty Groups of Deities\n\n### Group 1: \"The gods who are in their shrines above the Watery Abyss\"\n**Representation**: Mummified figure of Osiris with Upper Egyptian crown in shrine with serpents, number \"14\".\n**Meaning**: Fourteen deities who guarantee the deceased \"may drink from the middle of the stream\".\n\n### Group 2: \"The gods and goddesses who are in the following of Osiris\"\n**Representation**: Standing goddess followed by god with scepter, number \"24\".\n**Meaning**: Twenty-four deities (12 gods and 12 goddesses) who enable the deceased to \"repose with his mummy\".\n\n### Group 3: \"The Standing One\"\n**Representation**: Striding god with scepter, number \"1\".\n**Meaning**: One deity who guarantees the deceased \"may adore Ra at his rising\".\n\n### Groups 4, 6-7: Taurine Deities\n**Group 4**: \"Amun-Osiris\" - Bull on standard with uraeus who grants \"power in the Wide Hall of Geb\". The **uraeus** is the sacred rearing cobra, symbol of sovereignty and divine protection, that adorned pharaohs\' foreheads and represented the goddess Wadjet.\n**Group 6**: \"He who nourishes Osiris\" - Bull on standard carried by mummiform god, grants bread and beer to the deceased\n**Group 7**: \"He who makes Osiris inaccessible\" - Bull on standard that protects Osiris in the underworld, grants mastery of steps in the Holy Place\n\n### Group 5: \"The Mysterious One\"\n**Representation**: Standing mummiform god.\n**Meaning**: Deity who guarantees the deceased \"an enduring and healthy body\".\n\n### Groups 8-11: Protective Deities\n**Group 8**: \"The Protector\" - Mummiform god who does not allow evil to approach the deceased\n**Group 9**: \"He who Tows Osiris\" - Deity who guides Osiris through the afterlife, allows seeing Ra\n**Group 10**: \"The Dark One\" - Mummiform god who grants glory on earth and power in the West\n**Group 11**: \"He-who-is-between-the-two-eyes\" - Crocodile-headed god who brings the deceased before the sacred braziers\n\n### Groups 12-14: Hidden-Armed Figures\n**Group 12**: \"The assistants of Osiris\" - Four mummified goddesses who accompany the deceased beside the Great God of the West\n**Group 13**: \"Those with hidden arms\" (masculine) - Four mummiform gods with arms concealed under garments, guarantee the deceased remains in the Necropolis forever\n**Group 14**: \"Those with hidden arms\" (feminine) - Four mummified goddesses with concealed arms, ensure prosperity and lasting offerings\n\n### Groups 15-20: Specialized Deities\n**Group 15**: \"He who hides the limbs\" - God with scepter\n**Group 16**: \"The Souls who come forth\" - Four birds on trees\n**Group 17**: \"Those of the sycamores\" - Four mummified gods\n**Group 18**: \"He of the Repugnant Face\" - Mummiform god\n**Group 19**: \"The Bright Ones\" - Nine gods with solar disks\n**Group 20**: \"Those who rest on their beds\" - Nine reclining gods'**
  String get ninthCavernLiteralMeaning;

  /// No description provided for @ninthCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## The cavern of metaphysical order and profound religiosity\n\nAccording to Angelini, the Ninth Cavern represents the **metaphysical, religious, juridical, and mystical order**. Group 1 - \"The gods in their temples above the Watery Abyss\" - immediately reveals the **profound religiosity** of this house, where the mummified figure of Osiris in the temple establishes the sacred and spiritual character of the domain.\n\n## The higher spiritual principles\n\nThe deities \"in their temples above the Waters of the Abyss (Nu)\" (Group 1) represent the **higher spiritual principles** that govern from above. These fourteen gods who allow one to \"drink from the middle of the stream\" symbolize access to higher knowledge through **elevated consciousness** that transcends the chaotic primordial waters.\n\n## The duality of divine justice\n\nThe numerous groups (5, 8, 10, 12, 13, 14, 17) that Angelini identifies as the realm of justice show the **dual nature** of this cavern. The \"Hidden-Armed Figures\" (Groups 12-14) represent those who have lost worldly means: the \"gods without hands\" symbolize loss of work and material means. However, through this loss one can reach **higher knowledge** - the mystic\'s path that gains spiritual wealth through material renunciation.\n\n## Magical power and earthly justice\n\nThe bulls on standards with uraeus (Groups 4, 6, 7) who \"give power to Osiris in heaven and earth\" represent **magical power** operating through natural forces. This can manifest both as divine justice and as **loss of freedom** through earthly tribunal judgments. The \"Protective Deities\" (Groups 8-11) show how moral discipline and spiritual ascension allow one to reach **self-knowledge** through infinite trials: illness, infirmities, worldly losses.\n\n## Spiritual religion through adversity\n\n\"The Souls who come forth\" (Group 16) and \"The Bright Ones\" (Group 19) indicate the positive result of the spiritual path, while \"He of the Repugnant Face\" (Group 18) warns of the dangers of deviation. The house reveals how through **moral discipline and spiritual ascension** one can reach authentic spiritual religion, transforming trials into higher wisdom.\n\n## The ninth astrological house\n\nThis cavern corresponds to the **ninth house**: the house of philosophy, religion, law, higher studies, and long journeys. Angelini clearly identifies this domain as the realm of **metaphysical, religious, juridical, and mystical order**. Here both divine and earthly justice manifest - the tribunals that can take away freedom, but also the moral discipline that leads to spiritual liberation. It is the house where one accesses **higher knowledge** through direct experience of spiritual trials, transforming adversity into wisdom.'**
  String get ninthCavernEsotericMeaning;

  /// No description provided for @tenthCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'Tenth cavern - The cavern of sacred clamor'**
  String get tenthCavernTitle;

  /// No description provided for @tenthCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'The Tenth Cavern, called **\"the Clamorous One whose mysteries are sacred\"**, contains **eight groups of deities** embodying themes of divine illumination and sacred protection.\n\n![Structure of the tenth division](decima_divisione.webp)\n\n## The cavern\'s name\n\nThe name \"the Clamorous One\" refers to the ritual sounds and sacred invocations that resonate in this domain, while \"whose mysteries are sacred\" emphasizes the inviolable nature of the divine secrets guarded here.\n\n## Differences between ancient sources\n\nAs with other caverns in the Book of the Twelve Caverns, two modes of representation exist:\n\n**In the Osireion at Abydos** (Seti I\'s underground temple): Each group is represented with all its deities - for example, the first group shows eight striding gods arranged in two registers, the second group shows eight goddesses pouring water, and so forth.\n\n**In funerary papyri** (such as British Museum 10.478): For space economy, each group is represented by **a single symbolic figure** accompanied by a number indicating how many deities it represents. Thus a single goddess pouring water with the number \"8\" represents the entire group of eight goddesses.\n\n## The Eight Groups of Deities\n\n### Group 1: \"Those who belong to the light\"\n**Representation**: Eight striding gods arranged in two registers (in the Osireion).\n**Meaning**: Eight solar deities who guarantee the deceased \"may see Ra at his rising\" and participate in divine luminosity.\n\n### Group 2: \"Those who seize\"\n**Representation**: Eight goddesses pouring water from vessels topped with Anubis heads (in the Osireion).\n**Meaning**: Eight female deities who \"seize\" souls, guaranteeing the deceased \"may be in jubilation\".\n\n### Group 3: \"The Ennead who guard those who are in the earth\"\n**Representation**: Nine mummified gods lying on ritual beds.\n**Meaning**: Nine guardians who watch over the dead, granting \"the breath of life on earth and in the Necropolis\".\n\n### Group 4: \"The Ennead of those whose arm is hidden\"\n**Representation**: Nine standing mummiform gods (in the Osireion, eight gods spitting water).\n**Meaning**: Nine deities with concealed arms who guarantee the deceased \"may be glorious as the accomplished spirits\".\n\n### Group 5: \"The Mysterious One\"\n**Representation**: A standing goddess, sometimes with the Eye of Horus (Wedjat).\n**Meaning**: A female deity who causes \"the soul to endure and the body to prosper like those of the gods in the netherworld\".\n\n### Group 6: \"The souls of the gods who came into being from the limbs of Osiris\"\n**Representation**: Thirty-one (or twenty-one in papyri) recumbent deities, organized in groups.\n**Meaning**: Divine souls emanated from Osiris\'s body, who grant \"peace\" to the deceased.\n\n### Group 7: \"The Adorers\"\n**Representation**: Four striding gods.\n**Meaning**: Four adorers of Ra who ensure \"there is no opposition to the deceased at any gate of the netherworld\".\n\n### Group 8: \"Those with repulsive faces\"\n**Representation**: Four striding gods (sometimes represented as a goddess).\n**Meaning**: Four terrifying-looking deities who paradoxically grant \"refreshment in the place of heat\".'**
  String get tenthCavernLiteralMeaning;

  /// No description provided for @tenthCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## The cavern of worldly achievement and divine recognition\n\nAccording to Angelini, the Tenth Cavern is **associated with solar illumination** and demonstrates how **elevation and popularity are achievable through sacrifice**, revealing that social position results from sustained effort and divine favor.\n\n## The sacred clamor and inviolable mysteries\n\nThe name \"the Clamorous One whose mysteries are sacred\" reveals this house\'s paradoxical nature: **public success** (the clamor) must coexist with **protection of inner mysteries** (the sacred). \"Those who belong to the light\" (Group 1) represent the illumination that comes from achieving social position and guarantee one \"may see Ra at his rising\".\n\n## The vigilant divine council\n\n\"The Ennead who guard those who are in the earth\" (Group 3) represents the **cosmic oversight** that governs worldly success. These nine guardians lying on ritual beds show how earthly power requires constant vigilance and divine protection. Their gift of \"the breath of life\" indicates that true authority derives from alignment with cosmic vital forces.\n\n## The paradox of hidden power\n\n\"The Ennead of those whose arm is hidden\" (Group 4) reveals a profound teaching: **true power is often exercised invisibly**. The concealed arms symbolize influence operating behind the scenes, subtle diplomacy, and the wisdom of not displaying all one\'s capabilities. This group guarantees being \"glorious as the accomplished spirits,\" indicating that true glory derives from inner mastery, not ostentation.\n\n## Transformation through sacrifice\n\n\"The souls of the gods who came into being from the limbs of Osiris\" (Group 6) - thirty-one deities emanated from the dismembered body of the god - teach that **lasting success requires sacrifice and transformation**. As Osiris was dismembered and reassembled, so those who aspire to power must be willing to sacrifice parts of themselves to be reborn in a higher form. The number 31 (or 21) suggests the days of the lunar month, indicating cycles of rise and fall in power.\n\n## Refreshment in the place of heat\n\n\"Those with repulsive faces\" (Group 8) who paradoxically grant \"refreshment in the place of heat\" reveal a profound truth: the **most difficult challenges** (the repulsive faces) in achieving and maintaining power can bring the greatest relief and satisfaction. The \"place of heat\" represents the pressure and stress of elevated positions, while \"refreshment\" is the inner peace that comes from overcoming such trials.\n\n## The tenth astrological house\n\nThis cavern corresponds to the **tenth house**: the house of career, reputation, public status, and social achievement. It represents the **culmination of earthly ambitions** when aligned with divine will. The groups of deities show that true success requires: illumination (Group 1), ability to \"seize\" opportunities (Group 2), divine protection (Group 3), hidden wisdom (Group 4), personal mystery (Group 5), transformative sacrifice (Group 6), devotion (Group 7), and the ability to transform adversities into blessings (Group 8).'**
  String get tenthCavernEsotericMeaning;

  /// No description provided for @eleventhCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'Eleventh cavern - The cavern of the weary protector'**
  String get eleventhCavernTitle;

  /// No description provided for @eleventhCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'The Eleventh Cavern, called **\"She who covers the Tired One, who conceals that which is hidden\"**, contains **eighteen groups of deities** embodying themes of protection, regeneration, and spiritual support.\n\n![Structure of the eleventh division](undicesima_divisione.webp)\n\n## The cavern\'s name\n\nThe name reveals this dwelling\'s protective nature: \"She who covers the Tired One\" refers to divine care for those weary from spiritual journey, while \"who conceals that which is hidden\" indicates protection of sacred mysteries.\n\n## Differences between ancient sources\n\nAs in other caverns:\n\n**In the Osireion at Abydos**: Each group is shown with all its deities - for example, the ninth group shows nine jackals on standards, the tenth group shows nine prostrate mourning goddesses.\n\n**In funerary papyri**: Symbolic representation with one figure per group and an indicative number - a single jackal with \"9\" representing the nine guardians.\n\n## The Eighteen Groups of Deities\n\n### Group 1: \"The Swallower\"\n**Representation**: Standing goddess with upright serpent before her, number \"1\".\n**Meaning**: A goddess who guarantees \"prosperity, life, stability and wealth for the Great God in the netherworld\".\n\n### Group 2: \"The Soul of the West\"\n**Representation**: Striding god with scepter, number \"1\".\n**Meaning**: One deity who guarantees \"an invocation offering in the Necropolis\".\n\n### Group 3: \"The Souls of the Earth\"\n**Representation**: Four striding gods.\n**Meaning**: Four deities who grant \"all pure things on earth and before the Great God\".\n\n### Group 4: \"Those who acclaim\"\n**Representation**: Four striding gods with raised arms.\n**Meaning**: Four deities who \"acclaim so that Osiris may be at ease among those in heaven\".\n\n### Group 5: \"The Ennead of the Ruler of the West\"\n**Representation**: Nine mummified gods lying on beds (on serpents in the Osireion).\n**Meaning**: Nine guardians who watch over the western realm of the dead.\n\n### Group 6: \"The Ennead in the following of Ra\"\n**Representation**: Nine mummified gods with hidden arms, lying on serpents and beds.\n**Meaning**: Nine deities who accompany Ra on his journey.\n\n### Group 7: \"Ikh\" (cryptic name)\n**Representation**: Striding god with scepter, number \"1\".\n**Meaning**: Deity who guarantees being \"at the side of the Great God when he traverses the sky\".\n\n### Group 8: \"The Vivifiers of Osiris\" (uncertain name)\n**Representation**: Four standing mummiform gods.\n**Meaning**: Deities who give life to Osiris.\n\n### Group 9: \"The Ennead of Watchers\"\n**Representation**: Nine jackals on standards (in the Osireion).\n**Meaning**: Nine guardians who \"protect Osiris\'s awakening so he may never be annihilated\".\n\n### Group 10: \"The Ennead of Mourners\"\n**Representation**: Nine prostrate goddesses with hair before faces and hands raised.\n**Meaning**: Nine goddesses who \"grant the deceased the same ritual mourning that was done for the god Osiris\", ensuring the same funerary honors that enabled divine resurrection.\n\n### Group 11: \"The Summoner\"\n**Representation**: Striding god with one hand raised, number \"1\".\n**Meaning**: Deity who \"summons Osiris before Ra near his ennead\".\n\n### Group 12: \"Iqeheren\" (divine name)\n**Representation**: Striding god with scepter, number \"1\".\n**Meaning**: Deity who \"drives away all evil from Osiris forever\".\n\n### Group 13: \"Sacred Head\"\n**Representation**: Coiled cobra with woman\'s head, number \"1\".\n**Meaning**: Sacred serpent who \"helps Osiris to have power over the waters\".\n\n### Group 14: \"Those who are in the Sacred Head\"\n**Representation**: Three standing mummiform gods (four in the Osireion).\n**Meaning**: Deities who \"help Osiris to enter and exit freely, to move as Lord of the netherworld\".\n\n### Group 15: \"The Enveloper\"\n**Representation**: Coiled cobra, number \"1\".\n**Meaning**: Serpent who wraps and protects.\n\n### Group 16: \"Those who are in the Enveloper\"\n**Representation**: Four striding gods.\n**Meaning**: Deities who enable one to \"walk unhindered in the sacred place\".\n\n### Group 17: \"The Ennead of those who conceal Osiris\"\n**Representation**: Nine kneeling gods looking back (in the Osireion), prostrate goddess looking back (in papyri).\n**Meaning**: Nine deities who \"grant that Osiris be happy in the place he desires\".\n\n### Group 18: \"Ferocious Face\"\n**Representation**: Standing mummiform god, number \"1\".\n**Meaning**: Deity who \"opens the eyes to Osiris so he can see Ra\'s light\".'**
  String get eleventhCavernLiteralMeaning;

  /// No description provided for @eleventhCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## The cavern of spiritual friendship\n\nAccording to Angelini, the Eleventh Cavern **\"She who covers the Tired One, who conceals that which is hidden\"** reveals its **friendly characteristics** while encompassing both the **joys and sorrows that friendships can bring** in both material and spiritual domains.\n\n## Divine support and protection of the weary soul\n\nThe cavern\'s name reveals its fundamental role: \"She who covers the Tired One\" refers to **divine protection for the soul weary** from the long spiritual journey. \"The Swallower\" (Group 1) and \"The Soul of the West\" (Group 2) represent forces that **welcome and sustain** those needing rest and regeneration. \"Those who acclaim\" (Group 4) show the **celestial companionship** that encourages the soul toward peace.\n\n## Regeneration through sacred mourning\n\n\"The Ennead of Mourners\" (Group 10) and \"The Ennead of Watchers\" (Group 9) reveal a profound aspect: the **regenerative power of shared sorrow**. As the goddesses weep for Osiris guaranteeing his resurrection, so authentic friendships traverse trials together, transforming suffering into spiritual strength. The nine jackals on standards \"protect the awakening\" showing how true friends watch over our spiritual rebirth.\n\n## The serpents of the Enveloper: protection and transformation\n\n\"The Enveloper\" (Group 15) and \"Those who are in the Enveloper\" (Group 16) show how **apparent constraints** can become protection. Like the serpent Mehen that wraps Osiris to protect him, so the limitations imposed by authentic friendships become means of spiritual growth.\n\n## Material and spiritual benefits\n\nAngelini specifies that this cavern governs **\"financial situations dependent on the influence of protections and legacies from friends, or strokes of fortune\"**. The protective groups show how spiritual friendships manifest concretely: \"The Souls of the Earth\" (Group 3) grant \"pure things,\" while \"The Summoner\" (Group 11) brings together the right people at the right time.\n\n## The eleventh astrological house\n\nThis cavern corresponds to the **eleventh house**: the house of friendship, hopes, wishes, and **deep scientific and philosophical interests**. Through authentic friendships the soul can reach higher levels of understanding, passing from shared trials (the mourning) to spiritual freedom and transformative protection (the Enveloper).'**
  String get eleventhCavernEsotericMeaning;

  /// No description provided for @twelfthCavernTitle.
  ///
  /// In en, this message translates to:
  /// **'Twelfth cavern - The cavern of the final shore'**
  String get twelfthCavernTitle;

  /// No description provided for @twelfthCavernLiteralMeaning.
  ///
  /// In en, this message translates to:
  /// **'The Twelfth Cavern, called **\"She who unites the gods and embraces their manifestations\"**, contains **nine groups of deities** organized around the theme of the sacred shore as the final boundary of the netherworld.\n\n![Structure of the twelfth division](dodicesima_divisione.webp)\n\n## The Nine Groups of Deities\n\n### Groups 1-2, 4-6: The Shore Deities\n\n**Group 1: \"He who controls the shore\"** - A striding deity with scepter who guarantees the deceased \"may be Lord of the Island of the Just.\"\n\n**Group 2: \"The gods who are on the shore of the netherworld\"** - Thirteen deities (in the Osireion) symbolically represented by one figure in papyri, who grant \"truth in the Wide Hall of the Two Truths.\"\n\n**Group 4: \"The gods who belong to the shore\"** - Four mummified deities who \"give an island in the Fields of Iaru.\"\n\n**Group 5: \"The Chief of the shore\"** - A deity with scepter who grants \"an endowment in the Field of Offerings.\"\n\n**Group 6: \"The gods who are on the shore\"** - Eight deities (four in papyri) who guarantee \"offerings, food, and a great quantity of meat in the Necropolis.\"\n\n### Group 7: The Mysterious Heads\n\n**\"The Mysterious Heads on the shore\"** - Eleven ram\'s heads mounted on staffs (in the Osireion), symbolically represented by a single head in papyri. They grant \"their protection as it is done for Tired-Heart.\"\n\n### Groups 3 and 8: The Figures in Coils\n\n**Group 3: \"The gods who are in the following of the Enveloper\"** - Fourteen recumbent deities wrapped in serpent coils (in the Osireion), who guarantee the deceased \"may be in any place in which his Ka desires him to be.\"\n\n**Group 8: \"The gods who are in the coils\"** - Fourteen deities similarly wrapped, who grant \"the sight of the Solar Disk.\"\n\n### Group 9: The Bowing Ones\n\n**Group 9: \"iwwtyw\"** (cryptic name) - Four bowing deities who guarantee \"rest in the beautiful West.\"'**
  String get twelfthCavernLiteralMeaning;

  /// No description provided for @twelfthCavernEsotericMeaning.
  ///
  /// In en, this message translates to:
  /// **'## The cavern of the ultimate shore where domification ends\n\nAccording to Angelini, **\"With the XII Cavern one reaches the end of domification, one reaches the shore beyond which the sea exists\"**. This dwelling represents **\"the end of domification, the closure of this subliminal circuit\"**, poetically compared to **\"a shore where one must stop\"**.\n\n## The great journeys beyond the shore\n\nAngelini specifies that **\"The Twelfth House with the first vignettes indicates the end of domification, but also great journeys, sojourns beyond the shore\"** - journeys that are not limited to the ninth house but extend beyond the boundaries of earthly experience. The **Shore Deities** (\"He who controls the shore,\" \"The Chief of the shore,\" \"The gods who are on the shore\") govern this ultimate boundary where the individual meets the infinite.\n\n## The Mysterious Head on the shore: spirituality and suffering\n\nThe **\"Mysterious Head on the shore\"** (Group 7) - **\"a ram\'s head placed on a pole\"** - reveals according to Angelini **\"the spirituality of this house, but also, and above all, its negative part, woven with suffering, ineluctable bonds, constraints\"**.\n\n## The constraining coils and the paradox of liberation\n\nThe distinctive trait of the twelfth house is its **\"constraining, immobilizing function, with the many coils of the serpent that trap the god\"**. The **\"Gods who are in the following of the Enveloper\"** and **\"The gods who are in the coils\"** (Groups 3 and 8) show divine figures **\"wrapped in serpent coils\"**, representing those who are **\"immobilized by external and internal circumstances\"**.\n\nHowever, as Angelini observes in the general context of the Book of Caverns, apparent constraints can become means of spiritual liberation. The coils that immobilize are also those that protect, following the model of Mehen, the great serpent that wraps Osiris to guard him in his journey of regeneration.\n\n## The twelfth astrological house\n\nThis cavern corresponds to the **twelfth house**: the domain of hidden realities, spiritual sacrifice, and ultimate transcendence. It is the place where **\"the Neter Kether ends\"** (the hidden world) and where earthly domification gives way to the infinite sea of transcendent existence, reached paradoxically through acceptance of final constraints.'**
  String get twelfthCavernEsotericMeaning;

  /// No description provided for @codexSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your gateway to astrological knowledge'**
  String get codexSubtitle;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'AstroGods Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyWelcomeText.
  ///
  /// In en, this message translates to:
  /// **'Welcome to AstroGods privacy policy. This policy will help you understand what data we collect, why we collect it, and what your rights are regarding it.'**
  String get privacyPolicyWelcomeText;

  /// No description provided for @lastModified.
  ///
  /// In en, this message translates to:
  /// **'Last modified: September 7, 2025'**
  String get lastModified;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @summarySection.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summarySection;

  /// No description provided for @dataControllerSection.
  ///
  /// In en, this message translates to:
  /// **'Data Controller'**
  String get dataControllerSection;

  /// No description provided for @dataTypesSection.
  ///
  /// In en, this message translates to:
  /// **'Types of Data collected'**
  String get dataTypesSection;

  /// No description provided for @processingMethodsSection.
  ///
  /// In en, this message translates to:
  /// **'Methods and place of processing'**
  String get processingMethodsSection;

  /// No description provided for @purposesSection.
  ///
  /// In en, this message translates to:
  /// **'Purposes of Processing'**
  String get purposesSection;

  /// No description provided for @processingDetailsSection.
  ///
  /// In en, this message translates to:
  /// **'Processing details'**
  String get processingDetailsSection;

  /// No description provided for @cookiePolicySection.
  ///
  /// In en, this message translates to:
  /// **'Cookie Policy'**
  String get cookiePolicySection;

  /// No description provided for @euInfoSection.
  ///
  /// In en, this message translates to:
  /// **'Additional information for EU Users'**
  String get euInfoSection;

  /// No description provided for @additionalInfoSection.
  ///
  /// In en, this message translates to:
  /// **'Additional information'**
  String get additionalInfoSection;

  /// No description provided for @definitionsSection.
  ///
  /// In en, this message translates to:
  /// **'Definitions and Legal References'**
  String get definitionsSection;

  /// No description provided for @dataControllerName.
  ///
  /// In en, this message translates to:
  /// **'Arcangelo Massari - Bologna (Italy)'**
  String get dataControllerName;

  /// No description provided for @dataControllerEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Data Controller email address: '**
  String get dataControllerEmailLabel;

  /// No description provided for @dataControllerEmail.
  ///
  /// In en, this message translates to:
  /// **'contact@astrogods.it'**
  String get dataControllerEmail;

  /// No description provided for @dataWeCollectAutomatically.
  ///
  /// In en, this message translates to:
  /// **'Data we collect automatically'**
  String get dataWeCollectAutomatically;

  /// No description provided for @dataWeCollectAutomaticallyDesc.
  ///
  /// In en, this message translates to:
  /// **'We automatically collect your data, for example when you visit AstroGods.'**
  String get dataWeCollectAutomaticallyDesc;

  /// No description provided for @dataYouProvide.
  ///
  /// In en, this message translates to:
  /// **'Data you provide us'**
  String get dataYouProvide;

  /// No description provided for @dataYouProvideDesc.
  ///
  /// In en, this message translates to:
  /// **'We collect data you provide us, for example when you create an account on AstroGods.'**
  String get dataYouProvideDesc;

  /// No description provided for @trustedThirdParties.
  ///
  /// In en, this message translates to:
  /// **'Trusted third parties that help us process them'**
  String get trustedThirdParties;

  /// No description provided for @howWeUseThem.
  ///
  /// In en, this message translates to:
  /// **'How we use them'**
  String get howWeUseThem;

  /// No description provided for @usageData.
  ///
  /// In en, this message translates to:
  /// **'usage data'**
  String get usageData;

  /// No description provided for @ipAddress.
  ///
  /// In en, this message translates to:
  /// **'ip address'**
  String get ipAddress;

  /// No description provided for @deviceInformation.
  ///
  /// In en, this message translates to:
  /// **'device information'**
  String get deviceInformation;

  /// No description provided for @trackingTools.
  ///
  /// In en, this message translates to:
  /// **'tracking tools'**
  String get trackingTools;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'name'**
  String get name;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'surname'**
  String get surname;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'gender'**
  String get gender;

  /// No description provided for @billingAddress.
  ///
  /// In en, this message translates to:
  /// **'billing address'**
  String get billingAddress;

  /// No description provided for @paymentInformation.
  ///
  /// In en, this message translates to:
  /// **'payment information'**
  String get paymentInformation;

  /// No description provided for @purchaseHistory.
  ///
  /// In en, this message translates to:
  /// **'purchase history'**
  String get purchaseHistory;

  /// No description provided for @registrationAndAuth.
  ///
  /// In en, this message translates to:
  /// **'Registration and authentication'**
  String get registrationAndAuth;

  /// No description provided for @hostingAndBackend.
  ///
  /// In en, this message translates to:
  /// **'Hosting and backend infrastructure'**
  String get hostingAndBackend;

  /// No description provided for @trafficOptimization.
  ///
  /// In en, this message translates to:
  /// **'Traffic optimization and distribution'**
  String get trafficOptimization;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @backendApi.
  ///
  /// In en, this message translates to:
  /// **'Backend API'**
  String get backendApi;

  /// No description provided for @paymentManagement.
  ///
  /// In en, this message translates to:
  /// **'Payment management'**
  String get paymentManagement;

  /// No description provided for @dataTypesIntro.
  ///
  /// In en, this message translates to:
  /// **'Among the Personal Data collected by AstroGods, independently or through third parties, there are:'**
  String get dataTypesIntro;

  /// No description provided for @communicatedDataDuringService.
  ///
  /// In en, this message translates to:
  /// **'data communicated during service use'**
  String get communicatedDataDuringService;

  /// No description provided for @inCaseOfProblems.
  ///
  /// In en, this message translates to:
  /// **'In case of problems'**
  String get inCaseOfProblems;

  /// No description provided for @problemsDescription.
  ///
  /// In en, this message translates to:
  /// **'Although we strive to create a positive user experience, we know that problems can occasionally occur between us and our users.'**
  String get problemsDescription;

  /// No description provided for @doNotHesitateContact.
  ///
  /// In en, this message translates to:
  /// **'In such cases, do not hesitate to contact us.'**
  String get doNotHesitateContact;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;

  /// No description provided for @cookiePolicy.
  ///
  /// In en, this message translates to:
  /// **'Cookie Policy'**
  String get cookiePolicy;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditions;

  /// No description provided for @dataTypesDetailedContent.
  ///
  /// In en, this message translates to:
  /// **'Complete details on each type of Personal Data collected are provided in the dedicated sections of this privacy policy or through specific information texts displayed before the collection of the Data.\n\nPersonal Data may be freely provided by the User or, in the case of Usage Data, collected automatically during the use of AstroGods.\n\nUnless otherwise specified, all Data requested by AstroGods is mandatory. If the User refuses to provide it, it might be impossible for AstroGods to provide the Service. In cases where AstroGods indicates some Data as optional, Users are free to refrain from providing such Data without any consequence on the availability or operation of the Service.\n\nUsers who have doubts about which Data is mandatory are encouraged to contact the Owner.\n\nAny use of Cookies - or other tracking tools - by AstroGods or the owners of third-party services used by AstroGods serves the purpose of providing the Service requested by the User, in addition to the other purposes described in this document and in the Cookie Policy.\n\nThe User takes responsibility for the Personal Data of third parties obtained, published or shared through AstroGods.'**
  String get dataTypesDetailedContent;

  /// No description provided for @purposesIntroText.
  ///
  /// In en, this message translates to:
  /// **'User Data is collected to enable the Owner to provide the Service, comply with legal obligations, respond to requests or enforcement actions, protect their rights and interests (or those of Users or third parties), identify any fraudulent or malicious activities, as well as for the following purposes:'**
  String get purposesIntroText;

  /// No description provided for @purposesDetailedInfoText.
  ///
  /// In en, this message translates to:
  /// **'To obtain detailed information on the purposes of processing and the Personal Data specifically relevant to each purpose, the User can refer to the section \"Details on Personal Data processing\".'**
  String get purposesDetailedInfoText;

  /// No description provided for @processingMethodsTitle.
  ///
  /// In en, this message translates to:
  /// **'Methods and place of processing of collected Data'**
  String get processingMethodsTitle;

  /// No description provided for @processingMethodsContent.
  ///
  /// In en, this message translates to:
  /// **'### Processing methods\n\nThe Owner processes the Personal Data of Users by adopting appropriate security measures aimed at preventing unauthorized access, disclosure, modification or destruction of Personal Data.\n\nProcessing is carried out using computer and/or telematic tools, with organizational methods and logics strictly related to the indicated purposes. In addition to the Owner, in some cases, other subjects involved in the organization of AstroGods (administrative, commercial, marketing, legal personnel, system administrators) or external subjects (such as third-party technical service providers, postal couriers, hosting providers, IT companies, communication agencies) may have access to the Data, also appointed, if necessary, as Data Processors by the Owner. The updated list of Processors can always be requested from the Data Controller.\n\n### Location\n\nData is processed at the Owner\'s operating offices and in any other place where the parties involved in the processing are located.\n\nFor further information, contact the Owner.\n\nThe User\'s Personal Data may be transferred to a country other than the one where the User is located. To obtain further information on the place of processing, the User can refer to the section relating to details on Personal Data processing.\n\n### Retention time\n\nUnless otherwise specified in this document, Personal Data is processed and stored for the time required by the purposes for which it was collected and may be stored for a longer period due to any legal obligations or based on the consent of Users.'**
  String get processingMethodsContent;

  /// No description provided for @cookiePolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Cookie Policy'**
  String get cookiePolicyTitle;

  /// No description provided for @cookiePolicyContent.
  ///
  /// In en, this message translates to:
  /// **'AstroGods uses Tracking Tools. To learn more, consult the Cookie Policy.'**
  String get cookiePolicyContent;

  /// No description provided for @euInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Additional information for European Union users'**
  String get euInfoTitle;

  /// No description provided for @euInfoContent.
  ///
  /// In en, this message translates to:
  /// **'This section applies to all users of the European Union, in accordance with the General Data Protection Regulation (the \"GDPR\") and, for such Users, supersedes any other information that may be divergent or conflicting contained in the privacy policy.\n\nAdditional details relating to the categories of Data processed, the purposes of processing, the categories of recipients of personal data, if any, and additional information on personal data are available in the section \"Details on Personal Data processing\" within this document.'**
  String get euInfoContent;

  /// No description provided for @paymentManagementTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment management'**
  String get paymentManagementTitle;

  /// No description provided for @paymentManagementDescription.
  ///
  /// In en, this message translates to:
  /// **'Unless otherwise specified, AstroGods processes all payments with credit card, bank transfer or other means through external payment service providers. In general, and unless otherwise indicated, Users are requested to provide payment details and personal information directly to such payment service providers.\nAstroGods is not involved in the collection and processing of such information: it will instead only receive a notification from the relevant payment service provider about the payment made.'**
  String get paymentManagementDescription;

  /// No description provided for @hostingBackendTitle.
  ///
  /// In en, this message translates to:
  /// **'Hosting and backend infrastructure'**
  String get hostingBackendTitle;

  /// No description provided for @hostingBackendDescription.
  ///
  /// In en, this message translates to:
  /// **'This type of service has the function of hosting Data and files that allow AstroGods to function, enable its distribution and provide ready-to-use infrastructure to deliver specific AstroGods functionalities.\n\nSome services among those listed below, if present, may work on geographically distributed servers, making it difficult to determine the actual location where Personal Data is stored.'**
  String get hostingBackendDescription;

  /// No description provided for @backendApiTitle.
  ///
  /// In en, this message translates to:
  /// **'Backend API'**
  String get backendApiTitle;

  /// No description provided for @backendApiDescription.
  ///
  /// In en, this message translates to:
  /// **'AstroGods uses third-party APIs to process user requests and provide personalized content.'**
  String get backendApiDescription;

  /// No description provided for @authenticationTitle.
  ///
  /// In en, this message translates to:
  /// **'Registration and authentication'**
  String get authenticationTitle;

  /// No description provided for @authenticationDescription.
  ///
  /// In en, this message translates to:
  /// **'By registering or authenticating, Users allow AstroGods to identify them and give them access to dedicated services.\nDepending on what is indicated below, third-party services could provide simplified registration and authentication.'**
  String get authenticationDescription;

  /// No description provided for @trafficOptimizationTitle.
  ///
  /// In en, this message translates to:
  /// **'Traffic optimization and distribution'**
  String get trafficOptimizationTitle;

  /// No description provided for @trafficOptimizationDescription.
  ///
  /// In en, this message translates to:
  /// **'This type of service allows AstroGods to distribute its content through a network of geographically distributed servers and optimize its performance.\nThe Personal Data processed depends on the characteristics and mode of use of these services, whose function is to filter communications between AstroGods and the User\'s browser.\nGiven the distributed nature of this system, it is difficult to determine the places where content that may contain the User\'s Personal Data is transferred.'**
  String get trafficOptimizationDescription;

  /// No description provided for @stripeDescription.
  ///
  /// In en, this message translates to:
  /// **'Stripe is a payment service provided by Stripe Technology Europe Ltd.'**
  String get stripeDescription;

  /// No description provided for @hetznerDescription.
  ///
  /// In en, this message translates to:
  /// **'Hetzner is a hosting service provided by Hetzner Online GmbH.'**
  String get hetznerDescription;

  /// No description provided for @godaddyDescription.
  ///
  /// In en, this message translates to:
  /// **'GoDaddy Web Hosting is a hosting service provided by GoDaddy.com, LLC.'**
  String get godaddyDescription;

  /// No description provided for @anthropicApiDescription.
  ///
  /// In en, this message translates to:
  /// **'Anthropic API is an artificial intelligence service provided by Anthropic PBC.'**
  String get anthropicApiDescription;

  /// No description provided for @googleOAuthDescription.
  ///
  /// In en, this message translates to:
  /// **'Google OAuth is an authentication service provided by Google Inc.'**
  String get googleOAuthDescription;

  /// No description provided for @googleFontsDescription.
  ///
  /// In en, this message translates to:
  /// **'Google Fonts is a web font service provided by Google Inc.'**
  String get googleFontsDescription;

  /// No description provided for @europeanUnion.
  ///
  /// In en, this message translates to:
  /// **'European Union'**
  String get europeanUnion;

  /// No description provided for @germany.
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get germany;

  /// No description provided for @unitedStates.
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get unitedStates;

  /// No description provided for @ireland.
  ///
  /// In en, this message translates to:
  /// **'Ireland'**
  String get ireland;

  /// No description provided for @italy.
  ///
  /// In en, this message translates to:
  /// **'Italy'**
  String get italy;

  /// No description provided for @statisticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statisticsTitle;

  /// No description provided for @statisticsDescription.
  ///
  /// In en, this message translates to:
  /// **'The services contained in this section allow the Data Controller to monitor and analyze traffic data and serve to track User behavior.'**
  String get statisticsDescription;

  /// No description provided for @matomatoDescription.
  ///
  /// In en, this message translates to:
  /// **'Matomo is a statistics software used by AstroGods to analyze data directly and without the aid of third parties.'**
  String get matomatoDescription;

  /// No description provided for @directRegistration.
  ///
  /// In en, this message translates to:
  /// **'Direct registration'**
  String get directRegistration;

  /// No description provided for @directRegistrationDescription.
  ///
  /// In en, this message translates to:
  /// **'The User registers by filling out the registration form and directly providing their Personal Data to AstroGods.'**
  String get directRegistrationDescription;

  /// No description provided for @euExtendedContent.
  ///
  /// In en, this message translates to:
  /// **'### Legal basis for processing\n\nThe Owner may process User Personal Data if one of the following conditions exists:\n\n- Users have given their consent for one or more specific purposes;\n- processing is necessary for the performance of an agreement with the User and/or for any pre-contractual obligations thereof;\n- processing is necessary for compliance with a legal obligation to which the Owner is subject;\n- processing is necessary for the performance of a task carried out in the public interest or in the exercise of official authority vested in the Owner;\n- processing is necessary for the legitimate interests pursued by the Owner or by a third party.\n\nIn any case, the Owner will gladly help to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract.\n\n### Further information about retention time\n\nUnless specified otherwise in this document, Personal Data shall be processed and stored for as long as required by the purpose they have been collected for and may be stored for longer due to applicable legal obligation or based on the Users\' consent.\n\nTherefore:\n\n- Personal Data collected for purposes related to the performance of a contract between the Owner and the User shall be retained until such contract has been fully performed.\n- Personal Data collected for the purposes of the Owner\'s legitimate interests shall be retained as long as needed to fulfill such purposes. Users may find specific information regarding the legitimate interests pursued by the Owner within the relevant sections of this document or by contacting the Owner.\n\nThe Owner may be allowed to retain Personal Data for a longer period whenever the User has given consent to such processing, as long as such consent is not withdrawn. Furthermore, the Owner may be obliged to retain Personal Data for a longer period whenever required to do so for the performance of a legal obligation or upon order of an authority.\n\nOnce the retention period expires, Personal Data shall be deleted. Therefore, the right to access, the right to erasure, the right to rectification and the right to data portability cannot be enforced after expiration of the retention period.\n\n### The rights of Users based on the General Data Protection Regulation (GDPR)\n\nUsers may exercise certain rights regarding their Data processed by the Owner.\n\nIn particular, Users have the right to do the following, to the extent permitted by law:\n\n- **Withdraw their consent at any time.** Users have the right to withdraw consent where they have previously given their consent to the processing of their Personal Data.\n- **Object to processing of their Data.** Users have the right to object to the processing of their Data if the processing is carried out on a legal basis other than consent.\n- **Access their Data.** Users have the right to learn if Data is being processed by the Owner, obtain disclosure regarding certain aspects of the processing and obtain a copy of the Data undergoing processing.\n- **Verify and seek rectification.** Users have the right to verify the accuracy of their Data and ask for it to be updated or corrected.\n- **Restrict the processing of their Data.** Users have the right to restrict the processing of their Data. In this case, the Owner will not process their Data for any purpose other than storing it.\n- **Have their Personal Data deleted or otherwise removed.** Users have the right to obtain the erasure of their Data from the Owner.\n- **Receive their Data and have it transferred to another controller.** Users have the right to receive their Data in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance.\n- **Lodge a complaint.** Users have the right to bring a claim before their competent data protection authority.\n\nUsers are also entitled to learn about the legal basis for Data transfers abroad including to any international organization governed by public international law or set up by two or more countries, such as the UN, and about the security measures taken by the Owner to safeguard their Data.\n\n### Details about the right to object to processing\n\nWhere Personal Data is processed for a public interest, in the exercise of an official authority vested in the Owner or for the purposes of the legitimate interests pursued by the Owner, Users may object to such processing by providing a ground related to their particular situation to justify the objection.\n\nUsers must know that, however, should their Personal Data be processed for direct marketing purposes, they can object to that processing at any time, free of charge and without providing any justification. Where the User objects to processing for direct marketing purposes, the Personal Data will no longer be processed for such purposes. To learn whether the Owner is processing Personal Data for direct marketing purposes, Users may refer to the relevant sections of this document.\n\n### How to exercise these rights\n\nAny requests to exercise User rights can be directed to the Owner through the contact details provided in this document. Such requests are free of charge and will be answered by the Owner as early as possible and always within one month, providing Users with the information required by law. Any rectification or erasure of Personal Data or restriction of processing will be communicated by the Owner to each recipient, if any, to whom the Personal Data has been disclosed unless this proves impossible or involves disproportionate effort. At the Users\' request, the Owner will inform Users about those recipients.'**
  String get euExtendedContent;

  /// No description provided for @additionalInfoContent.
  ///
  /// In en, this message translates to:
  /// **'### Legal action\n\nThe User\'s Personal Data may be used for legal purposes by the Owner in Court or in the stages leading to possible legal action arising from improper use of this Application or the related Services.\n\nThe User declares to be aware that the Owner may be required to reveal personal data upon request of public authorities.\n\n### Additional information about User\'s Personal Data\n\nIn addition to the information contained in this privacy policy, this Application may provide the User with additional and contextual information concerning particular Services or the collection and processing of Personal Data upon request.\n\n### System logs and maintenance\n\nFor operation and maintenance purposes, this Application and any third-party services may collect files that record interaction with this Application (System logs) or use other Personal Data (such as the IP Address) for this purpose.\n\n### Information not contained in this policy\n\nMore details concerning the collection or processing of Personal Data may be requested from the Owner at any time. Please see the contact information at the beginning of this document.\n\nUsers are also encouraged to check the privacy policies of any third-party services used by this Application.\n\n### Changes to this privacy policy\n\nThe Owner reserves the right to make changes to this privacy policy at any time by notifying its Users on this page and possibly within this Application and/or - as far as technically and legally feasible - sending a notice to Users via any contact information available to the Owner. It is strongly recommended to check this page often, referring to the date of the last modification listed at the bottom.\n\nShould the changes affect processing activities performed on the basis of the User\'s consent, the Owner shall collect new consent from the User, where required.'**
  String get additionalInfoContent;

  /// No description provided for @definitionsContent.
  ///
  /// In en, this message translates to:
  /// **'Key terms and their meanings as used in this document'**
  String get definitionsContent;

  /// No description provided for @errorOpeningUrl.
  ///
  /// In en, this message translates to:
  /// **'Error opening URL'**
  String get errorOpeningUrl;

  /// No description provided for @providedByLabel.
  ///
  /// In en, this message translates to:
  /// **'Provided by: '**
  String get providedByLabel;

  /// No description provided for @cookiePolicyPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Cookie Policy'**
  String get cookiePolicyPageTitle;

  /// No description provided for @cookiePolicyWelcomeText.
  ///
  /// In en, this message translates to:
  /// **'This page explains how we use cookies and tracking technologies to improve your experience.'**
  String get cookiePolicyWelcomeText;

  /// No description provided for @whatAreCookiesSection.
  ///
  /// In en, this message translates to:
  /// **'What are cookies?'**
  String get whatAreCookiesSection;

  /// No description provided for @whatAreCookiesContent.
  ///
  /// In en, this message translates to:
  /// **'Cookies are small data files that are placed on your computer or mobile device when you visit a website. They are widely used to make websites work more efficiently, provide better user experience, and to provide reporting information.'**
  String get whatAreCookiesContent;

  /// No description provided for @typesOfCookiesSection.
  ///
  /// In en, this message translates to:
  /// **'Types of cookies we use'**
  String get typesOfCookiesSection;

  /// No description provided for @necessaryCookiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Necessary cookies'**
  String get necessaryCookiesTitle;

  /// No description provided for @necessaryCookiesDescription.
  ///
  /// In en, this message translates to:
  /// **'These cookies are essential for the website to function properly. They enable core functionality such as security, network management, and accessibility.'**
  String get necessaryCookiesDescription;

  /// No description provided for @measurementCookiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Measurement cookies'**
  String get measurementCookiesTitle;

  /// No description provided for @measurementCookiesDescription.
  ///
  /// In en, this message translates to:
  /// **'These cookies help us understand how visitors interact with our website by collecting and reporting information anonymously.'**
  String get measurementCookiesDescription;

  /// No description provided for @trackingToolsSection.
  ///
  /// In en, this message translates to:
  /// **'Tracking tools'**
  String get trackingToolsSection;

  /// No description provided for @trackingToolsIntro.
  ///
  /// In en, this message translates to:
  /// **'AstroGods uses the following tracking tools:'**
  String get trackingToolsIntro;

  /// No description provided for @matomoSelfHostedTitle.
  ///
  /// In en, this message translates to:
  /// **'Matomo (self-hosted)'**
  String get matomoSelfHostedTitle;

  /// No description provided for @matomoSelfHostedDescription.
  ///
  /// In en, this message translates to:
  /// **'We use Matomo, a privacy-focused analytics platform hosted on our own servers. This means your data never leaves our infrastructure and is not shared with third parties. Matomo helps us understand how users interact with our service while respecting your privacy.'**
  String get matomoSelfHostedDescription;

  /// No description provided for @dataCollectedByMatomo.
  ///
  /// In en, this message translates to:
  /// **'Data collected by Matomo:'**
  String get dataCollectedByMatomo;

  /// No description provided for @managingCookiesSection.
  ///
  /// In en, this message translates to:
  /// **'Managing cookies'**
  String get managingCookiesSection;

  /// No description provided for @managingCookiesContent.
  ///
  /// In en, this message translates to:
  /// **'You have control over the cookies we use. You can manage your preferences through your browser settings or by using the controls we provide. Please note that disabling certain cookies may affect the functionality of our website.'**
  String get managingCookiesContent;

  /// No description provided for @browserSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Browser settings'**
  String get browserSettingsTitle;

  /// No description provided for @browserSettingsContent.
  ///
  /// In en, this message translates to:
  /// **'Most web browsers allow you to control cookies through their settings preferences. You can set your browser to refuse cookies or delete certain cookies. Generally, you can also manage similar technologies in the same way.'**
  String get browserSettingsContent;

  /// No description provided for @consequencesOfBlockingTitle.
  ///
  /// In en, this message translates to:
  /// **'Consequences of blocking cookies'**
  String get consequencesOfBlockingTitle;

  /// No description provided for @consequencesOfBlockingContent.
  ///
  /// In en, this message translates to:
  /// **'If you choose to block or delete cookies, some features of our website may not work properly. You may experience reduced functionality and a less personalized experience.'**
  String get consequencesOfBlockingContent;

  /// No description provided for @complianceSection.
  ///
  /// In en, this message translates to:
  /// **'Compliance'**
  String get complianceSection;

  /// No description provided for @complianceContent.
  ///
  /// In en, this message translates to:
  /// **'Our cookie policy complies with EU data protection standards. We only use first-party tracking tools and do not share your data with third-party advertisers.'**
  String get complianceContent;

  /// No description provided for @contactForCookiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact us about cookies'**
  String get contactForCookiesTitle;

  /// No description provided for @contactForCookiesContent.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions about our use of cookies or tracking technologies, please contact us:'**
  String get contactForCookiesContent;

  /// No description provided for @cookiePolicyLastModified.
  ///
  /// In en, this message translates to:
  /// **'Last modified: September 7, 2025'**
  String get cookiePolicyLastModified;

  /// No description provided for @termsAndConditionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions of AstroGods'**
  String get termsAndConditionsTitle;

  /// No description provided for @termsIntroduction.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get termsIntroduction;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// No description provided for @registration.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get registration;

  /// No description provided for @registrationRequired.
  ///
  /// In en, this message translates to:
  /// **'To use the Service, User can open an account by providing all required data and information completely and truthfully. It is not possible to use the Service without opening a User account.'**
  String get registrationRequired;

  /// No description provided for @accountRequirements.
  ///
  /// In en, this message translates to:
  /// **'Account Requirements'**
  String get accountRequirements;

  /// No description provided for @accountClosureTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Closure'**
  String get accountClosureTitle;

  /// No description provided for @accountSuspension.
  ///
  /// In en, this message translates to:
  /// **'Account Suspension and Cancellation'**
  String get accountSuspension;

  /// No description provided for @accountSuspensionText.
  ///
  /// In en, this message translates to:
  /// **'The Owner reserves the right to suspend or cancel a User\'s account at any time at its sole discretion and without notice if deemed inappropriate, offensive, or contrary to these Terms.'**
  String get accountSuspensionText;

  /// No description provided for @permittedUse.
  ///
  /// In en, this message translates to:
  /// **'Permitted Use'**
  String get permittedUse;

  /// No description provided for @permittedUseText.
  ///
  /// In en, this message translates to:
  /// **'AstroGods and the Service may only be used for the purposes for which they are offered, according to these Terms and applicable law.'**
  String get permittedUseText;

  /// No description provided for @salesTerms.
  ///
  /// In en, this message translates to:
  /// **'Sales terms and conditions'**
  String get salesTerms;

  /// No description provided for @paidProducts.
  ///
  /// In en, this message translates to:
  /// **'Paid Products'**
  String get paidProducts;

  /// No description provided for @productDescription.
  ///
  /// In en, this message translates to:
  /// **'Product Description'**
  String get productDescription;

  /// No description provided for @purchaseProcedure.
  ///
  /// In en, this message translates to:
  /// **'Purchase Procedure'**
  String get purchaseProcedure;

  /// No description provided for @orderSubmission.
  ///
  /// In en, this message translates to:
  /// **'Order Submission'**
  String get orderSubmission;

  /// No description provided for @pricing.
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get pricing;

  /// No description provided for @promotionsAndDiscounts.
  ///
  /// In en, this message translates to:
  /// **'Promotions and Discounts'**
  String get promotionsAndDiscounts;

  /// No description provided for @vouchers.
  ///
  /// In en, this message translates to:
  /// **'Vouchers'**
  String get vouchers;

  /// No description provided for @paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethods;

  /// No description provided for @purchaseViaAppStore.
  ///
  /// In en, this message translates to:
  /// **'Purchase via App Store'**
  String get purchaseViaAppStore;

  /// No description provided for @deliveryOfDigitalContent.
  ///
  /// In en, this message translates to:
  /// **'Delivery of Digital Content'**
  String get deliveryOfDigitalContent;

  /// No description provided for @contractDuration.
  ///
  /// In en, this message translates to:
  /// **'Contract Duration'**
  String get contractDuration;

  /// No description provided for @trialPeriod.
  ///
  /// In en, this message translates to:
  /// **'Trial Period'**
  String get trialPeriod;

  /// No description provided for @subscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get subscriptions;

  /// No description provided for @lifetimeSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Lifetime Subscriptions'**
  String get lifetimeSubscriptions;

  /// No description provided for @fixedTermSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Fixed-term Subscriptions'**
  String get fixedTermSubscriptions;

  /// No description provided for @automaticRenewal.
  ///
  /// In en, this message translates to:
  /// **'Automatic Renewal'**
  String get automaticRenewal;

  /// No description provided for @cancellation.
  ///
  /// In en, this message translates to:
  /// **'Cancellation'**
  String get cancellation;

  /// No description provided for @userRights.
  ///
  /// In en, this message translates to:
  /// **'User Rights'**
  String get userRights;

  /// No description provided for @rightOfWithdrawal.
  ///
  /// In en, this message translates to:
  /// **'Right of Withdrawal'**
  String get rightOfWithdrawal;

  /// No description provided for @liabilityAndIndemnification.
  ///
  /// In en, this message translates to:
  /// **'Liability and Indemnification'**
  String get liabilityAndIndemnification;

  /// No description provided for @indemnificationText.
  ///
  /// In en, this message translates to:
  /// **'The User agrees to indemnify and hold harmless the Owner and its subordinates, affiliates, officers, agents, co-trademark holders, partners and employees to the extent permitted by law from any claim or demand - including, without limitation, legal fees and costs - advanced by third parties due to or in connection with behaviors in violation of these Terms, third party rights or law, implemented in connection with the use of the Service and attributable to the User, its affiliates, officers, agents, co-trademark holders, partners and employees, on the basis of fault.'**
  String get indemnificationText;

  /// No description provided for @commonProvisions.
  ///
  /// In en, this message translates to:
  /// **'Common Provisions'**
  String get commonProvisions;

  /// No description provided for @noWaiverImplied.
  ///
  /// In en, this message translates to:
  /// **'No Waiver Implied'**
  String get noWaiverImplied;

  /// No description provided for @serviceInterruption.
  ///
  /// In en, this message translates to:
  /// **'Service Interruption'**
  String get serviceInterruption;

  /// No description provided for @serviceResale.
  ///
  /// In en, this message translates to:
  /// **'Service Resale'**
  String get serviceResale;

  /// No description provided for @privacyPolicyReference.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyReference;

  /// No description provided for @contractAssignment.
  ///
  /// In en, this message translates to:
  /// **'Contract Assignment'**
  String get contractAssignment;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @severabilityClause.
  ///
  /// In en, this message translates to:
  /// **'Severability Clause'**
  String get severabilityClause;

  /// No description provided for @applicableLaw.
  ///
  /// In en, this message translates to:
  /// **'Applicable Law'**
  String get applicableLaw;

  /// No description provided for @disputeResolution.
  ///
  /// In en, this message translates to:
  /// **'Dispute Resolution'**
  String get disputeResolution;

  /// No description provided for @definitions.
  ///
  /// In en, this message translates to:
  /// **'Definitions and Legal References'**
  String get definitions;

  /// No description provided for @astrologicalServiceNature.
  ///
  /// In en, this message translates to:
  /// **'Nature of the astrological service'**
  String get astrologicalServiceNature;

  /// No description provided for @astrologicalServiceDescription.
  ///
  /// In en, this message translates to:
  /// **'AstroGods uses astrology as a system of symbolic knowledge and personal research tool. The User understands that:'**
  String get astrologicalServiceDescription;

  /// No description provided for @astrologicalServicePoint1.
  ///
  /// In en, this message translates to:
  /// **'Astrology is an ancient system of interpretation based on symbolic correlations, not on demonstrable scientific causality'**
  String get astrologicalServicePoint1;

  /// No description provided for @astrologicalServicePoint2.
  ///
  /// In en, this message translates to:
  /// **'The service offers tools for self-exploration and self-understanding through astrological language'**
  String get astrologicalServicePoint2;

  /// No description provided for @astrologicalServicePoint3.
  ///
  /// In en, this message translates to:
  /// **'The interpretations provided are aimed at inner research and the development of personal awareness'**
  String get astrologicalServicePoint3;

  /// No description provided for @astrologicalServicePoint4.
  ///
  /// In en, this message translates to:
  /// **'No professional advice of a medical, psychological, legal or financial nature is provided'**
  String get astrologicalServicePoint4;

  /// No description provided for @astrologicalServicePoint5.
  ///
  /// In en, this message translates to:
  /// **'Astrological analyses are tools for reflection and do not predict events with absolute certainty'**
  String get astrologicalServicePoint5;

  /// No description provided for @astrologicalServicePoint6.
  ///
  /// In en, this message translates to:
  /// **'The User is responsible for the use they make of the information received in their personal growth journey'**
  String get astrologicalServicePoint6;

  /// No description provided for @referralProgram.
  ///
  /// In en, this message translates to:
  /// **'Referral Program'**
  String get referralProgram;

  /// No description provided for @termsAcceptanceRequired.
  ///
  /// In en, this message translates to:
  /// **'Please read this document carefully.'**
  String get termsAcceptanceRequired;

  /// No description provided for @ownerName.
  ///
  /// In en, this message translates to:
  /// **'Arcangelo Massari - Bologna (Italy)'**
  String get ownerName;

  /// No description provided for @ownerEmail.
  ///
  /// In en, this message translates to:
  /// **'Owner\'s email address:'**
  String get ownerEmail;

  /// No description provided for @termsGovernText.
  ///
  /// In en, this message translates to:
  /// **'These Terms govern'**
  String get termsGovernText;

  /// No description provided for @useOfService.
  ///
  /// In en, this message translates to:
  /// **'the use of AstroGods and'**
  String get useOfService;

  /// No description provided for @legalRelationship.
  ///
  /// In en, this message translates to:
  /// **'any other Agreement or legal relationship with the Owner'**
  String get legalRelationship;

  /// No description provided for @bindingManner.
  ///
  /// In en, this message translates to:
  /// **'in a binding manner. Capitalized terms are defined in the relevant section of this document.'**
  String get bindingManner;

  /// No description provided for @consumerRequirement.
  ///
  /// In en, this message translates to:
  /// **'User acts as a Consumer'**
  String get consumerRequirement;

  /// No description provided for @notUnderEmbargo.
  ///
  /// In en, this message translates to:
  /// **'User is not located in a country subject to a US government embargo or listed as a terrorist-sponsoring country'**
  String get notUnderEmbargo;

  /// No description provided for @notOnProhibitedList.
  ///
  /// In en, this message translates to:
  /// **'User is not listed on any US government list of prohibited contractors'**
  String get notOnProhibitedList;

  /// No description provided for @botRegistrationProhibited.
  ///
  /// In en, this message translates to:
  /// **'Account opening via bots or other automated means is not permitted.'**
  String get botRegistrationProhibited;

  /// No description provided for @oneAccountPerUser.
  ///
  /// In en, this message translates to:
  /// **'Unless otherwise specified, each User may create only one account.'**
  String get oneAccountPerUser;

  /// No description provided for @accountSharingProhibited.
  ///
  /// In en, this message translates to:
  /// **'Unless expressly permitted, a User\'s account may not be shared with other people.'**
  String get accountSharingProhibited;

  /// No description provided for @externalResources.
  ///
  /// In en, this message translates to:
  /// **'Access to External Resources'**
  String get externalResources;

  /// No description provided for @externalResourcesDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Through AstroGods, Users may have access to resources provided by third parties. Users acknowledge and accept that the Owner has no control over such resources.'**
  String get externalResourcesDisclaimer;

  /// No description provided for @orderConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Once the order is submitted, Users will receive an order receipt confirmation.'**
  String get orderConfirmation;

  /// No description provided for @trialAutoConversion.
  ///
  /// In en, this message translates to:
  /// **'Upon expiration, the trial period will automatically convert to the equivalent paid Product unless the User cancels the purchase before the trial period expires.'**
  String get trialAutoConversion;

  /// No description provided for @lifetimeRefundPolicy.
  ///
  /// In en, this message translates to:
  /// **'If the Product ceases its activity within a period of less than 24 months, Users will receive a refund.'**
  String get lifetimeRefundPolicy;

  /// No description provided for @fixedTermSubscriptionText.
  ///
  /// In en, this message translates to:
  /// **'Paid fixed-term subscriptions start from the day the Owner receives payment and remain active for the duration of the subscription chosen by the User.'**
  String get fixedTermSubscriptionText;

  /// No description provided for @consumerExceptionText.
  ///
  /// In en, this message translates to:
  /// **'However, regardless of the foregoing, if the User acts as a Consumer, the following applies:'**
  String get consumerExceptionText;

  /// No description provided for @withdrawalRightSummary.
  ///
  /// In en, this message translates to:
  /// **'Unless an exception applies, the User may enjoy the right to withdraw from the contract within the period specified below (usually 14 days) for any reason and without justification. The User can find more information about the right of withdrawal in this section.'**
  String get withdrawalRightSummary;

  /// No description provided for @whoHasWithdrawalRights.
  ///
  /// In en, this message translates to:
  /// **'Who has the right of withdrawal'**
  String get whoHasWithdrawalRights;

  /// No description provided for @europeanConsumersWithdrawal.
  ///
  /// In en, this message translates to:
  /// **'Where none of the exceptions listed below apply, Users acting as European Consumers have the legal right to withdraw from contracts concluded online (distance contracts) within the time period specified below for any reason and without justification.'**
  String get europeanConsumersWithdrawal;

  /// No description provided for @nonEuropeanUsersNoRights.
  ///
  /// In en, this message translates to:
  /// **'Users who do not meet these requirements do not have the rights described in this section. The Consumer will be liable to the Seller only for any diminished value of the goods resulting from handling of the goods other than what is necessary to establish the nature, characteristics and functioning of the goods.'**
  String get nonEuropeanUsersNoRights;

  /// No description provided for @exerciseOfWithdrawalRight.
  ///
  /// In en, this message translates to:
  /// **'Exercise of the right of withdrawal'**
  String get exerciseOfWithdrawalRight;

  /// No description provided for @withdrawalExercise.
  ///
  /// In en, this message translates to:
  /// **'To exercise the right of withdrawal, the User must send the Owner an unequivocal communication of their intention to withdraw from the contract.'**
  String get withdrawalExercise;

  /// No description provided for @withdrawalFormInstructions.
  ///
  /// In en, this message translates to:
  /// **'For this purpose, the User may use the standard withdrawal form found in the definitions section of this document. However, the User is free to express their intention to withdraw from the contract in any other suitable form. In order to comply with the period within which the right must be exercised, the User must send the withdrawal declaration before the withdrawal deadline expires.'**
  String get withdrawalFormInstructions;

  /// No description provided for @withdrawalDeadlineQuestion.
  ///
  /// In en, this message translates to:
  /// **'When does the withdrawal deadline expire?'**
  String get withdrawalDeadlineQuestion;

  /// No description provided for @digitalContentWithdrawalDeadline.
  ///
  /// In en, this message translates to:
  /// **'In the case of contracts for the purchase of digital content not provided on a material medium, the withdrawal deadline expires 14 days after the day of conclusion of the contract, unless the User has waived the right of withdrawal.'**
  String get digitalContentWithdrawalDeadline;

  /// No description provided for @effectsOfWithdrawal.
  ///
  /// In en, this message translates to:
  /// **'Effects of withdrawal'**
  String get effectsOfWithdrawal;

  /// No description provided for @withdrawalEffects.
  ///
  /// In en, this message translates to:
  /// **'The Owner will refund all payments received, including delivery costs if any, to Users who have correctly exercised the right of withdrawal.'**
  String get withdrawalEffects;

  /// No description provided for @deliveryCostException.
  ///
  /// In en, this message translates to:
  /// **'However, the additional cost arising from the choice of a particular delivery method other than the cheapest standard delivery offered by the Owner will remain the User\'s responsibility.'**
  String get deliveryCostException;

  /// No description provided for @refundTimeline.
  ///
  /// In en, this message translates to:
  /// **'The refund will be made without undue delay and in any case within 14 days from the day on which the Owner was informed of the User\'s decision to withdraw from the contract. Unless otherwise agreed with the User, the refund will be made using the same means of payment used for the initial transaction. The User will not incur any cost as a result of the withdrawal.'**
  String get refundTimeline;

  /// No description provided for @indemnification.
  ///
  /// In en, this message translates to:
  /// **'Indemnification'**
  String get indemnification;

  /// No description provided for @userActivityLiabilityLimitation.
  ///
  /// In en, this message translates to:
  /// **'Limitation of liability for User activities on AstroGods'**
  String get userActivityLiabilityLimitation;

  /// No description provided for @generalLiabilityExclusion.
  ///
  /// In en, this message translates to:
  /// **'Unless otherwise specified and subject to applicable legal provisions, any claim for damages against the Owner (or any natural or legal person acting on its behalf) is excluded.'**
  String get generalLiabilityExclusion;

  /// No description provided for @liabilityExceptions.
  ///
  /// In en, this message translates to:
  /// **'The foregoing does not limit the Owner\'s liability for death, personal injury or damage to physical or mental integrity, damages arising from breach of essential contractual obligations, such as obligations strictly necessary to achieve the purpose of the contract, and/or damages caused intentionally or through gross negligence, provided that the User\'s use of AstroGods has been appropriate and correct.'**
  String get liabilityExceptions;

  /// No description provided for @limitedLiabilityScope.
  ///
  /// In en, this message translates to:
  /// **'Unless the damages were caused intentionally or through gross negligence or affect life and/or personal, physical or mental integrity, the Owner is only liable to the extent of damage typical for the type of contract and foreseeable at the time of conclusion.'**
  String get limitedLiabilityScope;

  /// No description provided for @noResponsibilityIntro.
  ///
  /// In en, this message translates to:
  /// **'In particular, within the limits set out above, the Owner assumes no responsibility regarding:'**
  String get noResponsibilityIntro;

  /// No description provided for @forceMAjeureExclusion.
  ///
  /// In en, this message translates to:
  /// **'damages or losses arising from interruptions or malfunctions of AstroGods due to force majeure or unforeseen and unforeseeable events and, in any case, independent of the will and beyond the control of the Owner, such as, by way of example only, failures or interruptions of telephone or electrical lines, Internet connection and/or other means of transmission, inaccessibility of websites, strikes, natural disasters, viruses and computer attacks, interruptions in the supply of third-party products, services or applications;'**
  String get forceMAjeureExclusion;

  /// No description provided for @indirectLossExclusion.
  ///
  /// In en, this message translates to:
  /// **'any lost profits or other losses, including indirect ones, that the User may have suffered (such as, by way of example only, commercial losses, loss of revenue, profits or anticipated savings, loss of contractual or commercial relationships, loss of goodwill or damage to reputation, etc.);'**
  String get indirectLossExclusion;

  /// No description provided for @nonDirectLossExclusion.
  ///
  /// In en, this message translates to:
  /// **'any losses that are not a direct consequence of a breach of the Terms by the Owner;'**
  String get nonDirectLossExclusion;

  /// No description provided for @noImplicitWaiver.
  ///
  /// In en, this message translates to:
  /// **'The Owner\'s failure to exercise legal rights or claims arising from these Terms does not constitute a waiver thereof. No waiver may be considered final in relation to a specific right or any other right.'**
  String get noImplicitWaiver;

  /// No description provided for @serviceMaintenanceRight.
  ///
  /// In en, this message translates to:
  /// **'To ensure the best possible level of service, the Owner reserves the right to interrupt the Service for maintenance, system updates, or any other changes, giving appropriate notice to Users.'**
  String get serviceMaintenanceRight;

  /// No description provided for @serviceTerminationRights.
  ///
  /// In en, this message translates to:
  /// **'Within the limits of the law, the Owner reserves the right to suspend or completely terminate the Service. In case of termination of the Service, the Owner will endeavor to allow Users to extract their personal data and information and will respect Users\' rights relating to continued use of the product and/or compensation, according to legal provisions.'**
  String get serviceTerminationRights;

  /// No description provided for @forceMAjeureUnavailability.
  ///
  /// In en, this message translates to:
  /// **'Additionally, the Service may not be available for reasons beyond the reasonable control of the Owner, such as force majeure (e.g., infrastructure malfunctions, blackouts, etc.).'**
  String get forceMAjeureUnavailability;

  /// No description provided for @advanceNotice.
  ///
  /// In en, this message translates to:
  /// **'The Owner undertakes to inform Users with at least 30 days\' notice, where possible.'**
  String get advanceNotice;

  /// No description provided for @unauthorizedResale.
  ///
  /// In en, this message translates to:
  /// **'Users are not authorized to reproduce, duplicate, copy, sell, resell, or exploit AstroGods or the Service in whole or in part without the Owner\'s prior written consent, expressed directly or through a legitimate resale program.'**
  String get unauthorizedResale;

  /// No description provided for @privacyPolicySection.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicySection;

  /// No description provided for @privacyPolicyReferenceContent.
  ///
  /// In en, this message translates to:
  /// **'For detailed information about how we collect, use, and protect your personal data, please refer to our complete Privacy Policy.'**
  String get privacyPolicyReferenceContent;

  /// No description provided for @viewPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'View Privacy Policy'**
  String get viewPrivacyPolicy;

  /// No description provided for @termsModification.
  ///
  /// In en, this message translates to:
  /// **'Terms Modification'**
  String get termsModification;

  /// No description provided for @termsModificationRight.
  ///
  /// In en, this message translates to:
  /// **'The Owner reserves the right to modify the Terms at any time. In such case, the Owner will give appropriate notice of the changes to Users.'**
  String get termsModificationRight;

  /// No description provided for @modificationsEffectiveDate.
  ///
  /// In en, this message translates to:
  /// **'The changes will take effect in relation to the User only from the moment communicated to the User.'**
  String get modificationsEffectiveDate;

  /// No description provided for @termsModificationAcceptance.
  ///
  /// In en, this message translates to:
  /// **'Continued use of the Service implies User acceptance of the updated Terms. If the User does not wish to accept the changes, they must cease using the Service and may withdraw from the Agreement.'**
  String get termsModificationAcceptance;

  /// No description provided for @previousVersionValidity.
  ///
  /// In en, this message translates to:
  /// **'The previous version continues to govern the relationship until acceptance of the changes by the User. This version may be requested from the Owner.'**
  String get previousVersionValidity;

  /// No description provided for @advanceNotificationRequirement.
  ///
  /// In en, this message translates to:
  /// **'If required by law, the Owner will notify Users in advance of the effective date of the modified Terms.'**
  String get advanceNotificationRequirement;

  /// No description provided for @contractTransferRight.
  ///
  /// In en, this message translates to:
  /// **'The Owner reserves the right to transfer, assign, dispose of, novate, or subcontract any or all rights and obligations under these Terms, having regard for the legitimate interests of Users.'**
  String get contractTransferRight;

  /// No description provided for @assignmentTermsApplication.
  ///
  /// In en, this message translates to:
  /// **'The provisions relating to the modification of these Terms apply.'**
  String get assignmentTermsApplication;

  /// No description provided for @userAssignmentRestriction.
  ///
  /// In en, this message translates to:
  /// **'The User is not authorized to assign or transfer their rights and obligations under the Terms without the written consent of the Owner.'**
  String get userAssignmentRestriction;

  /// No description provided for @communicationRequirement.
  ///
  /// In en, this message translates to:
  /// **'All communications relating to the use of AstroGods must be sent to the contact details indicated in this document.'**
  String get communicationRequirement;

  /// No description provided for @generalSeverability.
  ///
  /// In en, this message translates to:
  /// **'Should any provision of these Terms be or become null or ineffective under applicable law, the nullity or ineffectiveness of such provision does not cause the ineffectiveness of the remaining provisions, which therefore remain valid and effective.'**
  String get generalSeverability;

  /// No description provided for @europeanUsersTitle.
  ///
  /// In en, this message translates to:
  /// **'European Users'**
  String get europeanUsersTitle;

  /// No description provided for @europeanSeverability.
  ///
  /// In en, this message translates to:
  /// **'Should a provision of these Terms be or become null, invalid, or ineffective, the parties will endeavor to identify amicably a valid and effective provision to replace the null, invalid, or ineffective one. In case of failure to reach agreement as described above, if permitted or provided by applicable law, the null, invalid, or ineffective provision will be replaced by the applicable legal provisions.'**
  String get europeanSeverability;

  /// No description provided for @severabilityLimitations.
  ///
  /// In en, this message translates to:
  /// **'Notwithstanding the above, the nullity, invalidity, or ineffectiveness of a specific provision of these Terms does not result in nullity of the entire Agreement, unless the null, invalid, or ineffective provisions within the Agreement are essential or of such importance that the parties would not have concluded the contract if they had known the provision would be invalid, or in cases where the remaining provisions would impose an excessive and unacceptable burden on one of the parties.'**
  String get severabilityLimitations;

  /// No description provided for @governingLaw.
  ///
  /// In en, this message translates to:
  /// **'The Terms are governed by the law of the place where the Owner is established, as indicated in the relevant section of this document, regardless of conflict of law rules.'**
  String get governingLaw;

  /// No description provided for @nationalLawPrevalence.
  ///
  /// In en, this message translates to:
  /// **'National Law Prevalence'**
  String get nationalLawPrevalence;

  /// No description provided for @nationalLawPrevails.
  ///
  /// In en, this message translates to:
  /// **'If the law of the User\'s country provides a higher level of consumer protection, that higher level of protection prevails.'**
  String get nationalLawPrevails;

  /// No description provided for @competentJurisdiction.
  ///
  /// In en, this message translates to:
  /// **'Competent Jurisdiction'**
  String get competentJurisdiction;

  /// No description provided for @exclusiveJurisdiction.
  ///
  /// In en, this message translates to:
  /// **'Exclusive jurisdiction to hear any dispute arising from or in connection with the Terms belongs to the court of the place where the Owner is established, as indicated in the relevant section of this document.'**
  String get exclusiveJurisdiction;

  /// No description provided for @europeanConsumerExceptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Exception for Consumers in Europe'**
  String get europeanConsumerExceptionTitle;

  /// No description provided for @europeanConsumerException.
  ///
  /// In en, this message translates to:
  /// **'The above does not apply to Users acting as European Consumers or Consumers located in the United Kingdom, Switzerland, Norway, or Iceland.'**
  String get europeanConsumerException;

  /// No description provided for @amicableDisputeComposition.
  ///
  /// In en, this message translates to:
  /// **'Amicable dispute composition'**
  String get amicableDisputeComposition;

  /// No description provided for @amicableDisputeResolution.
  ///
  /// In en, this message translates to:
  /// **'Users may report any disputes to the Owner, who will seek to resolve them amicably.'**
  String get amicableDisputeResolution;

  /// No description provided for @judicialRightsPreservation.
  ///
  /// In en, this message translates to:
  /// **'Without prejudice to the Users\' right to bring legal action, in case of disputes concerning the use of AstroGods or the Service, Users are requested to contact the Owner at the contact details indicated in this document.'**
  String get judicialRightsPreservation;

  /// No description provided for @complaintProcedure.
  ///
  /// In en, this message translates to:
  /// **'Users may address a complaint to the Owner\'s email address indicated in this document, including a brief description and, if applicable, details of the affected order, purchase, or account.'**
  String get complaintProcedure;

  /// No description provided for @responseTimeline.
  ///
  /// In en, this message translates to:
  /// **'The Owner will process the request without undue delay and within 14 days of its receipt.'**
  String get responseTimeline;

  /// No description provided for @agreementDefinition.
  ///
  /// In en, this message translates to:
  /// **'Any legally binding relationship or contract between the Owner and the User governed by the Terms.'**
  String get agreementDefinition;

  /// No description provided for @voucherDefinition.
  ///
  /// In en, this message translates to:
  /// **'Any digital or paper code or voucher that allows the User to purchase the Product at a discounted price.'**
  String get voucherDefinition;

  /// No description provided for @europeanDefinition.
  ///
  /// In en, this message translates to:
  /// **'Applies when the User, regardless of nationality, is located in the European Union.'**
  String get europeanDefinition;

  /// No description provided for @ownerDefinition.
  ///
  /// In en, this message translates to:
  /// **'Indicates the natural or legal person who provides AstroGods and/or offers the Service to Users.'**
  String get ownerDefinition;

  /// No description provided for @productDefinition.
  ///
  /// In en, this message translates to:
  /// **'A good or service available through AstroGods, including specifically: personalized astrological interpretations, birth chart analyses, astrological predictions and forecasts, compatibility reports, astrological educational content, and any other astrological service or digital content defined separately in this document.'**
  String get productDefinition;

  /// No description provided for @serviceDefinition.
  ///
  /// In en, this message translates to:
  /// **'The service offered through AstroGods as described in the Terms and on AstroGods.'**
  String get serviceDefinition;

  /// No description provided for @termsDefinition.
  ///
  /// In en, this message translates to:
  /// **'All conditions applicable to the use of AstroGods and/or the provision of the Service as described in this document as well as in any other document or agreement related to it, in the most updated version respectively.'**
  String get termsDefinition;

  /// No description provided for @userDefinition.
  ///
  /// In en, this message translates to:
  /// **'Indicates any natural person who uses AstroGods.'**
  String get userDefinition;

  /// No description provided for @consumerDefinition.
  ///
  /// In en, this message translates to:
  /// **'Any User considered as such under applicable law.'**
  String get consumerDefinition;

  /// No description provided for @astroGodsDefinitionTitle.
  ///
  /// In en, this message translates to:
  /// **'AstroGods (or this Application)'**
  String get astroGodsDefinitionTitle;

  /// No description provided for @astroGodsDefinition.
  ///
  /// In en, this message translates to:
  /// **'The structure that enables the provision of the Service.'**
  String get astroGodsDefinition;

  /// No description provided for @agreementDefinitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Agreement'**
  String get agreementDefinitionTitle;

  /// No description provided for @voucherDefinitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Voucher'**
  String get voucherDefinitionTitle;

  /// No description provided for @europeanDefinitionTitle.
  ///
  /// In en, this message translates to:
  /// **'European (or Europe)'**
  String get europeanDefinitionTitle;

  /// No description provided for @withdrawalFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Standard withdrawal form'**
  String get withdrawalFormTitle;

  /// No description provided for @withdrawalFormHeader.
  ///
  /// In en, this message translates to:
  /// **'Addressed to:'**
  String get withdrawalFormHeader;

  /// No description provided for @withdrawalFormAddress.
  ///
  /// In en, this message translates to:
  /// **'Arcangelo Massari - Bologna (Italy)\ncontact@astrogods.it'**
  String get withdrawalFormAddress;

  /// No description provided for @withdrawalFormNotification.
  ///
  /// In en, this message translates to:
  /// **'I/we hereby notify withdrawal from my/our contract of sale for the following goods/services:'**
  String get withdrawalFormNotification;

  /// No description provided for @withdrawalFormDescription.
  ///
  /// In en, this message translates to:
  /// **'_____________________________________________ (insert here a description of the goods/services from whose purchase you wish to withdraw)'**
  String get withdrawalFormDescription;

  /// No description provided for @withdrawalFormOrderDate.
  ///
  /// In en, this message translates to:
  /// **'Ordered on: _____________________________________________ (insert the date)'**
  String get withdrawalFormOrderDate;

  /// No description provided for @withdrawalFormReceiveDate.
  ///
  /// In en, this message translates to:
  /// **'Received on: _____________________________________________ (insert the date)'**
  String get withdrawalFormReceiveDate;

  /// No description provided for @withdrawalFormConsumerName.
  ///
  /// In en, this message translates to:
  /// **'Name of consumer(s):_____________________________________________'**
  String get withdrawalFormConsumerName;

  /// No description provided for @withdrawalFormConsumerAddress.
  ///
  /// In en, this message translates to:
  /// **'Address of consumer(s):_____________________________________________'**
  String get withdrawalFormConsumerAddress;

  /// No description provided for @withdrawalFormDate.
  ///
  /// In en, this message translates to:
  /// **'Date: _____________________________________________'**
  String get withdrawalFormDate;

  /// No description provided for @withdrawalFormSignature.
  ///
  /// In en, this message translates to:
  /// **'(sign only if this form is notified in paper version)'**
  String get withdrawalFormSignature;

  /// No description provided for @ownerDefinitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Owner (or We)'**
  String get ownerDefinitionTitle;

  /// No description provided for @productDefinitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get productDefinitionTitle;

  /// No description provided for @serviceDefinitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get serviceDefinitionTitle;

  /// No description provided for @termsDefinitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get termsDefinitionTitle;

  /// No description provided for @userDefinitionTitle.
  ///
  /// In en, this message translates to:
  /// **'User (or You)'**
  String get userDefinitionTitle;

  /// No description provided for @consumerDefinitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Consumer'**
  String get consumerDefinitionTitle;

  /// No description provided for @lastModifiedTerms.
  ///
  /// In en, this message translates to:
  /// **'Last modified: September 7, 2025'**
  String get lastModifiedTerms;

  /// No description provided for @termsTableOfContents.
  ///
  /// In en, this message translates to:
  /// **'Table of Contents'**
  String get termsTableOfContents;

  /// No description provided for @termsIntroductionSection.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get termsIntroductionSection;

  /// No description provided for @astrologicalServiceNatureSection.
  ///
  /// In en, this message translates to:
  /// **'Nature of the astrological service'**
  String get astrologicalServiceNatureSection;

  /// No description provided for @termsOfUseSection.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUseSection;

  /// No description provided for @salesTermsSection.
  ///
  /// In en, this message translates to:
  /// **'Sales terms and conditions'**
  String get salesTermsSection;

  /// No description provided for @deliverySection.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get deliverySection;

  /// No description provided for @contractDurationSection.
  ///
  /// In en, this message translates to:
  /// **'Contract Duration'**
  String get contractDurationSection;

  /// No description provided for @userRightsSection.
  ///
  /// In en, this message translates to:
  /// **'User Rights'**
  String get userRightsSection;

  /// No description provided for @liabilitySection.
  ///
  /// In en, this message translates to:
  /// **'Liability and Indemnification'**
  String get liabilitySection;

  /// No description provided for @commonProvisionsSection.
  ///
  /// In en, this message translates to:
  /// **'Common Provisions'**
  String get commonProvisionsSection;

  /// No description provided for @disputeResolutionSection.
  ///
  /// In en, this message translates to:
  /// **'Dispute Resolution'**
  String get disputeResolutionSection;

  /// No description provided for @cookiesAndTrackingSection.
  ///
  /// In en, this message translates to:
  /// **'Cookies and tracking'**
  String get cookiesAndTrackingSection;

  /// No description provided for @cookiesAndTrackingReferenceContent.
  ///
  /// In en, this message translates to:
  /// **'For detailed information about cookies and tracking technologies we use, please refer to our complete Cookie Policy.'**
  String get cookiesAndTrackingReferenceContent;

  /// No description provided for @viewCookiePolicy.
  ///
  /// In en, this message translates to:
  /// **'View Cookie Policy'**
  String get viewCookiePolicy;

  /// No description provided for @cookiesAndTrackingTitle.
  ///
  /// In en, this message translates to:
  /// **'Cookies and tracking'**
  String get cookiesAndTrackingTitle;

  /// No description provided for @contactUsSection.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUsSection;

  /// No description provided for @appleThirdPartyBeneficiary.
  ///
  /// In en, this message translates to:
  /// **'Notwithstanding that the contractual relationship for the purchase of such Products is concluded exclusively between Owner and Users, Users acknowledge and accept that, should the provision of AstroGods have occurred through the Apple App Store or Google Play Store, the respective platform provider may exercise rights arising from these Terms as a third party beneficiary.'**
  String get appleThirdPartyBeneficiary;

  /// No description provided for @astroGodsServiceOf.
  ///
  /// In en, this message translates to:
  /// **'AstroGods is a service of:'**
  String get astroGodsServiceOf;

  /// No description provided for @astroGodsRefersTo.
  ///
  /// In en, this message translates to:
  /// **'\"AstroGods\" refers to'**
  String get astroGodsRefersTo;

  /// No description provided for @thisSiteDescription.
  ///
  /// In en, this message translates to:
  /// **'this website, accessible via browser, including related subdomains and any other site through which the Owner offers the Service;'**
  String get thisSiteDescription;

  /// No description provided for @mobileApplicationsDescription.
  ///
  /// In en, this message translates to:
  /// **'applications for mobile devices (iOS and Android), tablets, desktop (Linux, Windows, macOS) or similar platforms;'**
  String get mobileApplicationsDescription;

  /// No description provided for @termsOfUseGeneralValidity.
  ///
  /// In en, this message translates to:
  /// **'Unless otherwise specified, the terms of use of AstroGods set out in this section have general validity.'**
  String get termsOfUseGeneralValidity;

  /// No description provided for @additionalConditions.
  ///
  /// In en, this message translates to:
  /// **'Additional conditions of use or access applicable in particular situations are expressly indicated in this document.'**
  String get additionalConditions;

  /// No description provided for @usingAstroGodsUserDeclares.
  ///
  /// In en, this message translates to:
  /// **'By using AstroGods the User declares to meet the following requirements:'**
  String get usingAstroGodsUserDeclares;

  /// No description provided for @passwordSecurity.
  ///
  /// In en, this message translates to:
  /// **'It is the Users\' responsibility to keep their access credentials secure and confidential. To this end, Users must choose a password that corresponds to the highest level of security available on AstroGods.'**
  String get passwordSecurity;

  /// No description provided for @accountResponsibility.
  ///
  /// In en, this message translates to:
  /// **'By creating an account, the User accepts to be fully responsible for all activities carried out with their access credentials. Users are required to inform the Owner immediately and unambiguously through the contact details indicated in this document if they believe that their personal information, such as the User account, access credentials or personal data, have been violated, unlawfully disclosed or stolen.'**
  String get accountResponsibility;

  /// No description provided for @registrationRequirementsText.
  ///
  /// In en, this message translates to:
  /// **'The registration of a User account on AstroGods is subject to the conditions specified below. By registering an account, the User confirms that they meet these conditions.'**
  String get registrationRequirementsText;

  /// No description provided for @accountClosureProcedure.
  ///
  /// In en, this message translates to:
  /// **'Users are free to close their account and cease using the Service at any time by following this procedure:'**
  String get accountClosureProcedure;

  /// No description provided for @usingAccountClosureTools.
  ///
  /// In en, this message translates to:
  /// **'Using the account closure tools available on AstroGods.'**
  String get usingAccountClosureTools;

  /// No description provided for @paidSubscriptionSuspension.
  ///
  /// In en, this message translates to:
  /// **'However, the closure of the User account will be suspended until the expiry of any paid subscription services purchased by the User.'**
  String get paidSubscriptionSuspension;

  /// No description provided for @noCompensationForSuspension.
  ///
  /// In en, this message translates to:
  /// **'Account suspension or cancellation does not entitle the User to any compensation, refund or indemnification.'**
  String get noCompensationForSuspension;

  /// No description provided for @paymentObligationRemains.
  ///
  /// In en, this message translates to:
  /// **'The suspension or cancellation of an account for causes attributable to the User does not exempt the User from payment of fees or prices that may be applicable.'**
  String get paymentObligationRemains;

  /// No description provided for @thirdPartyResourcesDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'The conditions applicable to resources provided by third parties, including those applicable to any grants of rights on content, are determined by the same third parties and governed by their respective terms and conditions or, in their absence, by law.'**
  String get thirdPartyResourcesDisclaimer;

  /// No description provided for @userExclusiveResponsibility.
  ///
  /// In en, this message translates to:
  /// **'It is the User\'s exclusive responsibility to ensure that the use of AstroGods and/or the Service does not violate the law, regulations or the rights of third parties.'**
  String get userExclusiveResponsibility;

  /// No description provided for @ownerProtectiveRights.
  ///
  /// In en, this message translates to:
  /// **'Therefore, the Owner reserves the right to adopt any suitable measure to protect their legitimate interests, and in particular to deny the User access to AstroGods or the Service, terminate contracts, report any objectionable activity carried out through AstroGods or the Service to competent authorities - e.g. judicial or administrative authority - whenever the User implements or there is suspicion that they implement:'**
  String get ownerProtectiveRights;

  /// No description provided for @violationsOfLaw.
  ///
  /// In en, this message translates to:
  /// **'violations of law, regulations and/or the Terms;'**
  String get violationsOfLaw;

  /// No description provided for @injuryToThirdPartyRights.
  ///
  /// In en, this message translates to:
  /// **'injury to third party rights;'**
  String get injuryToThirdPartyRights;

  /// No description provided for @actsHarmingOwnerInterests.
  ///
  /// In en, this message translates to:
  /// **'acts that may considerably harm the Owner\'s legitimate interests;'**
  String get actsHarmingOwnerInterests;

  /// No description provided for @offensesToOwnerOrThird.
  ///
  /// In en, this message translates to:
  /// **'offenses to the Owner or a third party.'**
  String get offensesToOwnerOrThird;

  /// No description provided for @referralBenefits.
  ///
  /// In en, this message translates to:
  /// **'AstroGods allows Users to receive benefits if, thanks to their recommendation, a new User purchases a Product offered on AstroGods.'**
  String get referralBenefits;

  /// No description provided for @referralCodeUsage.
  ///
  /// In en, this message translates to:
  /// **'To take advantage of this opportunity, the User can invite friends to purchase Products on AstroGods by sending them a special code provided by the Owner. Each code can be redeemed only once.'**
  String get referralCodeUsage;

  /// No description provided for @referralRewardSystem.
  ///
  /// In en, this message translates to:
  /// **'If one of the invited people purchasing a Product on AstroGods decides to redeem an invitation code, the User who invited them will receive the benefit or advantage (such as: a discount, an additional service, an upgrade etc.) indicated on AstroGods.'**
  String get referralRewardSystem;

  /// No description provided for @referralCodeLimitations.
  ///
  /// In en, this message translates to:
  /// **'Invitation codes may only be redeemable for some Products among those offered on AstroGods.'**
  String get referralCodeLimitations;

  /// No description provided for @ownerDiscretionaryRight.
  ///
  /// In en, this message translates to:
  /// **'The Owner reserves the right to cease the offer at any time at their sole discretion.'**
  String get ownerDiscretionaryRight;

  /// No description provided for @referralLimitations.
  ///
  /// In en, this message translates to:
  /// **'Although there is no limit to the number of people who can be invited, the number of benefits or advantages that each User can receive for an equal number of redeemed invitation codes may be subject to a maximum limit.'**
  String get referralLimitations;

  /// No description provided for @salesTermsIntro.
  ///
  /// In en, this message translates to:
  /// **'Some of the Products offered on AstroGods as part of the service are paid.'**
  String get salesTermsIntro;

  /// No description provided for @salesTermsDetails.
  ///
  /// In en, this message translates to:
  /// **'The rates, duration and conditions applicable to the sale of such Products are described below and in the respective sections of AstroGods.'**
  String get salesTermsDetails;

  /// No description provided for @purchaseRegistrationRequired.
  ///
  /// In en, this message translates to:
  /// **'To purchase Products, the User is required to register or log in to AstroGods.'**
  String get purchaseRegistrationRequired;

  /// No description provided for @productDescriptionInfo.
  ///
  /// In en, this message translates to:
  /// **'Prices, descriptions and availability of astrological Products (including personalized birth chart readings, compatibility analyses, daily and monthly predictions, relationship insights, and travel astrology recommendations) are specified in the respective sections of AstroGods and are subject to change without notice.'**
  String get productDescriptionInfo;

  /// No description provided for @productRepresentationDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Although Products on AstroGods are presented with the maximum technically possible accuracy, the representation on AstroGods through any means (including, as the case may be, graphic materials, images, colors, sounds) is to be understood as a mere reference and does not imply any guarantee regarding the characteristics of the Product purchased.'**
  String get productRepresentationDisclaimer;

  /// No description provided for @productCharacteristicsSpecified.
  ///
  /// In en, this message translates to:
  /// **'The characteristics of the selected Product will be specified during the purchase procedure.'**
  String get productCharacteristicsSpecified;

  /// No description provided for @purchaseProcedureSteps.
  ///
  /// In en, this message translates to:
  /// **'Each step, from product selection to order submission, is part of the purchase procedure. The purchase procedure includes the following steps:'**
  String get purchaseProcedureSteps;

  /// No description provided for @stripeCheckoutAccess.
  ///
  /// In en, this message translates to:
  /// **'By clicking the checkout button, Users access the Stripe checkout area where they will be asked to provide their contact details and a payment method of their choice.'**
  String get stripeCheckoutAccess;

  /// No description provided for @stripePaymentStorage.
  ///
  /// In en, this message translates to:
  /// **'Users who have not yet done so, can request Stripe to store their payment information for future purchases on AstroGods or on other sites that use Stripe as a payment gateway. For information on the processing of personal data and related rights, the User can consult the privacy policy of Stripe and AstroGods.'**
  String get stripePaymentStorage;

  /// No description provided for @stripeBillingAddress.
  ///
  /// In en, this message translates to:
  /// **'Within the Stripe checkout area, Users may also be asked to specify their billing and shipping address.'**
  String get stripeBillingAddress;

  /// No description provided for @stripeExpressCheckout.
  ///
  /// In en, this message translates to:
  /// **'Within the Stripe checkout area, Users will have the possibility to choose express checkout. Express checkout allows Users to complete the purchase directly, using payment information and contact details stored by the most common online payment management services (such as \"ApplePay\", \"Google Pay\", \"Microsoft Pay\").'**
  String get stripeExpressCheckout;

  /// No description provided for @orderSubmissionRequirement.
  ///
  /// In en, this message translates to:
  /// **'To submit the order, Users are required to accept these Terms and use the respective button or mechanism on AstroGods, thereby committing to pay the agreed price.'**
  String get orderSubmissionRequirement;

  /// No description provided for @orderSubmissionConsequences.
  ///
  /// In en, this message translates to:
  /// **'Order submission entails the following:'**
  String get orderSubmissionConsequences;

  /// No description provided for @contractConclusion.
  ///
  /// In en, this message translates to:
  /// **'Order submission by the user determines the conclusion of the contract and gives rise to the User\'s obligation to pay the price, taxes and any additional charges and expenses, as specified in the order page.'**
  String get contractConclusion;

  /// No description provided for @userCollaborationObligation.
  ///
  /// In en, this message translates to:
  /// **'In the event that the purchased Product requires action by the User, such as the provision of information or personal data, specifications or particular requests, order submission also constitutes the User\'s obligation to collaborate accordingly.'**
  String get userCollaborationObligation;

  /// No description provided for @orderConfirmationEmail.
  ///
  /// In en, this message translates to:
  /// **'Once the order is submitted, Users will receive an order receipt confirmation.'**
  String get orderConfirmationEmail;

  /// No description provided for @purchaseNotifications.
  ///
  /// In en, this message translates to:
  /// **'All notifications related to the purchase procedure described above will be sent to the email address provided by the User for this purpose.'**
  String get purchaseNotifications;

  /// No description provided for @pricingTransparency.
  ///
  /// In en, this message translates to:
  /// **'During the purchase procedure and before order submission, Users are duly informed of all fees, taxes and costs (including any shipping charges) that will be charged to them.'**
  String get pricingTransparency;

  /// No description provided for @pricingPolicy.
  ///
  /// In en, this message translates to:
  /// **'Prices on AstroGods include all applicable fees, taxes and costs.'**
  String get pricingPolicy;

  /// No description provided for @promotionsDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'The Owner may offer discounts or special promotions for the purchase of Products. Such promotions or discounts are always subject to the requirements and terms and conditions provided in the relevant section of AstroGods.'**
  String get promotionsDisclaimer;

  /// No description provided for @promotionsDiscretion.
  ///
  /// In en, this message translates to:
  /// **'Promotions and offers are always granted at the sole discretion of the Owner.'**
  String get promotionsDiscretion;

  /// No description provided for @promotionsNoRights.
  ///
  /// In en, this message translates to:
  /// **'Repeated or periodic promotions or discounts do not constitute any claim or right enforceable by Users in the future.'**
  String get promotionsNoRights;

  /// No description provided for @promotionsTimeLimit.
  ///
  /// In en, this message translates to:
  /// **'Depending on the case, discounts and promotions are valid for a certain period of time or until stocks run out. Unless otherwise specified, the time limitations of promotions and discounts refer to the time zone of the Owner\'s headquarters, as indicated in the contact details in this document.'**
  String get promotionsTimeLimit;

  /// No description provided for @vouchersPromoForm.
  ///
  /// In en, this message translates to:
  /// **'Promotions and discounts may be offered in the form of Vouchers.'**
  String get vouchersPromoForm;

  /// No description provided for @vouchersViolationConsequences.
  ///
  /// In en, this message translates to:
  /// **'In case of violation of the conditions applicable to Vouchers, the Owner may legitimately refuse to fulfill their contractual obligations and expressly reserves the right to take action in appropriate venues, including judicial ones, in order to protect their rights and interests.'**
  String get vouchersViolationConsequences;

  /// No description provided for @vouchersAdditionalProvisions.
  ///
  /// In en, this message translates to:
  /// **'Any additional or divergent provisions applicable to the use of Vouchers reported in the relevant information page or on the Voucher itself prevail in any case, regardless of the provisions that follow.'**
  String get vouchersAdditionalProvisions;

  /// No description provided for @vouchersRules.
  ///
  /// In en, this message translates to:
  /// **'Unless otherwise specified, the following rules apply to the use of Vouchers:'**
  String get vouchersRules;

  /// No description provided for @voucherValidityRule.
  ///
  /// In en, this message translates to:
  /// **'Each Voucher is valid only if used according to the methods and within the time period specified on the website and/or on the Voucher;'**
  String get voucherValidityRule;

  /// No description provided for @voucherFullRedemption.
  ///
  /// In en, this message translates to:
  /// **'The Voucher can only be redeemed in full at the time of purchase – partial use is not permitted;'**
  String get voucherFullRedemption;

  /// No description provided for @voucherSingleUse.
  ///
  /// In en, this message translates to:
  /// **'Unless otherwise specified, single-use Vouchers can be redeemed only once per purchase and can therefore be redeemed only once even in the case of installment purchases;'**
  String get voucherSingleUse;

  /// No description provided for @vouchersNotCumulative.
  ///
  /// In en, this message translates to:
  /// **'Vouchers are not cumulative;'**
  String get vouchersNotCumulative;

  /// No description provided for @voucherExpiration.
  ///
  /// In en, this message translates to:
  /// **'The Voucher must be used within the specified validity period. Once the period expires, the Voucher will be automatically canceled. Any possibility of claiming rights, including refund of the Voucher value, is excluded;'**
  String get voucherExpiration;

  /// No description provided for @voucherNoCredit.
  ///
  /// In en, this message translates to:
  /// **'The User is not entitled to any credit/refund/compensation in case there is a difference between the Voucher value and the redeemed value;'**
  String get voucherNoCredit;

  /// No description provided for @voucherNonCommercialUse.
  ///
  /// In en, this message translates to:
  /// **'The Voucher is to be understood exclusively for non-commercial use. The reproduction, counterfeiting and commercialization of the Voucher are strictly prohibited, as well as any illegal activity connected to the purchase and/or use of the Voucher.'**
  String get voucherNonCommercialUse;

  /// No description provided for @paymentMethodsInfo.
  ///
  /// In en, this message translates to:
  /// **'AstroGods processes all payments securely through Stripe, a certified PCI DSS compliant payment processor. Accepted payment methods include major credit and debit cards (Visa, Mastercard, American Express), digital wallets (Apple Pay, Google Pay), and other methods available through Stripe in your region.'**
  String get paymentMethodsInfo;

  /// No description provided for @paymentMethodsConditions.
  ///
  /// In en, this message translates to:
  /// **'Payment processing is handled entirely by Stripe Technology Europe Ltd. AstroGods does not store or have access to your payment card details, which are processed and stored securely by Stripe according to the highest industry security standards.'**
  String get paymentMethodsConditions;

  /// No description provided for @paymentThirdPartyHandling.
  ///
  /// In en, this message translates to:
  /// **'All payments are handled independently by third-party services. Therefore, AstroGods does not collect payment-related data – such as credit card numbers – but receives a notification once the payment has been successful. For further information on the processing of personal data and related rights, the User can refer to the AstroGods privacy policy.'**
  String get paymentThirdPartyHandling;

  /// No description provided for @paymentFailureConsequences.
  ///
  /// In en, this message translates to:
  /// **'In the event that payment made with one of the available methods fails or is rejected by the payment service provider, the Owner is not obligated to execute the order. In the event that payment is not successful, the Owner reserves the right to request the User to reimburse any related expenses or damages.'**
  String get paymentFailureConsequences;

  /// No description provided for @stripeRecurringPayments.
  ///
  /// In en, this message translates to:
  /// **'For subscription services, Stripe securely stores payment method information to process recurring payments automatically. Users can manage, update, or cancel their payment methods and subscriptions through the customer portal accessible from their account settings.'**
  String get stripeRecurringPayments;

  /// No description provided for @stripeCustomerPortal.
  ///
  /// In en, this message translates to:
  /// **'Users can access the Stripe Customer Portal to view billing history, download invoices, update payment methods, and manage subscription settings. This portal is provided directly by Stripe and ensures secure access to payment and billing information.'**
  String get stripeCustomerPortal;

  /// No description provided for @appStorePurchases.
  ///
  /// In en, this message translates to:
  /// **'AstroGods or certain Products sold on AstroGods must be purchased through a third-party app store. To make such purchases, Users are asked to follow the instructions in the relevant app store (for example \"Apple App Store\" or \"Google Play\"). This information may vary depending on the specific device used.'**
  String get appStorePurchases;

  /// No description provided for @appStoreTermsPrecedence.
  ///
  /// In en, this message translates to:
  /// **'Unless otherwise specified, purchases made through third-party online stores are also subject to the terms and conditions of such third parties. Such terms and conditions prevail in any case of inconsistency or conflict with respect to these Terms.'**
  String get appStoreTermsPrecedence;

  /// No description provided for @appStoreTermsAcceptance.
  ///
  /// In en, this message translates to:
  /// **'Therefore, Users who make purchases through such third-party online stores are asked to carefully read and accept the related terms and conditions of sale.'**
  String get appStoreTermsAcceptance;

  /// No description provided for @ownershipReservationTitle.
  ///
  /// In en, this message translates to:
  /// **'Ownership reservation'**
  String get ownershipReservationTitle;

  /// No description provided for @ownershipReservation.
  ///
  /// In en, this message translates to:
  /// **'Until receipt of payment of the full purchase price by the Owner, the User does not acquire ownership of the ordered Products.'**
  String get ownershipReservation;

  /// No description provided for @usageRightsReservationTitle.
  ///
  /// In en, this message translates to:
  /// **'Usage rights reservation'**
  String get usageRightsReservationTitle;

  /// No description provided for @usageRightsReservation.
  ///
  /// In en, this message translates to:
  /// **'Until receipt of payment of the full purchase price by the Owner, the User does not acquire the usage rights of the ordered Products.'**
  String get usageRightsReservation;

  /// No description provided for @contractualWithdrawalRightTitle.
  ///
  /// In en, this message translates to:
  /// **'Contractual withdrawal right'**
  String get contractualWithdrawalRightTitle;

  /// No description provided for @contractualWithdrawalRight.
  ///
  /// In en, this message translates to:
  /// **'The Owner grants Users the contractual right to withdraw from the purchase contract according to the terms and conditions set out in the relevant section of AstroGods within 30 days of the conclusion of the contract.'**
  String get contractualWithdrawalRight;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @digitalContentDeliveryDetails.
  ///
  /// In en, this message translates to:
  /// **'Unless otherwise specified, astrological content purchased on AstroGods consists of textual interpretations and analyses (including birth chart analyses, personalized interpretations, predictions, and compatibility reports) delivered digitally through the online application interface. AstroGods functions primarily as an online service accessible through web browsers and mobile applications.'**
  String get digitalContentDeliveryDetails;

  /// No description provided for @deviceRequirements.
  ///
  /// In en, this message translates to:
  /// **'Users acknowledge and accept that, to download and/or use the Product, the chosen device(s) and their respective software (including operating systems) must be legal, commonly used, updated and in line with current market standards.'**
  String get deviceRequirements;

  /// No description provided for @downloadLimitations.
  ///
  /// In en, this message translates to:
  /// **'Users acknowledge and accept that the possibility of downloading the purchased Product may be limited in time and space.'**
  String get downloadLimitations;

  /// No description provided for @trialPeriodAvailability.
  ///
  /// In en, this message translates to:
  /// **'Users have the opportunity to try AstroGods or individual Products free of charge for a 7-day, non-renewable trial period. Some functions or features of AstroGods may not be available during the trial period. Additional conditions applicable to the trial period will be specified on AstroGods.'**
  String get trialPeriodAvailability;

  /// No description provided for @subscriptionContinuousProduct.
  ///
  /// In en, this message translates to:
  /// **'Through subscription, the User receives a Product continuously or periodically. Details regarding the type of subscription and termination are described below.'**
  String get subscriptionContinuousProduct;

  /// No description provided for @lifetimeSubscriptionDuration.
  ///
  /// In en, this message translates to:
  /// **'Lifetime subscriptions are subscriptions that remain active for the entire duration of activity of the subscribed Product. Lifetime subscriptions start from the day the Owner receives payment. They terminate only if and when the related Product ceases its activity.'**
  String get lifetimeSubscriptionDuration;

  /// No description provided for @fixedTermSubscriptionEnd.
  ///
  /// In en, this message translates to:
  /// **'Once the subscription duration has ended, the Product will no longer be accessible.'**
  String get fixedTermSubscriptionEnd;

  /// No description provided for @appleAccountSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Users can subscribe to a Product using the Apple Account associated with their Apple App Store account through the related procedure on AstroGods. In doing so, Users acknowledge and accept that:'**
  String get appleAccountSubscriptions;

  /// No description provided for @appleAccountPayment.
  ///
  /// In en, this message translates to:
  /// **'any payment due will be charged to the Apple account;'**
  String get appleAccountPayment;

  /// No description provided for @appleAccountAutoRenewal.
  ///
  /// In en, this message translates to:
  /// **'subscriptions automatically renew for the same duration unless the User communicates cancellation at least 24 hours before the expiration of the current subscription period;'**
  String get appleAccountAutoRenewal;

  /// No description provided for @appleAccountRenewalCharges.
  ///
  /// In en, this message translates to:
  /// **'all fees or payments due for renewal will be charged within 24 hours before the expiration of the current period;'**
  String get appleAccountRenewalCharges;

  /// No description provided for @appleAccountManagement.
  ///
  /// In en, this message translates to:
  /// **'subscriptions can be managed or canceled directly through the User\'s Apple App Store account settings.'**
  String get appleAccountManagement;

  /// No description provided for @appleTermsPrecedence.
  ///
  /// In en, this message translates to:
  /// **'The above prevails over any conflicting or divergent provision of the Terms.'**
  String get appleTermsPrecedence;

  /// No description provided for @automaticRenewalPolicy.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions automatically renew through Stripe\'s secure billing system with a charge to the User\'s chosen payment method. Users receive email notifications before each renewal and can cancel or modify their subscription anytime through the Stripe Customer Portal.'**
  String get automaticRenewalPolicy;

  /// No description provided for @renewalDurationMatch.
  ///
  /// In en, this message translates to:
  /// **'The renewal has the same duration as the original subscription period.'**
  String get renewalDurationMatch;

  /// No description provided for @subscriptionTermination.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions can be terminated by: (1) accessing the Stripe Customer Portal through your account settings to cancel immediately, (2) sending a clear cancellation notice to the Owner using the contact details provided in this document, or (3) following the cancellation instructions on AstroGods.'**
  String get subscriptionTermination;

  /// No description provided for @cancellationEffectiveTiming.
  ///
  /// In en, this message translates to:
  /// **'If the cancellation notice reaches the Owner before the subscription renewal date, the termination will take effect at the end of the current period.'**
  String get cancellationEffectiveTiming;

  /// No description provided for @consumerExceptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Exception for Consumers'**
  String get consumerExceptionTitle;

  /// No description provided for @consumerIndefiniteExtension.
  ///
  /// In en, this message translates to:
  /// **'At the end of the initial term, subscriptions are automatically extended indefinitely, unless the User cancels before the end of such term.'**
  String get consumerIndefiniteExtension;

  /// No description provided for @consumerRenewalCharging.
  ///
  /// In en, this message translates to:
  /// **'The fee due at the time of extension will be charged to the payment method that the User chose when purchasing.'**
  String get consumerRenewalCharging;

  /// No description provided for @consumerMonthlyTermination.
  ///
  /// In en, this message translates to:
  /// **'After the extension, the subscription will have an indefinite duration and may be terminated monthly.'**
  String get consumerMonthlyTermination;

  /// No description provided for @consumerCancellationTiming.
  ///
  /// In en, this message translates to:
  /// **'If the cancellation reaches the Owner within the end of the current month, the subscription expires at the end of that month.'**
  String get consumerCancellationTiming;

  /// No description provided for @resolution.
  ///
  /// In en, this message translates to:
  /// **'Resolution'**
  String get resolution;

  /// No description provided for @appleAccountSubscriptionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions managed through Apple Account'**
  String get appleAccountSubscriptionsTitle;

  /// No description provided for @differentiatedLicensingSection.
  ///
  /// In en, this message translates to:
  /// **'Differentiated licensing'**
  String get differentiatedLicensingSection;

  /// No description provided for @differentiatedLicensing.
  ///
  /// In en, this message translates to:
  /// **'Differentiated licensing for content'**
  String get differentiatedLicensing;

  /// No description provided for @differentiatedLicensingText.
  ///
  /// In en, this message translates to:
  /// **'The contents of AstroGods are subject to three distinct licensing regimes:'**
  String get differentiatedLicensingText;

  /// No description provided for @proprietaryContentStandard.
  ///
  /// In en, this message translates to:
  /// **'A) Proprietary standard content'**
  String get proprietaryContentStandard;

  /// No description provided for @proprietaryContentStandardText.
  ///
  /// In en, this message translates to:
  /// **'The application interface, algorithms, software, trademarks, user database and all technical elements remain the exclusive property of the Owner with all rights reserved.'**
  String get proprietaryContentStandardText;

  /// No description provided for @codexCreativeCommons.
  ///
  /// In en, this message translates to:
  /// **'B) Codex - Educational content (CC BY 4.0 license)'**
  String get codexCreativeCommons;

  /// No description provided for @codexCreativeCommonsText.
  ///
  /// In en, this message translates to:
  /// **'The contents of the Codex, including interpretive texts, images and educational materials, are released under the Creative Commons Attribution 4.0 International license. Users may:'**
  String get codexCreativeCommonsText;

  /// No description provided for @codexRights1.
  ///
  /// In en, this message translates to:
  /// **'Reproduce, distribute and publicly communicate the work'**
  String get codexRights1;

  /// No description provided for @codexRights2.
  ///
  /// In en, this message translates to:
  /// **'Modify, transform the work and create derivative works'**
  String get codexRights2;

  /// No description provided for @codexRights3.
  ///
  /// In en, this message translates to:
  /// **'Use the work for commercial purposes'**
  String get codexRights3;

  /// No description provided for @codexAttributionRequired.
  ///
  /// In en, this message translates to:
  /// **'Mandatory condition: Attribution through citation \"Source: AstroGods (astrogods.it) - CC BY 4.0 License\"'**
  String get codexAttributionRequired;

  /// No description provided for @codexThirdPartyLicenseHierarchy.
  ///
  /// In en, this message translates to:
  /// **'Where Codex content incorporates third-party materials subject to more restrictive licenses, the terms of the more restrictive license shall prevail. Users must identify and comply with all applicable license requirements, including attribution to original sources.'**
  String get codexThirdPartyLicenseHierarchy;

  /// No description provided for @aiGeneratedInterpretations.
  ///
  /// In en, this message translates to:
  /// **'C) AI-generated personalized interpretations'**
  String get aiGeneratedInterpretations;

  /// No description provided for @aiGeneratedInterpretationsText.
  ///
  /// In en, this message translates to:
  /// **'The personalized astrological interpretations generated by the service may be freely reused by users for any purpose, provided they are accompanied by the statement: \"Interpretation generated by AstroGods (astrogods.it)\"'**
  String get aiGeneratedInterpretationsText;

  /// No description provided for @startFreeSevenDays.
  ///
  /// In en, this message translates to:
  /// **'START FREE - 7 DAYS'**
  String get startFreeSevenDays;

  /// No description provided for @thenPricePerMonth.
  ///
  /// In en, this message translates to:
  /// **'Then {price}/month'**
  String thenPricePerMonth(Object price);

  /// No description provided for @billedAnnuallyAt.
  ///
  /// In en, this message translates to:
  /// **'billed {amount}/year'**
  String billedAnnuallyAt(Object amount);

  /// No description provided for @saveAmount.
  ///
  /// In en, this message translates to:
  /// **'SAVE {amount}/YEAR'**
  String saveAmount(Object amount);

  /// No description provided for @exploreOtherPlans.
  ///
  /// In en, this message translates to:
  /// **'Explore other plans'**
  String get exploreOtherPlans;

  /// No description provided for @hideOtherPlans.
  ///
  /// In en, this message translates to:
  /// **'Hide other plans'**
  String get hideOtherPlans;

  /// No description provided for @recommendedPlan.
  ///
  /// In en, this message translates to:
  /// **'BEST VALUE'**
  String get recommendedPlan;

  /// No description provided for @currentPlan.
  ///
  /// In en, this message translates to:
  /// **'Current plan'**
  String get currentPlan;

  /// No description provided for @upgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get upgrade;

  /// No description provided for @downgrade.
  ///
  /// In en, this message translates to:
  /// **'Downgrade to Standard'**
  String get downgrade;

  /// No description provided for @nextRenewal.
  ///
  /// In en, this message translates to:
  /// **'Next renewal'**
  String get nextRenewal;

  /// No description provided for @changePlan.
  ///
  /// In en, this message translates to:
  /// **'Change plan'**
  String get changePlan;

  /// No description provided for @birthInformation.
  ///
  /// In en, this message translates to:
  /// **'Birth Information'**
  String get birthInformation;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @placeOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Place of Birth'**
  String get placeOfBirth;

  /// No description provided for @timeOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Time of Birth'**
  String get timeOfBirth;

  /// No description provided for @unknownTime.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknownTime;

  /// No description provided for @person.
  ///
  /// In en, this message translates to:
  /// **'Person'**
  String get person;

  /// No description provided for @transitInformation.
  ///
  /// In en, this message translates to:
  /// **'Transit information'**
  String get transitInformation;

  /// No description provided for @transitDate.
  ///
  /// In en, this message translates to:
  /// **'Transit date'**
  String get transitDate;

  /// No description provided for @transitLocation.
  ///
  /// In en, this message translates to:
  /// **'Transit location'**
  String get transitLocation;

  /// No description provided for @transitPeriod.
  ///
  /// In en, this message translates to:
  /// **'Transit period'**
  String get transitPeriod;

  /// No description provided for @lunarPhase.
  ///
  /// In en, this message translates to:
  /// **'Lunar phase'**
  String get lunarPhase;

  /// No description provided for @dayNumber.
  ///
  /// In en, this message translates to:
  /// **'day {number}'**
  String dayNumber(int number);

  /// No description provided for @dailyTransitOf.
  ///
  /// In en, this message translates to:
  /// **'Daily transit of {name}'**
  String dailyTransitOf(String name);

  /// No description provided for @monthlyTransitOf.
  ///
  /// In en, this message translates to:
  /// **'Monthly transit of {name}'**
  String monthlyTransitOf(String name);

  /// No description provided for @pdfDownloadedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'PDF downloaded successfully'**
  String get pdfDownloadedSuccessfully;

  /// No description provided for @downloadPdf.
  ///
  /// In en, this message translates to:
  /// **'Download PDF'**
  String get downloadPdf;

  /// No description provided for @savePdfDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Save PDF'**
  String get savePdfDialogTitle;

  /// No description provided for @sharePdf.
  ///
  /// In en, this message translates to:
  /// **'Share PDF'**
  String get sharePdf;

  /// No description provided for @generatingPdf.
  ///
  /// In en, this message translates to:
  /// **'Generating PDF...'**
  String get generatingPdf;

  /// No description provided for @pdfGenerationError.
  ///
  /// In en, this message translates to:
  /// **'Error generating PDF: {error}'**
  String pdfGenerationError(Object error);

  /// No description provided for @generateDailyTransit.
  ///
  /// In en, this message translates to:
  /// **'Generate Daily Transit'**
  String get generateDailyTransit;

  /// No description provided for @generateMonthlyTransit.
  ///
  /// In en, this message translates to:
  /// **'Generate Monthly Transit'**
  String get generateMonthlyTransit;

  /// No description provided for @dailyMonthlyTransits.
  ///
  /// In en, this message translates to:
  /// **'Daily and monthly transits'**
  String get dailyMonthlyTransits;

  /// No description provided for @dailyPredictions.
  ///
  /// In en, this message translates to:
  /// **'Daily predictions'**
  String get dailyPredictions;

  /// No description provided for @monthlyPredictions.
  ///
  /// In en, this message translates to:
  /// **'Monthly predictions'**
  String get monthlyPredictions;

  /// No description provided for @anticipateYourDayWithTransits.
  ///
  /// In en, this message translates to:
  /// **'Anticipate your day with transit analysis'**
  String get anticipateYourDayWithTransits;

  /// No description provided for @anticipateYourMonthWithTransits.
  ///
  /// In en, this message translates to:
  /// **'Anticipate your month with transit analysis'**
  String get anticipateYourMonthWithTransits;

  /// No description provided for @pleaseSelectBirthChart.
  ///
  /// In en, this message translates to:
  /// **'Please select a birth chart'**
  String get pleaseSelectBirthChart;

  /// No description provided for @pleaseSelectDate.
  ///
  /// In en, this message translates to:
  /// **'Please select a date'**
  String get pleaseSelectDate;

  /// No description provided for @pleaseSelectLocation.
  ///
  /// In en, this message translates to:
  /// **'Please select a location'**
  String get pleaseSelectLocation;

  /// No description provided for @selectLocation.
  ///
  /// In en, this message translates to:
  /// **'Select location'**
  String get selectLocation;

  /// No description provided for @transitFor.
  ///
  /// In en, this message translates to:
  /// **'Transit for'**
  String get transitFor;

  /// No description provided for @dailySkyOf.
  ///
  /// In en, this message translates to:
  /// **'Sky of the day'**
  String get dailySkyOf;

  /// No description provided for @monthlySkyOf.
  ///
  /// In en, this message translates to:
  /// **'Sky of the month'**
  String get monthlySkyOf;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @selectMonth.
  ///
  /// In en, this message translates to:
  /// **'Select Month'**
  String get selectMonth;

  /// No description provided for @selectChart.
  ///
  /// In en, this message translates to:
  /// **'Select chart'**
  String get selectChart;

  /// No description provided for @subscribeToDaily.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to daily horoscope'**
  String get subscribeToDaily;

  /// No description provided for @subscribeToMonthly.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to monthly horoscope'**
  String get subscribeToMonthly;

  /// No description provided for @unsubscribe.
  ///
  /// In en, this message translates to:
  /// **'Unsubscribe'**
  String get unsubscribe;

  /// No description provided for @subscribeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Successfully subscribed to newsletter'**
  String get subscribeSuccess;

  /// No description provided for @unsubscribeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Successfully unsubscribed from newsletter'**
  String get unsubscribeSuccess;

  /// No description provided for @noNewsletterSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'No active horoscope by email'**
  String get noNewsletterSubscriptions;

  /// No description provided for @emailNotifications.
  ///
  /// In en, this message translates to:
  /// **'Horoscope by email'**
  String get emailNotifications;

  /// No description provided for @newsletterType.
  ///
  /// In en, this message translates to:
  /// **'Newsletter type'**
  String get newsletterType;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get currentLocation;

  /// No description provided for @addNewsletter.
  ///
  /// In en, this message translates to:
  /// **'Add horoscope by email'**
  String get addNewsletter;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @birthChartCreated.
  ///
  /// In en, this message translates to:
  /// **'Birth chart created successfully'**
  String get birthChartCreated;

  /// No description provided for @authenticationRequired.
  ///
  /// In en, this message translates to:
  /// **'Authentication required'**
  String get authenticationRequired;

  /// No description provided for @pleaseLoginToSaveCharts.
  ///
  /// In en, this message translates to:
  /// **'Please login to save birth charts to your account. Without login, charts cannot be saved for future use.'**
  String get pleaseLoginToSaveCharts;

  /// No description provided for @premiumRequiredForDailyTransit.
  ///
  /// In en, this message translates to:
  /// **'Premium subscription required to generate daily transit readings'**
  String get premiumRequiredForDailyTransit;

  /// No description provided for @premiumRequiredForMonthlyTransit.
  ///
  /// In en, this message translates to:
  /// **'Premium subscription required to generate monthly transit readings'**
  String get premiumRequiredForMonthlyTransit;

  /// No description provided for @premiumRequiredForSynastry.
  ///
  /// In en, this message translates to:
  /// **'Premium subscription required to create couple compatibility analyses'**
  String get premiumRequiredForSynastry;

  /// No description provided for @unsubscribeError.
  ///
  /// In en, this message translates to:
  /// **'Failed to unsubscribe'**
  String get unsubscribeError;

  /// No description provided for @unsubscribeSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'You will no longer receive these emails. You can resubscribe anytime from your account settings.'**
  String get unsubscribeSuccessMessage;

  /// No description provided for @goHome.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get goHome;

  /// No description provided for @allNewsletters.
  ///
  /// In en, this message translates to:
  /// **'All newsletters'**
  String get allNewsletters;

  /// No description provided for @birthChart.
  ///
  /// In en, this message translates to:
  /// **'Birth chart'**
  String get birthChart;

  /// No description provided for @processingUnsubscribeRequest.
  ///
  /// In en, this message translates to:
  /// **'Processing unsubscribe request...'**
  String get processingUnsubscribeRequest;

  /// No description provided for @unknownErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Unknown error occurred'**
  String get unknownErrorOccurred;

  /// No description provided for @networkErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Network error occurred'**
  String get networkErrorOccurred;

  /// No description provided for @newMoon.
  ///
  /// In en, this message translates to:
  /// **'New moon'**
  String get newMoon;

  /// No description provided for @waxingCrescent.
  ///
  /// In en, this message translates to:
  /// **'Waxing crescent'**
  String get waxingCrescent;

  /// No description provided for @firstQuarter.
  ///
  /// In en, this message translates to:
  /// **'First quarter'**
  String get firstQuarter;

  /// No description provided for @waxingGibbous.
  ///
  /// In en, this message translates to:
  /// **'Waxing gibbous'**
  String get waxingGibbous;

  /// No description provided for @fullMoon.
  ///
  /// In en, this message translates to:
  /// **'Full moon'**
  String get fullMoon;

  /// No description provided for @waningGibbous.
  ///
  /// In en, this message translates to:
  /// **'Waning gibbous'**
  String get waningGibbous;

  /// No description provided for @lastQuarter.
  ///
  /// In en, this message translates to:
  /// **'Last quarter'**
  String get lastQuarter;

  /// No description provided for @waningCrescent.
  ///
  /// In en, this message translates to:
  /// **'Waning crescent'**
  String get waningCrescent;

  /// No description provided for @dayCount.
  ///
  /// In en, this message translates to:
  /// **'Day {day}'**
  String dayCount(Object day);

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'Connection failed. Check your network and try again.'**
  String get connectionError;

  /// No description provided for @serverUnavailable.
  ///
  /// In en, this message translates to:
  /// **'We\'re making some improvements. Back in a moment!'**
  String get serverUnavailable;

  /// No description provided for @connectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'The request took too long. Please try again.'**
  String get connectionTimeout;

  /// No description provided for @aboutAndFaq.
  ///
  /// In en, this message translates to:
  /// **'About and FAQ'**
  String get aboutAndFaq;

  /// No description provided for @aboutFaqTitle.
  ///
  /// In en, this message translates to:
  /// **'About AstroGods'**
  String get aboutFaqTitle;

  /// No description provided for @aboutFaqTableOfContents.
  ///
  /// In en, this message translates to:
  /// **'Table of contents'**
  String get aboutFaqTableOfContents;

  /// No description provided for @storySectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our story'**
  String get storySectionTitle;

  /// No description provided for @missionSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our mission'**
  String get missionSectionTitle;

  /// No description provided for @teamSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'The team'**
  String get teamSectionTitle;

  /// No description provided for @faqSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently asked questions'**
  String get faqSectionTitle;

  /// No description provided for @storyText.
  ///
  /// In en, this message translates to:
  /// **'AstroGods was born from a friendship. Arcangelo has always been struck by Jacopo\'s ability to describe people with precision based only on their birth date, and to read moments of his life with an inexplicable depth. He wanted to always carry that perspective with him, and so AstroGods was born: an attempt to translate into an algorithm the method Jacopo uses to decipher reality through Astrology.'**
  String get storyText;

  /// No description provided for @missionText.
  ///
  /// In en, this message translates to:
  /// **'Ours is first and foremost a research mission: we ourselves are curious to discover what is possible with this tool. We use software that considers all factors simultaneously to reach increasingly precise interpretations. AstroGods makes astrological interpretation more accessible to non-experts, while also simplifying the work of astrologers: no matter how skilled or experienced, they must symbolically blend infinite elements. Having a tool that keeps them all in consideration means nothing gets forgotten: a support that enhances, not replaces, human expertise.'**
  String get missionText;

  /// No description provided for @teamMemberJacopoTitle.
  ///
  /// In en, this message translates to:
  /// **'Jacopo Trombetti'**
  String get teamMemberJacopoTitle;

  /// No description provided for @teamMemberJacopoRole.
  ///
  /// In en, this message translates to:
  /// **'Astrologer'**
  String get teamMemberJacopoRole;

  /// No description provided for @teamMemberJacopoDescription.
  ///
  /// In en, this message translates to:
  /// **'Trained at the Accademia di Astrologia Egizia founded by Pascal Fabio Patruno, Jacopo is a brilliant astrologer capable of computing synastry mentally, memorizing degrees and planets from charts he has seen only once in his life.'**
  String get teamMemberJacopoDescription;

  /// No description provided for @teamMemberArcangeloTitle.
  ///
  /// In en, this message translates to:
  /// **'Arcangelo Massari'**
  String get teamMemberArcangeloTitle;

  /// No description provided for @teamMemberArcangeloRole.
  ///
  /// In en, this message translates to:
  /// **'Technical development'**
  String get teamMemberArcangeloRole;

  /// No description provided for @teamMemberArcangeloDescription.
  ///
  /// In en, this message translates to:
  /// **'Student of Jacopo and responsible for the technical side of AstroGods. Passionate about Astrology, studying the subject since 2016.'**
  String get teamMemberArcangeloDescription;

  /// No description provided for @teamMemberCorradoTitle.
  ///
  /// In en, this message translates to:
  /// **'Corrado Camponeschi'**
  String get teamMemberCorradoTitle;

  /// No description provided for @teamMemberCorradoRole.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get teamMemberCorradoRole;

  /// No description provided for @teamMemberCorradoDescription.
  ///
  /// In en, this message translates to:
  /// **'Explorer of various paths of self-knowledge, Corrado is responsible for spreading AstroGods to the world and building bridges between Astrology and other disciplines.'**
  String get teamMemberCorradoDescription;

  /// No description provided for @faq1Question.
  ///
  /// In en, this message translates to:
  /// **'Does artificial intelligence make interpretations random?'**
  String get faq1Question;

  /// No description provided for @faq1Answer.
  ///
  /// In en, this message translates to:
  /// **'AI plays a minor role in AstroGods. The interpretations are handwritten and curated by Jacopo Trombetti and Arcangelo Massari. The astronomical calculations use the Swiss Ephemeris, the most precise in the world. AI only assembles the various interpretive pieces into coherent sentences, nothing more.'**
  String get faq1Answer;

  /// No description provided for @faq2Question.
  ///
  /// In en, this message translates to:
  /// **'Why are Uranus, Neptune, and Pluto not included?'**
  String get faq2Question;

  /// No description provided for @faq2Answer.
  ///
  /// In en, this message translates to:
  /// **'According to this interpretive approach, the human energy constitution articulates across seven chakras corresponding to seven planets, from the Moon to Saturn. Beyond these, the human constitution simply has no receptive channels for superior planetary powers. These planets have an impact, but of a generational type: for example, Pluto in Scorpio (1983-1995) characterizes an entire generation. They are more useful for studying historical periods than individuals, and therefore are not included.'**
  String get faq2Answer;

  /// No description provided for @faq3Question.
  ///
  /// In en, this message translates to:
  /// **'Why are the planets in different Houses compared to other apps?'**
  String get faq3Question;

  /// No description provided for @faq3Answer.
  ///
  /// In en, this message translates to:
  /// **'Domification is the method used to calculate the twelve astrological Houses. Most apps use Placidus, which divides the sky based on time, creating unequal Houses that vary by latitude: some can be enormous, others tiny. We use Vehlow, which divides the zodiac into twelve equal Houses of 30 degrees each. It makes no symbolic sense to divide the human soul into unequal parts: no area of life is less important than another.'**
  String get faq3Answer;

  /// No description provided for @faq4Question.
  ///
  /// In en, this message translates to:
  /// **'Why is the birth time important?'**
  String get faq4Question;

  /// No description provided for @faq4Answer.
  ///
  /// In en, this message translates to:
  /// **'The Ascendant and Houses depend on the exact birth time. The entire chart rotates completely in 24 hours. Without the time of birth, we can only analyze planetary positions in signs, missing half of the symbolic picture: the Houses that describe in which areas of life planetary energies manifest.'**
  String get faq4Answer;

  /// No description provided for @faq5Question.
  ///
  /// In en, this message translates to:
  /// **'What is the source of the astrological calculations?'**
  String get faq5Question;

  /// No description provided for @faq5Answer.
  ///
  /// In en, this message translates to:
  /// **'We use the Swiss Ephemeris, the most precise astronomical tables in the world. Developed and maintained by Astrodienst (astro.com), they calculate exact planetary positions for any date in history or the future. They are the standard reference for professional astrological software.'**
  String get faq5Answer;

  /// No description provided for @faq6Question.
  ///
  /// In en, this message translates to:
  /// **'Why Egyptian Astrology?'**
  String get faq6Question;

  /// No description provided for @faq6Answer.
  ///
  /// In en, this message translates to:
  /// **'Egypt is the hermetic matrix of Western culture. Horoscopic Astrology was born in Alexandria, Egypt, where Pharaoh Nechepso and priest Petosiris wrote the foundational texts (~150-120 BCE) from which all Greek and Roman astrologers drew. Ptolemy, author of the Tetrabiblos (foundation of Western Astrology), worked in Alexandria. Hermes Trismegistus, the fusion of Greek Hermes and Egyptian Thoth, is considered the founder of this tradition. Egyptian Astrology is not a variant: it is the original source.'**
  String get faq6Answer;

  /// No description provided for @faq7Question.
  ///
  /// In en, this message translates to:
  /// **'Does this app replace consultation with an astrologer?'**
  String get faq7Question;

  /// No description provided for @faq7Answer.
  ///
  /// In en, this message translates to:
  /// **'No. Astrological elements have multiple symbolic meanings, and interpreting them within a specific energetic constitution requires an exchange between souls, hearts, and sensibilities. An expert astrologer can use AstroGods to simplify their work, but through personal exchange they will be better able to bring out deeper meanings. Furthermore, AstroGods does not yet consider the entire astrological spectrum: the expert astrologer remains irreplaceable.'**
  String get faq7Answer;

  /// No description provided for @viewChart.
  ///
  /// In en, this message translates to:
  /// **'View chart'**
  String get viewChart;

  /// No description provided for @chartOnlyMode.
  ///
  /// In en, this message translates to:
  /// **'Chart only, without reading'**
  String get chartOnlyMode;

  /// No description provided for @birthChartGraph.
  ///
  /// In en, this message translates to:
  /// **'Birth chart'**
  String get birthChartGraph;

  /// No description provided for @synastryGraph.
  ///
  /// In en, this message translates to:
  /// **'Synastry chart'**
  String get synastryGraph;

  /// No description provided for @dailyTransitGraph.
  ///
  /// In en, this message translates to:
  /// **'Daily transit chart'**
  String get dailyTransitGraph;

  /// No description provided for @monthlyTransitGraph.
  ///
  /// In en, this message translates to:
  /// **'Monthly transit chart'**
  String get monthlyTransitGraph;

  /// No description provided for @releaseNotes.
  ///
  /// In en, this message translates to:
  /// **'Release notes'**
  String get releaseNotes;

  /// No description provided for @releaseNotesTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s new'**
  String get releaseNotesTitle;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String version(Object version);

  /// No description provided for @releaseNotes_4_5_1.
  ///
  /// In en, this message translates to:
  /// **'New app icons. Improved logo quality in the menu. Fixed a validation issue when editing birth charts.'**
  String get releaseNotes_4_5_1;

  /// No description provided for @releaseNotes_4_0_1.
  ///
  /// In en, this message translates to:
  /// **'Fixed an issue where the PDF button did not appear after reading generation. Saved charts now refresh correctly when navigating back with the browser.'**
  String get releaseNotes_4_0_1;

  /// No description provided for @releaseNotes_4_0_0.
  ///
  /// In en, this message translates to:
  /// **'High-resolution images in fullscreen view. New aspect grid for synastry and transits. PDF exports now include details and aspect grid pages. Enhanced desktop navigation with arrows, clickable indicators, and keyboard shortcuts. Improved fullscreen zoom for charts and images. Lighter and faster app. Fixed layout issue in landscape mode on mobile.'**
  String get releaseNotes_4_0_0;

  /// No description provided for @releaseNotes_3_0_0.
  ///
  /// In en, this message translates to:
  /// **'New release notes screen to view version history. The app now checks compatibility and notifies you when an update is available. Improved reading generation stability.'**
  String get releaseNotes_3_0_0;

  /// No description provided for @releaseNotes_2_4_0.
  ///
  /// In en, this message translates to:
  /// **'Readings can now resume if your connection is interrupted. Improved overall stability.'**
  String get releaseNotes_2_4_0;

  /// No description provided for @releaseNotes_2_3_0.
  ///
  /// In en, this message translates to:
  /// **'Enhanced chart visualization with degree markers and planet connector lines. Improved water sign colors for better contrast. Visual refinements to the chart display.'**
  String get releaseNotes_2_3_0;

  /// No description provided for @releaseNotes_2_2_1.
  ///
  /// In en, this message translates to:
  /// **'Bug fixes and stability improvements.'**
  String get releaseNotes_2_2_1;

  /// No description provided for @releaseNotes_2_2_0.
  ///
  /// In en, this message translates to:
  /// **'Faster transit calculations, up to 40% faster for monthly transits. New team member: Corrado Camponeschi.'**
  String get releaseNotes_2_2_0;

  /// No description provided for @releaseNotes_2_1_0.
  ///
  /// In en, this message translates to:
  /// **'Chart-only PDF download for birth chart, synastry, and transits. PDF export for daily and monthly transit readings. House numbers now shown in chart details. Birth charts created before registration are now automatically linked to your account.'**
  String get releaseNotes_2_1_0;

  /// No description provided for @releaseNotes_2_0_4.
  ///
  /// In en, this message translates to:
  /// **'Bug fixes and stability improvements.'**
  String get releaseNotes_2_0_4;

  /// No description provided for @releaseNotes_2_0_3.
  ///
  /// In en, this message translates to:
  /// **'Performance improvements.'**
  String get releaseNotes_2_0_3;

  /// No description provided for @releaseNotes_2_0_2.
  ///
  /// In en, this message translates to:
  /// **'Bug fixes and stability improvements.'**
  String get releaseNotes_2_0_2;

  /// No description provided for @releaseNotes_2_0_1.
  ///
  /// In en, this message translates to:
  /// **'Initial release with birth chart readings, synastry analysis for couple compatibility, and daily and monthly transit predictions. PDF export. Full support for English and Italian.'**
  String get releaseNotes_2_0_1;

  /// No description provided for @updateRequired.
  ///
  /// In en, this message translates to:
  /// **'Just a moment!'**
  String get updateRequired;

  /// No description provided for @updateNow.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateNow;

  /// No description provided for @errorMessageCopied.
  ///
  /// In en, this message translates to:
  /// **'Error message copied to clipboard'**
  String get errorMessageCopied;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
