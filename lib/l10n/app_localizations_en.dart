// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get previewDescription => 'Preview of your birth chart analysis';

  @override
  String get fullPersonalityAnalysis => 'Full personality analysis';

  @override
  String get detailedPlanetaryInterpretation =>
      'Detailed planetary interpretation';

  @override
  String get personalizedInsights => 'Personalized insights';

  @override
  String get getFullReading => 'Get full reading';

  @override
  String get generating => 'Generating...';

  @override
  String get generatingReading => 'Generating reading...';

  @override
  String get compatibilityAnalysis => 'Compatibility Analysis';

  @override
  String generateDetailedCompatibilityAnalysis(Object relationshipTitle) {
    return 'Generate a detailed compatibility analysis between $relationshipTitle';
  }

  @override
  String get generateAnalysis => 'Generate Analysis';

  @override
  String get errorTitle => 'Error';

  @override
  String generatingTopic(Object topic) {
    return 'Generating: $topic...';
  }

  @override
  String get synastry => 'Synastry';

  @override
  String get personA => 'Person A';

  @override
  String get personB => 'Person B';

  @override
  String synastryBetween(Object person1, Object person2) {
    return 'Synastry between $person1 and $person2';
  }

  @override
  String birthChartOf(Object name) {
    return 'Birth chart of $name';
  }

  @override
  String get preparingReading => 'Preparing reading...';

  @override
  String get loadingImage => 'Loading image...';

  @override
  String get read => 'Read';

  @override
  String get logoutSuccessful => 'Logout successful';

  @override
  String get appTitle => 'AstroGods';

  @override
  String get homeTitle => 'Home';

  @override
  String get personalityTitle => 'Personality';

  @override
  String get relationshipsTitle => 'Relationships';

  @override
  String get predictionsTitle => 'Forecast';

  @override
  String get dailyPredictionsTitle => 'Daily Predictions';

  @override
  String get monthlyPredictionsTitle => 'Monthly Predictions';

  @override
  String get codexTitle => 'Codex';

  @override
  String get savedChartsTitle => 'Saved analyses';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get italian => 'Italian';

  @override
  String get theme => 'Theme';

  @override
  String get lightMode => 'Light';

  @override
  String get darkMode => 'Dark';

  @override
  String get systemMode => 'System';

  @override
  String get unveilHeart =>
      'Unveil the heart of a person through their birth chart';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get birthPlace => 'Birth Place';

  @override
  String get birthDate => 'birth date';

  @override
  String get birthTime => 'birth time';

  @override
  String get dontKnowBirthTime => 'I don\'t know the birth time';

  @override
  String get withoutBirthTimeWarning =>
      'Without the time of birth the reading will not take the Ascendant into account';

  @override
  String get getStarted => 'GET STARTED';

  @override
  String get subtitlePart1 => 'Align';

  @override
  String get subtitlePart2 => 'with your';

  @override
  String get subtitlePart3 => 'sky';

  @override
  String get birthChartReading => 'Birth Chart Reading';

  @override
  String birthChartFor(Object name) {
    return 'Birth Chart for $name';
  }

  @override
  String place(Object place) {
    return 'Place: $place';
  }

  @override
  String get at => 'at';

  @override
  String errorLoadingChart(Object error) {
    return 'Error loading chart: $error';
  }

  @override
  String get chartNotAvailable => 'Chart not available.';

  @override
  String get readingGeneratedSuccessfully => 'Reading generated successfully!';

  @override
  String get subscriptionRequiredMessage =>
      'You need an active subscription to generate readings after your free reading. Subscribe to continue exploring other birth charts.';

  @override
  String get discoverHeartOfRelationship =>
      'Discover the heart of a relationship through its synastry';

  @override
  String get birthChartsMustBeDifferent =>
      'The two birth charts must be different';

  @override
  String get errorLoadingSavedCharts => 'Error loading saved charts';

  @override
  String get tryAgain => 'Try again';

  @override
  String get noSavedBirthCharts => 'No saved birth charts';

  @override
  String get needTwoBirthChartsForSynastry =>
      'To create a synastry you need at least two saved birth charts.';

  @override
  String get oneMoreChartNeeded =>
      'You have one chart. Create a second for synastry';

  @override
  String get needBirthChartForPredictions =>
      'You need a birth chart first for predictions';

  @override
  String get createBirthChart => 'Create birth chart';

  @override
  String get createFirstChart => 'Create first chart';

  @override
  String get createSecondChart => 'Create second chart';

  @override
  String get searchBirthCharts => 'Search birth charts...';

  @override
  String get searchByNameOrPlace => 'Search by name or place';

  @override
  String get selectFirstBirthChart => 'Select the first birth chart';

  @override
  String get selectSecondBirthChart => 'Select the second birth chart';

  @override
  String get creating => 'Creating...';

  @override
  String get createSynastry => 'Create synastry';

  @override
  String get synastryDescription =>
      'Synastry is the art of comparing two birth charts to understand the dynamics of a relationship.';

  @override
  String get transitDescription =>
      'Transits are the movements of planets that, passing over natal sky positions, activate temporary astrological influences.';

  @override
  String get birthChartDescription =>
      'The birth chart is the symbolic representation of the positions of celestial bodies at the moment of birth.';

  @override
  String get viewPlans => 'View plans';

  @override
  String get cancel => 'Cancel';

  @override
  String get pleaseSelectBirthPlace => 'Please select a birth place';

  @override
  String get searching => 'Searching...';

  @override
  String get searchInProgress => 'Search in progress...';

  @override
  String get noResultsFound => 'No results found';

  @override
  String forSearchTerm(Object term) {
    return 'for \"$term\"';
  }

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get email => 'email';

  @override
  String get password => 'password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get resetPassword => 'Reset password';

  @override
  String get resetPasswordTitle => 'Reset your password';

  @override
  String get sendResetLink => 'Send reset link';

  @override
  String get backToLogin => 'Back to login';

  @override
  String get checkYourEmail => 'Check your email';

  @override
  String resetLinkSent(Object email) {
    return 'We\'ve sent a password reset link to $email';
  }

  @override
  String get didntReceiveEmail => 'Didn\'t receive the email?';

  @override
  String get checkSpamFolder => 'Please also check your spam or junk folder';

  @override
  String get resendEmail => 'Resend email';

  @override
  String get enterNewPassword => 'Enter new password';

  @override
  String get newPassword => 'New password';

  @override
  String get confirmNewPassword => 'Confirm new password';

  @override
  String get passwordResetSuccessful => 'Password reset successful';

  @override
  String get invalidResetToken => 'Invalid or expired reset token';

  @override
  String get emailSentSuccessfully => 'Email sent successfully';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get signUp => 'Sign up';

  @override
  String get signIn => 'Sign in';

  @override
  String get logout => 'Logout';

  @override
  String get profile => 'Profile';

  @override
  String get welcomeBack => 'Welcome back!';

  @override
  String get createAccount => 'Create your account';

  @override
  String get loginToAccount => 'Login to your account';

  @override
  String get pleaseFillAllFields => 'Please fill all required fields';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get invalidEmail => 'Please enter a valid email address';

  @override
  String get passwordTooShort => 'Password must be at least 8 characters long';

  @override
  String get loginSuccessful => 'Login successful!';

  @override
  String get registrationSuccessful => 'Registration successful!';

  @override
  String get personalInfo => 'Personal Information';

  @override
  String get birthInfo => 'Birth Information';

  @override
  String get next => 'Next';

  @override
  String get previous => 'Previous';

  @override
  String get finish => 'Finish';

  @override
  String get emailAlreadyExists => 'This email address is already registered';

  @override
  String get goToLogin => 'Login';

  @override
  String get chartsCountSingular => '1 saved analysis';

  @override
  String chartsCountPlural(Object count) {
    return '$count saved analyses';
  }

  @override
  String get birthChartsCountSingular => '1 saved birth chart';

  @override
  String birthChartsCountPlural(Object count) {
    return '$count saved birth charts';
  }

  @override
  String get synastriesCountSingular => '1 saved synastry';

  @override
  String synastriesCountPlural(Object count) {
    return '$count saved synastries';
  }

  @override
  String get chartRemovedFromSaved => 'Chart removed from saved';

  @override
  String get synastryRemovedFromSaved => 'Synastry removed from saved';

  @override
  String get chartSetAsPersonal => 'Chart set as personal';

  @override
  String get chartRemovedFromPersonal => 'Chart removed from personal';

  @override
  String get viewReading => 'View reading';

  @override
  String get generateReading => 'Generate reading';

  @override
  String get removeFromPersonal => 'Not my theme';

  @override
  String get setAsPersonal => 'This is my theme';

  @override
  String get removeFromSaved => 'Remove from saved';

  @override
  String get removeChart => 'Remove chart';

  @override
  String removeChartConfirmation(Object name) {
    return 'Are you sure you want to remove \"$name\" from saved charts?';
  }

  @override
  String get remove => 'Remove';

  @override
  String get retry => 'Retry';

  @override
  String get noSavedCharts => 'No saved charts';

  @override
  String get noSavedChartsDescription =>
      'Birth charts you save will appear here.';

  @override
  String get noSavedAnalyses => 'No saved analyses';

  @override
  String get noSavedAnalysesDescription =>
      'Analyses you save will appear here.';

  @override
  String get noSavedSynastries => 'No saved synastries';

  @override
  String get noSavedSynastriesDescription =>
      'Synastries you create will appear here.';

  @override
  String get noSavedBirthChartsDescription =>
      'Birth charts you save will appear here.';

  @override
  String get personal => 'Personal';

  @override
  String get readingAvailable => 'Reading available';

  @override
  String get generateReadingAction => 'Generate reading';

  @override
  String get regenerateReading => 'Regenerate reading';

  @override
  String get searchCharts => 'Search charts...';

  @override
  String get searchSynastries => 'Search synastries...';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get googleSignInSuccessful => 'Successfully signed in with Google';

  @override
  String get googleSignUpSuccessful => 'Successfully signed up with Google';

  @override
  String googleSignInError(Object error) {
    return 'Google Sign-In error: $error';
  }

  @override
  String googleSignUpError(Object error) {
    return 'Google Sign-Up error: $error';
  }

  @override
  String get or => 'OR';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileUpdatedSuccessfully => 'Profile updated successfully';

  @override
  String get userNotFound => 'User not found';

  @override
  String get notProvided => 'Not provided';

  @override
  String get unknown => 'Unknown';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get deleteAccountTitle => 'Delete Account';

  @override
  String get deleteAccountWarning =>
      'This action cannot be undone. All your data, saved charts, and profile pictures will be permanently deleted.';

  @override
  String get deleteAccountConfirmation =>
      'Are you absolutely sure you want to delete your account?';

  @override
  String get typeDeleteToConfirm => 'Type DELETE to confirm';

  @override
  String get deleteConfirmationWord => 'DELETE';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get editBirthChart => 'Edit Birth Chart';

  @override
  String get givenNameRequired => 'First name is required';

  @override
  String get familyNameRequired => 'Last name is required';

  @override
  String get birthTimeRequired => 'Enter time or check unknown time';

  @override
  String get birthChartUpdated => 'Birth chart updated successfully';

  @override
  String get editDaily => 'Edit daily newsletter';

  @override
  String get editMonthly => 'Edit monthly newsletter';

  @override
  String get save => 'Save';

  @override
  String get updateSuccess => 'Newsletter updated successfully';

  @override
  String get accountDeleted => 'Account deleted successfully';

  @override
  String get preferences => 'Preferences';

  @override
  String get about => 'About';

  @override
  String get appVersion => 'App Version';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get account => 'Account';

  @override
  String get daily => 'Daily';

  @override
  String get monthly => 'Monthly';

  @override
  String get dailyPredictionsContent =>
      'Your personalized daily astrological predictions.';

  @override
  String get monthlyPredictionsContent =>
      'Your detailed monthly astrological predictions.';

  @override
  String get pleaseEnterFirstName => 'Please enter first name';

  @override
  String get pleaseEnterLastName => 'Please enter last name';

  @override
  String get pleaseSelectBirthDate => 'Please select a birth date';

  @override
  String get pleaseSelectBirthTime => 'Please select birth time';

  @override
  String errorCreatingBirthChart(Object error) {
    return 'Error creating birth chart: $error';
  }

  @override
  String get analyzing => 'ANALYZING...';

  @override
  String get chooseAstrologicalPath => 'Nourish to be nourished';

  @override
  String get semiannual => 'Semiannual';

  @override
  String get annual => 'Annual';

  @override
  String get premiumMonthly => 'Premium - monthly';

  @override
  String get standardMonthly => 'Standard - monthly';

  @override
  String get premiumSemiannual => 'Premium - semiannual';

  @override
  String get standardSemiannual => 'Standard - semiannual';

  @override
  String get premiumAnnual => 'Premium - annual';

  @override
  String get standardAnnual => 'Standard - annual';

  @override
  String get monthPeriod => 'month';

  @override
  String get billedMonthly => 'Billed monthly';

  @override
  String get billedSemiannually => 'Billed every 6 months';

  @override
  String get billedAnnually => 'Billed annually';

  @override
  String get save20Percent => 'Save 20%';

  @override
  String get save40Percent => 'Save 40%';

  @override
  String get save33Percent => 'Save 33%';

  @override
  String get oneMonthFree => '1 month FREE';

  @override
  String get fourMonthsFree => '4 months FREE';

  @override
  String get birthChartReadings => 'Birth chart readings';

  @override
  String get couplesChartReadings => 'Couple\'s chart readings';

  @override
  String get horoscopeNewsletter => 'Daily and monthly horoscope newsletter';

  @override
  String get sevenDaysFreeTrial => '7 days of free trial';

  @override
  String get startNow => 'Start now';

  @override
  String get moneyBackGuarantee => '30-day money-back guarantee';

  @override
  String get birthChartPreview => 'Birth chart preview';

  @override
  String get loginRequiredForFullReading =>
      'Please login to get your complete personalized reading';

  @override
  String get previewTitle => 'Your birth chart is ready!';

  @override
  String get backToForm => 'Back to form';

  @override
  String get paymentProcessingError => 'Payment processing error occurred';

  @override
  String get subscriptionActivated => 'Subscription activated successfully!';

  @override
  String get subscriptionConfirmationFailed =>
      'Failed to confirm subscription. Please contact support.';

  @override
  String get confirmingSubscription => 'Confirming your subscription...';

  @override
  String get subscriptionsTitle => 'Subscriptions';

  @override
  String get subscriptionAmount => 'Amount';

  @override
  String get subscriptionStartDate => 'Started';

  @override
  String get subscriptionEndDate => 'Renews';

  @override
  String get subscriptionCancelsOn => 'Cancels';

  @override
  String get manageSubscription => 'Manage subscription';

  @override
  String get noActiveSubscription => 'No subscription';

  @override
  String get reactivateSubscription => 'Reactivate';

  @override
  String get subscriptionActive => 'Active';

  @override
  String get subscriptionTrialing => 'Trial';

  @override
  String get loadingSubscriptions => 'Loading subscriptions...';

  @override
  String get failedToLoadSubscriptions => 'Failed to load subscriptions';

  @override
  String get paymentFailed => 'Payment Failed';

  @override
  String get paymentFailedDescription =>
      'Your subscription payment could not be processed. Please update your payment method to continue using our services.';

  @override
  String get updatePaymentMethod => 'Update Payment Method';

  @override
  String get subscriptionPastDue => 'Payment Overdue';

  @override
  String get subscriptionUnpaid => 'Payment Failed';

  @override
  String get subscriptionIncomplete => 'Payment Incomplete';

  @override
  String get house1Alt => 'Identity and self-expression';

  @override
  String get house2Alt => 'Material resources and values';

  @override
  String get house3Alt => 'Communication and learning';

  @override
  String get house4Alt => 'Family and emotional foundation';

  @override
  String get house5Alt => 'Creativity and self-expression';

  @override
  String get house6Alt => 'Work and health';

  @override
  String get house8Alt => 'Transformation and hidden matters';

  @override
  String get house9Alt => 'Higher knowledge and spirituality';

  @override
  String get house10Alt => 'Career and public image';

  @override
  String get house11Alt => 'Friendships and innovation';

  @override
  String get house12Alt => 'Transcendence and hidden realms';

  @override
  String get exploreMore => 'Learn More';

  @override
  String get cavernDetailsTitle => 'Book of Caverns';

  @override
  String get generalIntroduction => 'General Introduction';

  @override
  String get birthChartNotFound => 'Birth chart not found';

  @override
  String get synastryNotFound => 'Synastry not found';

  @override
  String get goToHome => 'Go to Home';

  @override
  String get bookOfCaverns => 'Book of Caverns';

  @override
  String get bookOfCavernsDescription =>
      'Explore the ancient Egyptian Book of Caverns and its connection to the astrological houses';

  @override
  String cavernComingSoon(Object number) {
    return 'Cavern $number - Coming Soon';
  }

  @override
  String get tapToExploreCavern => 'Tap to explore this cavern';

  @override
  String get contentComingSoon => 'Content coming soon';

  @override
  String get bookOfCavernsIntroduction =>
      '## Egyptian Funerary Texts and Astrology\n\nThis treatment of the **12 astrological houses** is based on Egyptian funerary texts from the New Kingdom describing the sun god Ra\'s journey through the underworld, following Angelo Angelini\'s astrological interpretation.\n\n## The Two Source Texts\n\nThe twelve caverns presented here derive from two distinct Egyptian texts:\n\n### Caverns 1-6: The Book of Caverns Proper\nA Ramesside funerary text describing Ra\'s nocturnal journey through six sections of the Duat. Characterized by scenes of punishment for Ra and Osiris\'s enemies, this text is attested in its most complete versions in the tomb of Ramses VI (KV9) and the Osireion of Seti I at Abydos.\n\nContemporary Egyptology maintains that the Book of Caverns actually contains all twelve caverns, organized with multiple caverns per section ([Power, 2015](https://doi.org/10.17638/03032971)). For this astrological treatment, however, we follow Angelini\'s interpretation that assimilates each of the six sections to an astrological house.\n\n### Caverns 8-12: The Book of the Twelve Caves\nAlso known as **Spell of the Twelve Caves**, this text was long considered part of the Book of the Dead. Alexandre Piankoff demonstrated it is an independent composition with a benevolent liturgical character: deities grant favors to the deceased without scenes of punishment.\n\nThe first seven caverns of the Book of the Twelve Caves are represented in an extremely synthetic and schematic manner, providing very little information about their content, while only the last five (from 8 to 12) are described in detail.\n\nAngelo Angelini interprets the eighth cavern of the Book of the Twelve Caves as the eighth astrological house—a symbolic, not philological connection.\n\n## The Meaning of \"Cavern\"\n\nIn Egyptian: **Kerreret** or **Kerret**\n\n![Hieroglyph of Kerreret](caverna.webp)\n\nAccording to Angelo Angelini, the hieroglyph combines:\n- **Q** (triangle): matter to be worked\n- **Seeds**: time\n- **Open rectangle**: space\n\nThe term thus indicates \"a temporal space\"—the essence of astrological domification, where celestial time (planetary transits) crystallizes into earthly experience.\n\n## Sources\n\n### Book of Caverns (caverns 1-6)\n- **Philological reconstruction**: Werning, D. A. (2019). The Book of Caverns in Theban Tomb 33: Late Period reception process and individual adaptation. *Bulletin de l\'Institut français d\'archéologie orientale*, *118*, 525-554. [https://doi.org/10.4000/bifao.5059](https://doi.org/10.4000/bifao.5059)\n- **Iconographic interpretation**: Power, D. M. (2019). *Aspects of iconography and transmission in the Book of Caverns* [Doctoral dissertation]. University of Liverpool. [https://doi.org/10.17638/03032971](https://doi.org/10.17638/03032971)\n- **Iconographic source**: [Theban Mapping Project](https://thebanmappingproject.com/tombs/kv-09-rameses-v-and-rameses-vi), tomb of Ramses VI\n\n### Book of the Twelve Caves (caverns 8-12)\n- **Philological reconstruction**: Méndez Rodríguez, D. M. (2015). The transmission of the Book of the Twelve Caverns. In G. Rosati & M. C. Guidotti (Eds.), *Proceedings of the XI International Congress of Egyptologists* (pp. 405-409). Archaeopress. [https://doi.org/10.2307/j.ctv177tjnf.77](https://doi.org/10.2307/j.ctv177tjnf.77)\n- **Iconographic interpretation**: Piankoff, A. (1974). *The wandering of the soul*. Princeton University Press. [https://archive.org/details/wanderingofsoul0006pian](https://archive.org/details/wanderingofsoul0006pian)\n- **Iconographic source**: [Papyrus EA 10478](https://www.britishmuseum.org/collection/object/Y_EA10478-6), British Museum\n\n### Astrological Interpretation\n- Angelini, A. (1992). *Manuale di astrologia egizia*. Kemi.\n\n**Note**: Colors in illustrations of caverns 1-6 are suggestive and serve a communicative function to evoke the underworld atmosphere, not philological, as the originals on tomb walls are heavily deteriorated. For caverns 8-12, original colors from Papyrus EA 10478 of the British Museum have been used.';

  @override
  String get firstCavernTitle => 'First cavern - The entrance portal';

  @override
  String get firstCavernLiteralMeaning =>
      'The first division is composed of five registers (R) and 13 scenes (S), with a precise iconographic structure:\n\n[TABLE_CAVERNA_1]\n\n![Division structure](prima_divisione.webp)\n\nThis division begins with three serpentine guardians that Ra must convince to allow him to enter the afterlife.\n\nThis division also contains the first appearance of deities enclosed in ovals and the first appearance of Osiris in a sanctuary. It also includes elements of Osiris\' body, represented by the two discs raised above the heads of the deities and by the pieces of flesh that appear in the mounds in R4, S3. The inclusion of parts of Osiris\' body symbolizes the elements necessary for **solar-Osirian unity** - the process through which Ra (the daytime sun) and Osiris (the nighttime sun and the regenerative force of death) merge to complete the cosmic cycle of death and rebirth, allowing the daily resurrection of the sun.\n\nThe lower register is finally reserved for the punishment of the enemies of Ra and Osiris.';

  @override
  String get firstCavernEsotericMeaning =>
      '## Sons of earth\n\nAt the entrance to the caverns, Ra addresses the three guardian serpents with the words: \"O son of earth\". This invocation introduces the fundamental theme of the **terrestrial dimension of domification**: astrological houses are born from the encounter between heaven (the zodiac) and earth (the horizon at the time of birth), rooting cosmic energies in the concrete reality of human experience.\n\n## Ovals as magnetic envelopes\n\nThe **ovals that enclose the deities** are traditionally identified as sarcophagi. However, at a deeper level of interpretation, they are to be interpreted as **magnetic envelopes**: auras that surround the divine entities preventing their energies from dispersing. The bodies in their sepulchers are therefore bundles of energies that resolve into matter, enveloped by this magnetic ampule.\n\n## The first house\n\nIn astrological terms, the first cavern corresponds to the **first house**: the house of the ascendant, of the self and individual identity. This cavern represents the beginning of the initiatory journey through the twelve astrological houses, where the human soul must confront terrestrial and celestial forces to complete its process of spiritual evolution.';

  @override
  String get secondCavernTitle => 'Second cavern - The cavern of sustenance';

  @override
  String get secondCavernLiteralMeaning =>
      'Division Two consists of five registers (R) and 10 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_2]\n\n![Structure of the second division](seconda_divisione.webp)\n\nThis division begins, like the first, with serpent doorkeepers whom Ra must convince to gain access to the Underworld. It contains various groups of ovals with solar and Osirian elements.\n\n## The catfish-headed deities\n\nThe **catfish-headed deities** (R1, S2) are called **Nariu** and are associated with the inscription: \"O Nariu, lords of sustenance, who have become as Osiris...\".\n\n## The death of Osiris\n\nThe death of Osiris is highlighted by the **deities who mourn him** (R2, S1) and by the deities who guard a **chest containing the body of Osiris** (R3, S2).';

  @override
  String get secondCavernEsotericMeaning =>
      '## The cavern of nourishment\n\nAccording to Angelini, the Second Cavern has nourishment and abundance as its central theme. Ra addresses the deities: \"I illuminate you, oh afflicted ones, and make you satisfied with your sustenance\". The **Nariu** are primeval gods of abundance and nourishment, represented with catfish heads.\n\n## The second astrological house\n\nThis cavern corresponds to the **second house**: the place where the individual finds the resources necessary for their physical survival. It is the house of earnings and income, which reveals the impulse to gather and accumulate everything needed to maintain and protect material existence.';

  @override
  String get thirdCavernTitle =>
      'Third cavern - The cavern of formative relationships';

  @override
  String get thirdCavernLiteralMeaning =>
      'Division Three consists of 3 registers (R) and 13 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_3]\n\n![Structure of the third division](terza_divisione.webp)\n\nIn this division Ra physically enters the Underworld after gaining access from the doorkeepers. This division is the starting point for the **Solar-Osirian unity**, a process necessary for the sun god Ra to be reborn in the morning. The unity is represented in the central scene (R2, S3) where the reposing ithyphallic Osiris appears with a sun disk above his erect phallus.\n\n## The catfish-headed deities\n\nIn the first register (R1, S2) appear **7 catfish-headed deities** standing under a serpent. These are associated with the text addressing the \"gods who are in the sheepfold of Neheb-Kau\".\n\n## The double sphinx Aker\n\nThe central scene shows the **double sphinx Aker** with ithyphallic Osiris encircled by a serpent, representing the moment when the unity between Ra and Osiris begins. Aker is the ancient Egyptian earth deity and guardian of the Underworld, depicted as a double sphinx that protects the sun god during his nightly journey through the afterlife.';

  @override
  String get thirdCavernEsotericMeaning =>
      '## The cavern of spiritual qualities\n\nAccording to Angelini, the Third Cavern is characterized by the presence of **Neheb-Kau**, the great primeval serpent god. His name means \"He who unites the Ka\" and is also conceptually translated as \"Bestower of dignities\", that is, he who assigns positions and honors in the afterlife. The **Ka** in Egyptian conception is the life force, the spiritual double that distinguishes the living from the dead and must be nourished and preserved to ensure continuity in the afterlife.\n\n## The unifier of attributes\n\nNeheb-Kau is called in ancient texts \"unifier of attributes\", that is, he who reunites and coordinates the different spiritual qualities and characteristics necessary for complete existence in the afterlife. He is considered the \"Ka of every god\" and his function was to endow gods and humans with life.\n\n## The third astrological house\n\nThis cavern corresponds to the **third house**: the place of gathering elements for the formation of the Spirit. It is the house of instruction, of ideas that form the new personality and of relationships with others. According to Angelini, it represents the centripetal movement directed toward acquiring qualities that nourish the Spirit.';

  @override
  String get divisionStructureAlt3 => 'Structure of the third division';

  @override
  String get divisionStructureAlt4 => 'Structure of the fourth division';

  @override
  String get literalMeaning => 'Literal meaning';

  @override
  String get esotericMeaning => 'Esoteric meaning';

  @override
  String get cavernDetailsNotFound => 'Cavern details not found';

  @override
  String get firstDivisionTitle => 'First Division';

  @override
  String get secondDivisionTitle => 'Division Two';

  @override
  String get table1R1S1 => '3 coiled serpents';

  @override
  String get table1R1S2 => '9 cobras';

  @override
  String get table1R1S3 => '9 bull-headed deities';

  @override
  String get table1R2S1 => '9 male deities in ovals';

  @override
  String get table1R2S2 => '9 jackal-headed deities';

  @override
  String get table1R2S3 =>
      'Male and female deity holding a disc above their heads';

  @override
  String get table1R3S1 => '11 deities';

  @override
  String get table1R3S2 =>
      'Osiris in a sanctuary with 8 male and female deities in ovals surrounding him';

  @override
  String get table1R4S1 => '9 female deities standing on baskets';

  @override
  String get table1R4S2 => '8 female deities in ovals';

  @override
  String get table1R4S3 =>
      '2 male deities on sides of a mound; 2 female deities on sides of a mound; Mongoose-headed deity';

  @override
  String get table1R5S1 => '3 coiled serpents';

  @override
  String get table1R5S2 => '16 male enemies (8 decapitated)';

  @override
  String get table2R1S1 => 'Serpent raised on its tail + 4 coiled serpents';

  @override
  String get table2R1S2 =>
      '4 catfish-headed deities and 8 shrewmouse-headed deities in ovals + two hawk-headed deities';

  @override
  String get table2R1S3 => '7 female deities in ovals + male deity';

  @override
  String get table2R2S1 => 'Shrewmouse-headed deity + 9 male mourners';

  @override
  String get table2R2S2 =>
      '12 mummified male deities in ovals + ram-headed deity';

  @override
  String get table2R3S1 => 'Ram-headed deity + 9 male deities';

  @override
  String get table2R3S2 =>
      '4 males around the chest of Osiris + 4 ram-headed standards + 4 jackal-headed standards';

  @override
  String get table2R4S1 =>
      'Hawk-headed deity + 12 Osiride figures in ovals + male deity';

  @override
  String get table2R4S2 =>
      'Ram-headed deity + 9 ram-headed deities in ovals + 1 ram-headed deity';

  @override
  String get table2R5S1 =>
      '4 male deities with bullhorns holding knives + 16 male enemies (4 are decapitated; 4 are laying face down; last 8 are upside down)';

  @override
  String get table3R1S1 =>
      'Sun disk + 2 coiled serpents + 1 male deity in an oval';

  @override
  String get table3R1S2 => '7 catfish-headed deities standing under a serpent';

  @override
  String get table3R1S3 => '2 mummified ram-headed deities in mounds';

  @override
  String get table3R1S4 => '3 male and female deities in ovals';

  @override
  String get table3R1S5 =>
      'Osiris in a shrine + 10 male and female deities in ovals';

  @override
  String get table3R2S1 => 'Ram-headed deity';

  @override
  String get table3R2S2 => '4 Osiride figures';

  @override
  String get table3R2S3 =>
      'Double sphinx Aker + reposing ithyphallic Osiris encircled by a serpent';

  @override
  String get table3R2S4 =>
      '3 ovals encircled by an ouroboros serpent + 4 male deities';

  @override
  String get table3R2S5 =>
      'Mongoose-headed deity standing on a serpent + 2 male deities';

  @override
  String get table3R3S1 =>
      '4 upside down male figures + 4 upside down female figures + 1 male figure';

  @override
  String get table3R3S2 => '8 upside down male enemies (4 decapitated)';

  @override
  String get table3R3S3 =>
      '4 upside down female enemies + 4 upside down ba birds';

  @override
  String get centralScene => 'central scene';

  @override
  String get fourthCavernTitle => 'Fourth cavern - The cavern of origins';

  @override
  String get fourthCavernLiteralMeaning =>
      'Division Four consists of 3 registers (R) and 9 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_4]\n\n![Structure of the fourth division](quarta_divisione.webp)\n\nIn this division the theme of **Solar-Osirian unity** that began in Division Three continues. The theme is present in the first register (R1, S1) which shows an image of Osiris bent in a crescent shape, with a sun disk at his feet, being lifted by Isis and Nephthys.';

  @override
  String get fourthCavernEsotericMeaning =>
      '## The cavern of family\n\nAccording to Angelini, the Fourth Cavern represents the **root, paternal home, origin and hearth**. The central figures are members of the divine family: Osiris (the father), Horus (the son and heir), Isis and Nephthys (the sisters who protect and regenerate). These family relationships show how this cavern is the foundation of existence.\n\n## The fourth astrological house\n\nThis cavern corresponds to the **fourth house**: the house of family origins and ancestral roots. It is the place where the individual finds their primary identity and sense of belonging. It represents the emotional foundations on which existence is built, the family nucleus that provides security and continuity.';

  @override
  String get table4R1S1 =>
      'Human Osiris bent in crescent shape lifted by Isis and Nephthys';

  @override
  String get table4R1S2 => 'Anubis + human Osiris + Horus';

  @override
  String get table4R1S3 => 'Male deity with bull horns + 2 ovals';

  @override
  String get table4R2S1 => 'Ram-headed deity + 3 human Osiris figures';

  @override
  String get table4R2S2 =>
      'Horus + coiled serpent separating 2 ovals, each containing a mummiform figure';

  @override
  String get table4R2S3 => 'Anubis + human Osiris + ba bird';

  @override
  String get table4R3S1 => '4 upside down male enemies + cat-headed deity';

  @override
  String get table4R3S2 =>
      'Lion-headed female deity + 1 female deity + 1 reposing male deity';

  @override
  String get table4R3S3 => '4 upside down male enemies + male figure';

  @override
  String get fifthCavernTitle => 'Fifth cavern - The cavern of divine children';

  @override
  String get fifthCavernLiteralMeaning =>
      'Division Five represents **the beginning of the rebirth of the sun god Ra**, as clearly indicated in the ancient texts. It is structured in three registers with fourteen scenes:\n\n[TABLE_CAVERNA_5]\n\n![Structure of the fifth division](quinta_divisione.webp)\n\nThe start of the rebirth process is symbolized by the **large image of Nut** at the beginning of the division, the sky goddess who gives birth to the sun each morning.\n\nAt the center of the division appears the **large figure of ithyphallic Osiris** - Osiris depicted with an erect phallus, symbol of regenerative power and resurrection - that continues the Solar-Osirian unity process: the temporary nightly union of Ra (the sun) with Osiris (regenerative death) necessary for the sun to be reborn each morning.\n\nRebirth is further symbolized by **two seated children in an oval** (R1, S3-1), called \"The Youth Ra\" and \"The Child Ra\", representing the first manifestations of the sun god. In scene **R1, S1(2)** appear the **pieces of flesh of Osiris**, elements of the dismembered body that must be reassembled to allow resurrection.';

  @override
  String get fifthCavernEsotericMeaning =>
      '## The fifth astrological house\n\nThis cavern corresponds to the **fifth house**: the house of love, creativity and generation. It is the place where vital energy expresses itself through creation, both material and spiritual. It represents children, artistic expression and everything born from the individual\'s creative impulse.';

  @override
  String get table5Division => 'Fifth Division';

  @override
  String get table5R1S1P1 =>
      'Human Osiris + 4 standing serpents with human heads';

  @override
  String get table5R1S2P1 => 'Tatenen flanked by 2 male deities';

  @override
  String get table5R1S3P1 => 'Male deity + 2 ovals';

  @override
  String get table5R1S1P2 =>
      'Oval flanked by a male deity and a ram-headed deity';

  @override
  String get table5R2S1P1 => '4 hawk-headed mummies + Anubis + oval';

  @override
  String get table5R2S2P1 => '4 female deities each in an oval';

  @override
  String get table5R2S1P2 => 'Ram-headed deity + female deity';

  @override
  String get table5R2S2P2 =>
      'Human Osiris with Horus with a ram head between them';

  @override
  String get table5R3S1P1 =>
      'Female deity holding a pole in each hand, with 2 kneeling male enemies in front of them';

  @override
  String get table5R3S2P1 =>
      'Serpent headed (?) figure kneeling in front of a cauldron containing 4 heads and 4 hearts';

  @override
  String get table5R3S3P1 =>
      '2 cobras on either side of a cauldron containing 4 upside down decapitated male enemies';

  @override
  String get table5R3S1P2 =>
      '2 kneeling female deities on either side of a cauldron containing 4 upside down ba birds + 4 fans';

  @override
  String get largeIthyphallicOsiris => 'Large Ithyphallic Osiris';

  @override
  String get largeNut => 'Large Nut';

  @override
  String get swipeToView => 'Swipe to view';

  @override
  String get sixthCavernTitle => 'Sixth cavern - The cavern of service';

  @override
  String get sixthCavernLiteralMeaning =>
      'Division Six represents **the completion of the rebirth process** begun in the fifth division. It is structured in three registers with thirteen scenes:\n\n[TABLE_CAVERNA_6]\n\n![Structure of the sixth division](sesta_divisione.webp)\n\nThe central theme is the **imminent birth of the sun god Ra**. This is symbolized by the figure of the **scarab beetle emerging from between two mounds** (R2, S1), an image representing the sun god about to be born after completing his nightly journey through the Underworld.\n\nThe division also contains other figures connected to rebirth: the image of **Tatenen** (R2, S3), funerary deity representing the land that emerged from primordial Chaos, creator of primordial energy, **rams** (R1, S2) and **ram heads** (R1, S3 and R2, S3), all symbols associated with the sun god and the regenerative process.\n\nThe lower register maintains the customary representation of **decapitated enemies** (R3, S1), symbolizing the defeat of the forces of chaos that oppose solar rebirth.';

  @override
  String get sixthCavernEsotericMeaning =>
      '## The sixth astrological house\n\nThis cavern corresponds to the **sixth house**: the house of work, health and service, which **ends the dark zone of domification**. It is the house of **defeating chaos**, symbolized by the decapitated heads (R3, S1) representing the forces of disorder definitively vanquished.\n\nThe Sixth House represents the **fulcrum of spiritual transformation through sacrifice**. It is the place where, through discipline, service and acceptance of difficulties, the individual defeats inner chaos and can access higher planes of awareness. Just as Ra is reborn every morning after defeating the forces of nightly chaos, so sacrifice becomes an instrument of regeneration, transforming suffering into spiritual growth.';

  @override
  String get table6Division => 'Sixth Division';

  @override
  String get table6R1S1 =>
      'Anubis standing between two ovals, each containing a mummified deity + a ba bird on top of each oval';

  @override
  String get table6R1S2 => 'Anubis + three ovals';

  @override
  String get table6R1S3 => '2 female deities flanking 2 ovals';

  @override
  String get table6R1S4 =>
      'Osiris-Orion standing on top of a mound containing a decapitated enemy + male deity + hawk sitting on top of a mound';

  @override
  String get table6R2S1 => 'Scarab emerging between 2 mounds + 4 male deities';

  @override
  String get table6R2S2 =>
      'Scarab surrounded by a serpent + 2 male deities in ovals';

  @override
  String get table6R2S3 =>
      'Mound with coiled serpent and ram head emerging + Tatenen in a mound emerging from the ground + 2 male deities';

  @override
  String get table6R2S4 => '2 deities in ovals';

  @override
  String get table6R2S5 => '4 decapitated enemies in ovals';

  @override
  String get table6R3S1 =>
      '4 decapitated enemies + male and female deities with knives + female deity';

  @override
  String get table6R3S2 => '2 Anubis-headed female deities + 4 female enemies';

  @override
  String get table6R3S3 => 'Male and female deities + 4 kneeling male enemies';

  @override
  String get table6R3S4 =>
      'Osiris emerging from between a serpent + 2 upside down male figures with their heads in the ground';

  @override
  String get seventhCavernTitle =>
      'Seventh cavern - The cavern of the sacred union';

  @override
  String get seventhCavernLiteralMeaning =>
      'Following Angelo Angelini\'s interpretation, the **first six caverns** correspond to the six sections of the Book of the Twelve Caverns in the Osireion at Abydos, while the **other caverns are represented only in papyri**.\n\nAccording to this interpretation, the Seventh Cavern has **no attestation** in either source: it is absent from the Osireion reliefs and **\"Manca nei Papiri\"** (\"Missing in the Papyri\") as Angelini explicitly states.';

  @override
  String get seventhCavernEsotericMeaning =>
      '## The seventh astrological house\n\nThis cavern corresponds to the **seventh house**: the house of partnerships, marriage, open enemies, and legal contracts. However, according to Angelini, **\"Della settima casa nulla si può dire poichè non si hanno elementi di discusione\"** (\"Of the seventh house nothing can be said since there are no elements for discussion\").\n\n## The passage from night to day\n\nThe seventh cavern represents **the passage from the nocturnal to the diurnal part of domification**, namely that below the ascendant line and that above the ascendant line. The complete absence of this cavern from all sources - both the Osireion reliefs and the papyri - keeps hidden the esoteric meaning of this transitional house.';

  @override
  String get eighthCavernTitle =>
      'Eighth cavern - The cavern of transformation';

  @override
  String get eighthCavernLiteralMeaning =>
      'The Eighth Cavern, called **\"She who protects the Souls, She who judges, distinguishing truth from falsehood\"**, is organized into **seven groups of deities**, each with specific functions in the divine organization of the Netherworld.\n\n![Structure of the eighth division](ottava_divisione.webp)\n\n## Different representations across sources\n\nAncient sources present two modes of representation:\n\n- **In the Osireion at Abydos**: Each group is depicted *in extenso* with all deities (generally four per group) shown in procession\n- **In papyri** (such as British Museum 10.478 shown above): **Each group is symbolically represented by a single figure inscribed in a rectangle**, with the number of group members indicated below the figure. This single deity represents the entire collective.\n\n## The Seven Groups of Deities\n\n### Group 1: \"Those who carry [the ones who are seated] upon them\"\n**Papyrus representation**: A deity walking carrying a female child seated on the shoulder, with the number \"4\" below.\n**Meaning**: Four deities who guarantee the deceased \"sees Ra at his rising\" and follows him \"in Ra\'s bark.\"\n\n### Group 2: \"Those who carry the ones who are [seated] upon them\"\n**Papyrus representation**: A deity carrying a male child seated on the shoulder, with the number \"4\".\n**Meaning**: Four deities who transport specifically male seated figures, granting the same benefits as the first group.\n\n### Group 3: \"Those who mourn for Ra\"\n**Papyrus representation**: A goddess prostrate face down with hair locks hanging before her face and hands raised, with the number \"4\".\n**Meaning**: Four figures who guarantee \"offerings come to the deceased as they come to Ra\'s followers at his setting.\"\n\n### Group 4: \"Those who carry gifts\"\n**Papyrus representation**: A goddess prostrate face down with hands raised, with the number \"4\".\n**Meaning**: Four figures who hold round bread and grant the deceased to \"be like those who are in the Netherworld.\"\n\n### Group 5: \"The Tired Ones\"\n**Papyrus representation**: A goddess prostrate with hair before her face and hands raised inward.\n**Meaning**: Four figures who allow the deceased to \"pass through the Wide Hall of the Two Truths.\"\n\n### Group 6: \"Those who render homage\"\n**Papyrus representation**: A bowing god, with the number \"4\".\n**Meaning**: Four deities who guarantee the deceased can \"follow Ra in his bark.\"\n\n### Group 7: \"Those who carry offerings\"\n**Papyrus representation**: A god walking holding a conical object.\n**Meaning**: Four deities who grant \"offerings and food to the deceased in the Necropolis.\"';

  @override
  String get eighthCavernEsotericMeaning =>
      '## The cavern of divine assistance and spiritual discernment\n\nAccording to Angelini, the Eighth Cavern represents first and foremost **divine assistance for spiritual ascension**. The deities who \"carry those seated upon them to heaven\" concretely symbolize how higher spiritual forces provide a vehicle of elevation through profound introspection.\n\n## Discernment between truth and falsehood\n\nThe cavern\'s very name - \"She who judges, distinguishing truth from falsehood\" - reveals its essential function. The deities described as \"judges of souls\" represent not an external tribunal, but the **inner discernment process** that every spiritual seeker must develop. The prostrate figures (Groups 3, 4, 5) show the dangers of this search: \"Those who mourn for Ra\" warn of possible deviations in metaphysical studies and afterlife research.\n\n## The duality of spiritual and material resources\n\nWhile the second cavern governs earnings from one\'s own work, the eighth rules **resources received through others**: \"Those who carry gifts\" and \"Those who carry offerings\" (Groups 4 and 7) indicate both material gifts (inheritances, legacies) and transformative experiences that arrive unexpectedly. Angelini specifies that these \"gifts\" may also derive from marriage to wealthier individuals.\n\n## The danger of occult research\n\nThe prostrate figures represent the **death-bringing significance of the eighth house**: research in supernatural studies carries real risks. \"The Tired Ones\" (Group 5) symbolize \"those who reach life\'s end\" for having incorrectly traveled the path of hidden knowledge. However, those who succeed in \"distinguishing truth from falsehood\" can \"pass through the Wide Hall of the Two Truths.\"\n\n## The eighth house as alchemical process\n\nThis cavern represents the **alchemical process of death and rebirth** - the dissolution of old forms to allow new spiritual growth. It is the house of radical transformation, where investigation into \"hidden things\" can lead to both illumination and spiritual destruction.';

  @override
  String get ninthCavernTitle => 'Ninth cavern - The cavern of divine wisdom';

  @override
  String get ninthCavernLiteralMeaning =>
      'The Ninth Cavern, called **\"She of mysterious forms, who cuts off the [vital] air\"**, is organized into **twenty groups of deities**, the most complex among all caverns.\n\n![Structure of the ninth division](nona_divisione.webp)\n\n## Different representations across sources\n\nAs with the Eighth Cavern, sources present two modes:\n- **In the Osireion at Abydos**: Each group shown with all deities\n- **In papyri**: Symbolic representation with one figure per group\n\n## The Twenty Groups of Deities\n\n### Group 1: \"The gods who are in their shrines above the Watery Abyss\"\n**Representation**: Mummified figure of Osiris with Upper Egyptian crown in shrine with serpents, number \"14\".\n**Meaning**: Fourteen deities who guarantee the deceased \"may drink from the middle of the stream\".\n\n### Group 2: \"The gods and goddesses who are in the following of Osiris\"\n**Representation**: Standing goddess followed by god with scepter, number \"24\".\n**Meaning**: Twenty-four deities (12 gods and 12 goddesses) who enable the deceased to \"repose with his mummy\".\n\n### Group 3: \"The Standing One\"\n**Representation**: Striding god with scepter, number \"1\".\n**Meaning**: One deity who guarantees the deceased \"may adore Ra at his rising\".\n\n### Groups 4, 6-7: Taurine Deities\n**Group 4**: \"Amun-Osiris\" - Bull on standard with uraeus who grants \"power in the Wide Hall of Geb\". The **uraeus** is the sacred rearing cobra, symbol of sovereignty and divine protection, that adorned pharaohs\' foreheads and represented the goddess Wadjet.\n**Group 6**: \"He who nourishes Osiris\" - Bull on standard carried by mummiform god, grants bread and beer to the deceased\n**Group 7**: \"He who makes Osiris inaccessible\" - Bull on standard that protects Osiris in the underworld, grants mastery of steps in the Holy Place\n\n### Group 5: \"The Mysterious One\"\n**Representation**: Standing mummiform god.\n**Meaning**: Deity who guarantees the deceased \"an enduring and healthy body\".\n\n### Groups 8-11: Protective Deities\n**Group 8**: \"The Protector\" - Mummiform god who does not allow evil to approach the deceased\n**Group 9**: \"He who Tows Osiris\" - Deity who guides Osiris through the afterlife, allows seeing Ra\n**Group 10**: \"The Dark One\" - Mummiform god who grants glory on earth and power in the West\n**Group 11**: \"He-who-is-between-the-two-eyes\" - Crocodile-headed god who brings the deceased before the sacred braziers\n\n### Groups 12-14: Hidden-Armed Figures\n**Group 12**: \"The assistants of Osiris\" - Four mummified goddesses who accompany the deceased beside the Great God of the West\n**Group 13**: \"Those with hidden arms\" (masculine) - Four mummiform gods with arms concealed under garments, guarantee the deceased remains in the Necropolis forever\n**Group 14**: \"Those with hidden arms\" (feminine) - Four mummified goddesses with concealed arms, ensure prosperity and lasting offerings\n\n### Groups 15-20: Specialized Deities\n**Group 15**: \"He who hides the limbs\" - God with scepter\n**Group 16**: \"The Souls who come forth\" - Four birds on trees\n**Group 17**: \"Those of the sycamores\" - Four mummified gods\n**Group 18**: \"He of the Repugnant Face\" - Mummiform god\n**Group 19**: \"The Bright Ones\" - Nine gods with solar disks\n**Group 20**: \"Those who rest on their beds\" - Nine reclining gods';

  @override
  String get ninthCavernEsotericMeaning =>
      '## The cavern of metaphysical order and profound religiosity\n\nAccording to Angelini, the Ninth Cavern represents the **metaphysical, religious, juridical, and mystical order**. Group 1 - \"The gods in their temples above the Watery Abyss\" - immediately reveals the **profound religiosity** of this house, where the mummified figure of Osiris in the temple establishes the sacred and spiritual character of the domain.\n\n## The higher spiritual principles\n\nThe deities \"in their temples above the Waters of the Abyss (Nu)\" (Group 1) represent the **higher spiritual principles** that govern from above. These fourteen gods who allow one to \"drink from the middle of the stream\" symbolize access to higher knowledge through **elevated consciousness** that transcends the chaotic primordial waters.\n\n## The duality of divine justice\n\nThe numerous groups (5, 8, 10, 12, 13, 14, 17) that Angelini identifies as the realm of justice show the **dual nature** of this cavern. The \"Hidden-Armed Figures\" (Groups 12-14) represent those who have lost worldly means: the \"gods without hands\" symbolize loss of work and material means. However, through this loss one can reach **higher knowledge** - the mystic\'s path that gains spiritual wealth through material renunciation.\n\n## Magical power and earthly justice\n\nThe bulls on standards with uraeus (Groups 4, 6, 7) who \"give power to Osiris in heaven and earth\" represent **magical power** operating through natural forces. This can manifest both as divine justice and as **loss of freedom** through earthly tribunal judgments. The \"Protective Deities\" (Groups 8-11) show how moral discipline and spiritual ascension allow one to reach **self-knowledge** through infinite trials: illness, infirmities, worldly losses.\n\n## Spiritual religion through adversity\n\n\"The Souls who come forth\" (Group 16) and \"The Bright Ones\" (Group 19) indicate the positive result of the spiritual path, while \"He of the Repugnant Face\" (Group 18) warns of the dangers of deviation. The house reveals how through **moral discipline and spiritual ascension** one can reach authentic spiritual religion, transforming trials into higher wisdom.\n\n## The ninth astrological house\n\nThis cavern corresponds to the **ninth house**: the house of philosophy, religion, law, higher studies, and long journeys. Angelini clearly identifies this domain as the realm of **metaphysical, religious, juridical, and mystical order**. Here both divine and earthly justice manifest - the tribunals that can take away freedom, but also the moral discipline that leads to spiritual liberation. It is the house where one accesses **higher knowledge** through direct experience of spiritual trials, transforming adversity into wisdom.';

  @override
  String get tenthCavernTitle => 'Tenth cavern - The cavern of sacred clamor';

  @override
  String get tenthCavernLiteralMeaning =>
      'The Tenth Cavern, called **\"the Clamorous One whose mysteries are sacred\"**, contains **eight groups of deities** embodying themes of divine illumination and sacred protection.\n\n![Structure of the tenth division](decima_divisione.webp)\n\n## The cavern\'s name\n\nThe name \"the Clamorous One\" refers to the ritual sounds and sacred invocations that resonate in this domain, while \"whose mysteries are sacred\" emphasizes the inviolable nature of the divine secrets guarded here.\n\n## Differences between ancient sources\n\nAs with other caverns in the Book of the Twelve Caverns, two modes of representation exist:\n\n**In the Osireion at Abydos** (Seti I\'s underground temple): Each group is represented with all its deities - for example, the first group shows eight striding gods arranged in two registers, the second group shows eight goddesses pouring water, and so forth.\n\n**In funerary papyri** (such as British Museum 10.478): For space economy, each group is represented by **a single symbolic figure** accompanied by a number indicating how many deities it represents. Thus a single goddess pouring water with the number \"8\" represents the entire group of eight goddesses.\n\n## The Eight Groups of Deities\n\n### Group 1: \"Those who belong to the light\"\n**Representation**: Eight striding gods arranged in two registers (in the Osireion).\n**Meaning**: Eight solar deities who guarantee the deceased \"may see Ra at his rising\" and participate in divine luminosity.\n\n### Group 2: \"Those who seize\"\n**Representation**: Eight goddesses pouring water from vessels topped with Anubis heads (in the Osireion).\n**Meaning**: Eight female deities who \"seize\" souls, guaranteeing the deceased \"may be in jubilation\".\n\n### Group 3: \"The Ennead who guard those who are in the earth\"\n**Representation**: Nine mummified gods lying on ritual beds.\n**Meaning**: Nine guardians who watch over the dead, granting \"the breath of life on earth and in the Necropolis\".\n\n### Group 4: \"The Ennead of those whose arm is hidden\"\n**Representation**: Nine standing mummiform gods (in the Osireion, eight gods spitting water).\n**Meaning**: Nine deities with concealed arms who guarantee the deceased \"may be glorious as the accomplished spirits\".\n\n### Group 5: \"The Mysterious One\"\n**Representation**: A standing goddess, sometimes with the Eye of Horus (Wedjat).\n**Meaning**: A female deity who causes \"the soul to endure and the body to prosper like those of the gods in the netherworld\".\n\n### Group 6: \"The souls of the gods who came into being from the limbs of Osiris\"\n**Representation**: Thirty-one (or twenty-one in papyri) recumbent deities, organized in groups.\n**Meaning**: Divine souls emanated from Osiris\'s body, who grant \"peace\" to the deceased.\n\n### Group 7: \"The Adorers\"\n**Representation**: Four striding gods.\n**Meaning**: Four adorers of Ra who ensure \"there is no opposition to the deceased at any gate of the netherworld\".\n\n### Group 8: \"Those with repulsive faces\"\n**Representation**: Four striding gods (sometimes represented as a goddess).\n**Meaning**: Four terrifying-looking deities who paradoxically grant \"refreshment in the place of heat\".';

  @override
  String get tenthCavernEsotericMeaning =>
      '## The cavern of worldly achievement and divine recognition\n\nAccording to Angelini, the Tenth Cavern is **associated with solar illumination** and demonstrates how **elevation and popularity are achievable through sacrifice**, revealing that social position results from sustained effort and divine favor.\n\n## The sacred clamor and inviolable mysteries\n\nThe name \"the Clamorous One whose mysteries are sacred\" reveals this house\'s paradoxical nature: **public success** (the clamor) must coexist with **protection of inner mysteries** (the sacred). \"Those who belong to the light\" (Group 1) represent the illumination that comes from achieving social position and guarantee one \"may see Ra at his rising\".\n\n## The vigilant divine council\n\n\"The Ennead who guard those who are in the earth\" (Group 3) represents the **cosmic oversight** that governs worldly success. These nine guardians lying on ritual beds show how earthly power requires constant vigilance and divine protection. Their gift of \"the breath of life\" indicates that true authority derives from alignment with cosmic vital forces.\n\n## The paradox of hidden power\n\n\"The Ennead of those whose arm is hidden\" (Group 4) reveals a profound teaching: **true power is often exercised invisibly**. The concealed arms symbolize influence operating behind the scenes, subtle diplomacy, and the wisdom of not displaying all one\'s capabilities. This group guarantees being \"glorious as the accomplished spirits,\" indicating that true glory derives from inner mastery, not ostentation.\n\n## Transformation through sacrifice\n\n\"The souls of the gods who came into being from the limbs of Osiris\" (Group 6) - thirty-one deities emanated from the dismembered body of the god - teach that **lasting success requires sacrifice and transformation**. As Osiris was dismembered and reassembled, so those who aspire to power must be willing to sacrifice parts of themselves to be reborn in a higher form. The number 31 (or 21) suggests the days of the lunar month, indicating cycles of rise and fall in power.\n\n## Refreshment in the place of heat\n\n\"Those with repulsive faces\" (Group 8) who paradoxically grant \"refreshment in the place of heat\" reveal a profound truth: the **most difficult challenges** (the repulsive faces) in achieving and maintaining power can bring the greatest relief and satisfaction. The \"place of heat\" represents the pressure and stress of elevated positions, while \"refreshment\" is the inner peace that comes from overcoming such trials.\n\n## The tenth astrological house\n\nThis cavern corresponds to the **tenth house**: the house of career, reputation, public status, and social achievement. It represents the **culmination of earthly ambitions** when aligned with divine will. The groups of deities show that true success requires: illumination (Group 1), ability to \"seize\" opportunities (Group 2), divine protection (Group 3), hidden wisdom (Group 4), personal mystery (Group 5), transformative sacrifice (Group 6), devotion (Group 7), and the ability to transform adversities into blessings (Group 8).';

  @override
  String get eleventhCavernTitle =>
      'Eleventh cavern - The cavern of the weary protector';

  @override
  String get eleventhCavernLiteralMeaning =>
      'The Eleventh Cavern, called **\"She who covers the Tired One, who conceals that which is hidden\"**, contains **eighteen groups of deities** embodying themes of protection, regeneration, and spiritual support.\n\n![Structure of the eleventh division](undicesima_divisione.webp)\n\n## The cavern\'s name\n\nThe name reveals this dwelling\'s protective nature: \"She who covers the Tired One\" refers to divine care for those weary from spiritual journey, while \"who conceals that which is hidden\" indicates protection of sacred mysteries.\n\n## Differences between ancient sources\n\nAs in other caverns:\n\n**In the Osireion at Abydos**: Each group is shown with all its deities - for example, the ninth group shows nine jackals on standards, the tenth group shows nine prostrate mourning goddesses.\n\n**In funerary papyri**: Symbolic representation with one figure per group and an indicative number - a single jackal with \"9\" representing the nine guardians.\n\n## The Eighteen Groups of Deities\n\n### Group 1: \"The Swallower\"\n**Representation**: Standing goddess with upright serpent before her, number \"1\".\n**Meaning**: A goddess who guarantees \"prosperity, life, stability and wealth for the Great God in the netherworld\".\n\n### Group 2: \"The Soul of the West\"\n**Representation**: Striding god with scepter, number \"1\".\n**Meaning**: One deity who guarantees \"an invocation offering in the Necropolis\".\n\n### Group 3: \"The Souls of the Earth\"\n**Representation**: Four striding gods.\n**Meaning**: Four deities who grant \"all pure things on earth and before the Great God\".\n\n### Group 4: \"Those who acclaim\"\n**Representation**: Four striding gods with raised arms.\n**Meaning**: Four deities who \"acclaim so that Osiris may be at ease among those in heaven\".\n\n### Group 5: \"The Ennead of the Ruler of the West\"\n**Representation**: Nine mummified gods lying on beds (on serpents in the Osireion).\n**Meaning**: Nine guardians who watch over the western realm of the dead.\n\n### Group 6: \"The Ennead in the following of Ra\"\n**Representation**: Nine mummified gods with hidden arms, lying on serpents and beds.\n**Meaning**: Nine deities who accompany Ra on his journey.\n\n### Group 7: \"Ikh\" (cryptic name)\n**Representation**: Striding god with scepter, number \"1\".\n**Meaning**: Deity who guarantees being \"at the side of the Great God when he traverses the sky\".\n\n### Group 8: \"The Vivifiers of Osiris\" (uncertain name)\n**Representation**: Four standing mummiform gods.\n**Meaning**: Deities who give life to Osiris.\n\n### Group 9: \"The Ennead of Watchers\"\n**Representation**: Nine jackals on standards (in the Osireion).\n**Meaning**: Nine guardians who \"protect Osiris\'s awakening so he may never be annihilated\".\n\n### Group 10: \"The Ennead of Mourners\"\n**Representation**: Nine prostrate goddesses with hair before faces and hands raised.\n**Meaning**: Nine goddesses who \"grant the deceased the same ritual mourning that was done for the god Osiris\", ensuring the same funerary honors that enabled divine resurrection.\n\n### Group 11: \"The Summoner\"\n**Representation**: Striding god with one hand raised, number \"1\".\n**Meaning**: Deity who \"summons Osiris before Ra near his ennead\".\n\n### Group 12: \"Iqeheren\" (divine name)\n**Representation**: Striding god with scepter, number \"1\".\n**Meaning**: Deity who \"drives away all evil from Osiris forever\".\n\n### Group 13: \"Sacred Head\"\n**Representation**: Coiled cobra with woman\'s head, number \"1\".\n**Meaning**: Sacred serpent who \"helps Osiris to have power over the waters\".\n\n### Group 14: \"Those who are in the Sacred Head\"\n**Representation**: Three standing mummiform gods (four in the Osireion).\n**Meaning**: Deities who \"help Osiris to enter and exit freely, to move as Lord of the netherworld\".\n\n### Group 15: \"The Enveloper\"\n**Representation**: Coiled cobra, number \"1\".\n**Meaning**: Serpent who wraps and protects.\n\n### Group 16: \"Those who are in the Enveloper\"\n**Representation**: Four striding gods.\n**Meaning**: Deities who enable one to \"walk unhindered in the sacred place\".\n\n### Group 17: \"The Ennead of those who conceal Osiris\"\n**Representation**: Nine kneeling gods looking back (in the Osireion), prostrate goddess looking back (in papyri).\n**Meaning**: Nine deities who \"grant that Osiris be happy in the place he desires\".\n\n### Group 18: \"Ferocious Face\"\n**Representation**: Standing mummiform god, number \"1\".\n**Meaning**: Deity who \"opens the eyes to Osiris so he can see Ra\'s light\".';

  @override
  String get eleventhCavernEsotericMeaning =>
      '## The cavern of spiritual friendship\n\nAccording to Angelini, the Eleventh Cavern **\"She who covers the Tired One, who conceals that which is hidden\"** reveals its **friendly characteristics** while encompassing both the **joys and sorrows that friendships can bring** in both material and spiritual domains.\n\n## Divine support and protection of the weary soul\n\nThe cavern\'s name reveals its fundamental role: \"She who covers the Tired One\" refers to **divine protection for the soul weary** from the long spiritual journey. \"The Swallower\" (Group 1) and \"The Soul of the West\" (Group 2) represent forces that **welcome and sustain** those needing rest and regeneration. \"Those who acclaim\" (Group 4) show the **celestial companionship** that encourages the soul toward peace.\n\n## Regeneration through sacred mourning\n\n\"The Ennead of Mourners\" (Group 10) and \"The Ennead of Watchers\" (Group 9) reveal a profound aspect: the **regenerative power of shared sorrow**. As the goddesses weep for Osiris guaranteeing his resurrection, so authentic friendships traverse trials together, transforming suffering into spiritual strength. The nine jackals on standards \"protect the awakening\" showing how true friends watch over our spiritual rebirth.\n\n## The serpents of the Enveloper: protection and transformation\n\n\"The Enveloper\" (Group 15) and \"Those who are in the Enveloper\" (Group 16) show how **apparent constraints** can become protection. Like the serpent Mehen that wraps Osiris to protect him, so the limitations imposed by authentic friendships become means of spiritual growth.\n\n## Material and spiritual benefits\n\nAngelini specifies that this cavern governs **\"financial situations dependent on the influence of protections and legacies from friends, or strokes of fortune\"**. The protective groups show how spiritual friendships manifest concretely: \"The Souls of the Earth\" (Group 3) grant \"pure things,\" while \"The Summoner\" (Group 11) brings together the right people at the right time.\n\n## The eleventh astrological house\n\nThis cavern corresponds to the **eleventh house**: the house of friendship, hopes, wishes, and **deep scientific and philosophical interests**. Through authentic friendships the soul can reach higher levels of understanding, passing from shared trials (the mourning) to spiritual freedom and transformative protection (the Enveloper).';

  @override
  String get twelfthCavernTitle =>
      'Twelfth cavern - The cavern of the final shore';

  @override
  String get twelfthCavernLiteralMeaning =>
      'The Twelfth Cavern, called **\"She who unites the gods and embraces their manifestations\"**, contains **nine groups of deities** organized around the theme of the sacred shore as the final boundary of the netherworld.\n\n![Structure of the twelfth division](dodicesima_divisione.webp)\n\n## The Nine Groups of Deities\n\n### Groups 1-2, 4-6: The Shore Deities\n\n**Group 1: \"He who controls the shore\"** - A striding deity with scepter who guarantees the deceased \"may be Lord of the Island of the Just.\"\n\n**Group 2: \"The gods who are on the shore of the netherworld\"** - Thirteen deities (in the Osireion) symbolically represented by one figure in papyri, who grant \"truth in the Wide Hall of the Two Truths.\"\n\n**Group 4: \"The gods who belong to the shore\"** - Four mummified deities who \"give an island in the Fields of Iaru.\"\n\n**Group 5: \"The Chief of the shore\"** - A deity with scepter who grants \"an endowment in the Field of Offerings.\"\n\n**Group 6: \"The gods who are on the shore\"** - Eight deities (four in papyri) who guarantee \"offerings, food, and a great quantity of meat in the Necropolis.\"\n\n### Group 7: The Mysterious Heads\n\n**\"The Mysterious Heads on the shore\"** - Eleven ram\'s heads mounted on staffs (in the Osireion), symbolically represented by a single head in papyri. They grant \"their protection as it is done for Tired-Heart.\"\n\n### Groups 3 and 8: The Figures in Coils\n\n**Group 3: \"The gods who are in the following of the Enveloper\"** - Fourteen recumbent deities wrapped in serpent coils (in the Osireion), who guarantee the deceased \"may be in any place in which his Ka desires him to be.\"\n\n**Group 8: \"The gods who are in the coils\"** - Fourteen deities similarly wrapped, who grant \"the sight of the Solar Disk.\"\n\n### Group 9: The Bowing Ones\n\n**Group 9: \"iwwtyw\"** (cryptic name) - Four bowing deities who guarantee \"rest in the beautiful West.\"';

  @override
  String get twelfthCavernEsotericMeaning =>
      '## The cavern of the ultimate shore where domification ends\n\nAccording to Angelini, **\"With the XII Cavern one reaches the end of domification, one reaches the shore beyond which the sea exists\"**. This dwelling represents **\"the end of domification, the closure of this subliminal circuit\"**, poetically compared to **\"a shore where one must stop\"**.\n\n## The great journeys beyond the shore\n\nAngelini specifies that **\"The Twelfth House with the first vignettes indicates the end of domification, but also great journeys, sojourns beyond the shore\"** - journeys that are not limited to the ninth house but extend beyond the boundaries of earthly experience. The **Shore Deities** (\"He who controls the shore,\" \"The Chief of the shore,\" \"The gods who are on the shore\") govern this ultimate boundary where the individual meets the infinite.\n\n## The Mysterious Head on the shore: spirituality and suffering\n\nThe **\"Mysterious Head on the shore\"** (Group 7) - **\"a ram\'s head placed on a pole\"** - reveals according to Angelini **\"the spirituality of this house, but also, and above all, its negative part, woven with suffering, ineluctable bonds, constraints\"**.\n\n## The constraining coils and the paradox of liberation\n\nThe distinctive trait of the twelfth house is its **\"constraining, immobilizing function, with the many coils of the serpent that trap the god\"**. The **\"Gods who are in the following of the Enveloper\"** and **\"The gods who are in the coils\"** (Groups 3 and 8) show divine figures **\"wrapped in serpent coils\"**, representing those who are **\"immobilized by external and internal circumstances\"**.\n\nHowever, as Angelini observes in the general context of the Book of Caverns, apparent constraints can become means of spiritual liberation. The coils that immobilize are also those that protect, following the model of Mehen, the great serpent that wraps Osiris to guard him in his journey of regeneration.\n\n## The twelfth astrological house\n\nThis cavern corresponds to the **twelfth house**: the domain of hidden realities, spiritual sacrifice, and ultimate transcendence. It is the place where **\"the Neter Kether ends\"** (the hidden world) and where earthly domification gives way to the infinite sea of transcendent existence, reached paradoxically through acceptance of final constraints.';

  @override
  String get codexSubtitle => 'Your gateway to astrological knowledge';

  @override
  String get privacyPolicyTitle => 'AstroGods Privacy Policy';

  @override
  String get privacyPolicyWelcomeText =>
      'Welcome to AstroGods privacy policy. This policy will help you understand what data we collect, why we collect it, and what your rights are regarding it.';

  @override
  String get lastModified => 'Last modified: September 7, 2025';

  @override
  String get summary => 'Summary';

  @override
  String get summarySection => 'Summary';

  @override
  String get dataControllerSection => 'Data Controller';

  @override
  String get dataTypesSection => 'Types of Data collected';

  @override
  String get processingMethodsSection => 'Methods and place of processing';

  @override
  String get purposesSection => 'Purposes of Processing';

  @override
  String get processingDetailsSection => 'Processing details';

  @override
  String get cookiePolicySection => 'Cookie Policy';

  @override
  String get euInfoSection => 'Additional information for EU Users';

  @override
  String get additionalInfoSection => 'Additional information';

  @override
  String get definitionsSection => 'Definitions and Legal References';

  @override
  String get dataControllerName => 'Arcangelo Massari - Bologna (Italy)';

  @override
  String get dataControllerEmailLabel => 'Data Controller email address: ';

  @override
  String get dataControllerEmail => 'contact@astrogods.it';

  @override
  String get dataWeCollectAutomatically => 'Data we collect automatically';

  @override
  String get dataWeCollectAutomaticallyDesc =>
      'We automatically collect your data, for example when you visit AstroGods.';

  @override
  String get dataYouProvide => 'Data you provide us';

  @override
  String get dataYouProvideDesc =>
      'We collect data you provide us, for example when you create an account on AstroGods.';

  @override
  String get trustedThirdParties =>
      'Trusted third parties that help us process them';

  @override
  String get howWeUseThem => 'How we use them';

  @override
  String get usageData => 'usage data';

  @override
  String get ipAddress => 'ip address';

  @override
  String get deviceInformation => 'device information';

  @override
  String get trackingTools => 'tracking tools';

  @override
  String get name => 'name';

  @override
  String get surname => 'surname';

  @override
  String get gender => 'gender';

  @override
  String get billingAddress => 'billing address';

  @override
  String get paymentInformation => 'payment information';

  @override
  String get purchaseHistory => 'purchase history';

  @override
  String get registrationAndAuth => 'Registration and authentication';

  @override
  String get hostingAndBackend => 'Hosting and backend infrastructure';

  @override
  String get trafficOptimization => 'Traffic optimization and distribution';

  @override
  String get statistics => 'Statistics';

  @override
  String get backendApi => 'Backend API';

  @override
  String get paymentManagement => 'Payment management';

  @override
  String get dataTypesIntro =>
      'Among the Personal Data collected by AstroGods, independently or through third parties, there are:';

  @override
  String get communicatedDataDuringService =>
      'data communicated during service use';

  @override
  String get inCaseOfProblems => 'In case of problems';

  @override
  String get problemsDescription =>
      'Although we strive to create a positive user experience, we know that problems can occasionally occur between us and our users.';

  @override
  String get doNotHesitateContact =>
      'In such cases, do not hesitate to contact us.';

  @override
  String get contactUs => 'Contact us';

  @override
  String get cookiePolicy => 'Cookie Policy';

  @override
  String get termsAndConditions => 'Terms and Conditions';

  @override
  String get dataTypesDetailedContent =>
      'Complete details on each type of Personal Data collected are provided in the dedicated sections of this privacy policy or through specific information texts displayed before the collection of the Data.\n\nPersonal Data may be freely provided by the User or, in the case of Usage Data, collected automatically during the use of AstroGods.\n\nUnless otherwise specified, all Data requested by AstroGods is mandatory. If the User refuses to provide it, it might be impossible for AstroGods to provide the Service. In cases where AstroGods indicates some Data as optional, Users are free to refrain from providing such Data without any consequence on the availability or operation of the Service.\n\nUsers who have doubts about which Data is mandatory are encouraged to contact the Owner.\n\nAny use of Cookies - or other tracking tools - by AstroGods or the owners of third-party services used by AstroGods serves the purpose of providing the Service requested by the User, in addition to the other purposes described in this document and in the Cookie Policy.\n\nThe User takes responsibility for the Personal Data of third parties obtained, published or shared through AstroGods.';

  @override
  String get purposesIntroText =>
      'User Data is collected to enable the Owner to provide the Service, comply with legal obligations, respond to requests or enforcement actions, protect their rights and interests (or those of Users or third parties), identify any fraudulent or malicious activities, as well as for the following purposes:';

  @override
  String get purposesDetailedInfoText =>
      'To obtain detailed information on the purposes of processing and the Personal Data specifically relevant to each purpose, the User can refer to the section \"Details on Personal Data processing\".';

  @override
  String get processingMethodsTitle =>
      'Methods and place of processing of collected Data';

  @override
  String get processingMethodsContent =>
      '### Processing methods\n\nThe Owner processes the Personal Data of Users by adopting appropriate security measures aimed at preventing unauthorized access, disclosure, modification or destruction of Personal Data.\n\nProcessing is carried out using computer and/or telematic tools, with organizational methods and logics strictly related to the indicated purposes. In addition to the Owner, in some cases, other subjects involved in the organization of AstroGods (administrative, commercial, marketing, legal personnel, system administrators) or external subjects (such as third-party technical service providers, postal couriers, hosting providers, IT companies, communication agencies) may have access to the Data, also appointed, if necessary, as Data Processors by the Owner. The updated list of Processors can always be requested from the Data Controller.\n\n### Location\n\nData is processed at the Owner\'s operating offices and in any other place where the parties involved in the processing are located.\n\nFor further information, contact the Owner.\n\nThe User\'s Personal Data may be transferred to a country other than the one where the User is located. To obtain further information on the place of processing, the User can refer to the section relating to details on Personal Data processing.\n\n### Retention time\n\nUnless otherwise specified in this document, Personal Data is processed and stored for the time required by the purposes for which it was collected and may be stored for a longer period due to any legal obligations or based on the consent of Users.';

  @override
  String get cookiePolicyTitle => 'Cookie Policy';

  @override
  String get cookiePolicyContent =>
      'AstroGods uses Tracking Tools. To learn more, consult the Cookie Policy.';

  @override
  String get euInfoTitle => 'Additional information for European Union users';

  @override
  String get euInfoContent =>
      'This section applies to all users of the European Union, in accordance with the General Data Protection Regulation (the \"GDPR\") and, for such Users, supersedes any other information that may be divergent or conflicting contained in the privacy policy.\n\nAdditional details relating to the categories of Data processed, the purposes of processing, the categories of recipients of personal data, if any, and additional information on personal data are available in the section \"Details on Personal Data processing\" within this document.';

  @override
  String get paymentManagementTitle => 'Payment management';

  @override
  String get paymentManagementDescription =>
      'Unless otherwise specified, AstroGods processes all payments with credit card, bank transfer or other means through external payment service providers. In general, and unless otherwise indicated, Users are requested to provide payment details and personal information directly to such payment service providers.\nAstroGods is not involved in the collection and processing of such information: it will instead only receive a notification from the relevant payment service provider about the payment made.';

  @override
  String get hostingBackendTitle => 'Hosting and backend infrastructure';

  @override
  String get hostingBackendDescription =>
      'This type of service has the function of hosting Data and files that allow AstroGods to function, enable its distribution and provide ready-to-use infrastructure to deliver specific AstroGods functionalities.\n\nSome services among those listed below, if present, may work on geographically distributed servers, making it difficult to determine the actual location where Personal Data is stored.';

  @override
  String get backendApiTitle => 'Backend API';

  @override
  String get backendApiDescription =>
      'AstroGods uses third-party APIs to process user requests and provide personalized content.';

  @override
  String get authenticationTitle => 'Registration and authentication';

  @override
  String get authenticationDescription =>
      'By registering or authenticating, Users allow AstroGods to identify them and give them access to dedicated services.\nDepending on what is indicated below, third-party services could provide simplified registration and authentication.';

  @override
  String get trafficOptimizationTitle =>
      'Traffic optimization and distribution';

  @override
  String get trafficOptimizationDescription =>
      'This type of service allows AstroGods to distribute its content through a network of geographically distributed servers and optimize its performance.\nThe Personal Data processed depends on the characteristics and mode of use of these services, whose function is to filter communications between AstroGods and the User\'s browser.\nGiven the distributed nature of this system, it is difficult to determine the places where content that may contain the User\'s Personal Data is transferred.';

  @override
  String get stripeDescription =>
      'Stripe is a payment service provided by Stripe Technology Europe Ltd.';

  @override
  String get hetznerDescription =>
      'Hetzner is a hosting service provided by Hetzner Online GmbH.';

  @override
  String get godaddyDescription =>
      'GoDaddy Web Hosting is a hosting service provided by GoDaddy.com, LLC.';

  @override
  String get anthropicApiDescription =>
      'Anthropic API is an artificial intelligence service provided by Anthropic PBC.';

  @override
  String get googleOAuthDescription =>
      'Google OAuth is an authentication service provided by Google Inc.';

  @override
  String get googleFontsDescription =>
      'Google Fonts is a web font service provided by Google Inc.';

  @override
  String get europeanUnion => 'European Union';

  @override
  String get germany => 'Germany';

  @override
  String get unitedStates => 'United States';

  @override
  String get ireland => 'Ireland';

  @override
  String get italy => 'Italy';

  @override
  String get statisticsTitle => 'Statistics';

  @override
  String get statisticsDescription =>
      'The services contained in this section allow the Data Controller to monitor and analyze traffic data and serve to track User behavior.';

  @override
  String get matomatoDescription =>
      'Matomo is a statistics software used by AstroGods to analyze data directly and without the aid of third parties.';

  @override
  String get directRegistration => 'Direct registration';

  @override
  String get directRegistrationDescription =>
      'The User registers by filling out the registration form and directly providing their Personal Data to AstroGods.';

  @override
  String get euExtendedContent =>
      '### Legal basis for processing\n\nThe Owner may process User Personal Data if one of the following conditions exists:\n\n- Users have given their consent for one or more specific purposes;\n- processing is necessary for the performance of an agreement with the User and/or for any pre-contractual obligations thereof;\n- processing is necessary for compliance with a legal obligation to which the Owner is subject;\n- processing is necessary for the performance of a task carried out in the public interest or in the exercise of official authority vested in the Owner;\n- processing is necessary for the legitimate interests pursued by the Owner or by a third party.\n\nIn any case, the Owner will gladly help to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract.\n\n### Further information about retention time\n\nUnless specified otherwise in this document, Personal Data shall be processed and stored for as long as required by the purpose they have been collected for and may be stored for longer due to applicable legal obligation or based on the Users\' consent.\n\nTherefore:\n\n- Personal Data collected for purposes related to the performance of a contract between the Owner and the User shall be retained until such contract has been fully performed.\n- Personal Data collected for the purposes of the Owner\'s legitimate interests shall be retained as long as needed to fulfill such purposes. Users may find specific information regarding the legitimate interests pursued by the Owner within the relevant sections of this document or by contacting the Owner.\n\nThe Owner may be allowed to retain Personal Data for a longer period whenever the User has given consent to such processing, as long as such consent is not withdrawn. Furthermore, the Owner may be obliged to retain Personal Data for a longer period whenever required to do so for the performance of a legal obligation or upon order of an authority.\n\nOnce the retention period expires, Personal Data shall be deleted. Therefore, the right to access, the right to erasure, the right to rectification and the right to data portability cannot be enforced after expiration of the retention period.\n\n### The rights of Users based on the General Data Protection Regulation (GDPR)\n\nUsers may exercise certain rights regarding their Data processed by the Owner.\n\nIn particular, Users have the right to do the following, to the extent permitted by law:\n\n- **Withdraw their consent at any time.** Users have the right to withdraw consent where they have previously given their consent to the processing of their Personal Data.\n- **Object to processing of their Data.** Users have the right to object to the processing of their Data if the processing is carried out on a legal basis other than consent.\n- **Access their Data.** Users have the right to learn if Data is being processed by the Owner, obtain disclosure regarding certain aspects of the processing and obtain a copy of the Data undergoing processing.\n- **Verify and seek rectification.** Users have the right to verify the accuracy of their Data and ask for it to be updated or corrected.\n- **Restrict the processing of their Data.** Users have the right to restrict the processing of their Data. In this case, the Owner will not process their Data for any purpose other than storing it.\n- **Have their Personal Data deleted or otherwise removed.** Users have the right to obtain the erasure of their Data from the Owner.\n- **Receive their Data and have it transferred to another controller.** Users have the right to receive their Data in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance.\n- **Lodge a complaint.** Users have the right to bring a claim before their competent data protection authority.\n\nUsers are also entitled to learn about the legal basis for Data transfers abroad including to any international organization governed by public international law or set up by two or more countries, such as the UN, and about the security measures taken by the Owner to safeguard their Data.\n\n### Details about the right to object to processing\n\nWhere Personal Data is processed for a public interest, in the exercise of an official authority vested in the Owner or for the purposes of the legitimate interests pursued by the Owner, Users may object to such processing by providing a ground related to their particular situation to justify the objection.\n\nUsers must know that, however, should their Personal Data be processed for direct marketing purposes, they can object to that processing at any time, free of charge and without providing any justification. Where the User objects to processing for direct marketing purposes, the Personal Data will no longer be processed for such purposes. To learn whether the Owner is processing Personal Data for direct marketing purposes, Users may refer to the relevant sections of this document.\n\n### How to exercise these rights\n\nAny requests to exercise User rights can be directed to the Owner through the contact details provided in this document. Such requests are free of charge and will be answered by the Owner as early as possible and always within one month, providing Users with the information required by law. Any rectification or erasure of Personal Data or restriction of processing will be communicated by the Owner to each recipient, if any, to whom the Personal Data has been disclosed unless this proves impossible or involves disproportionate effort. At the Users\' request, the Owner will inform Users about those recipients.';

  @override
  String get additionalInfoContent =>
      '### Legal action\n\nThe User\'s Personal Data may be used for legal purposes by the Owner in Court or in the stages leading to possible legal action arising from improper use of this Application or the related Services.\n\nThe User declares to be aware that the Owner may be required to reveal personal data upon request of public authorities.\n\n### Additional information about User\'s Personal Data\n\nIn addition to the information contained in this privacy policy, this Application may provide the User with additional and contextual information concerning particular Services or the collection and processing of Personal Data upon request.\n\n### System logs and maintenance\n\nFor operation and maintenance purposes, this Application and any third-party services may collect files that record interaction with this Application (System logs) or use other Personal Data (such as the IP Address) for this purpose.\n\n### Information not contained in this policy\n\nMore details concerning the collection or processing of Personal Data may be requested from the Owner at any time. Please see the contact information at the beginning of this document.\n\nUsers are also encouraged to check the privacy policies of any third-party services used by this Application.\n\n### Changes to this privacy policy\n\nThe Owner reserves the right to make changes to this privacy policy at any time by notifying its Users on this page and possibly within this Application and/or - as far as technically and legally feasible - sending a notice to Users via any contact information available to the Owner. It is strongly recommended to check this page often, referring to the date of the last modification listed at the bottom.\n\nShould the changes affect processing activities performed on the basis of the User\'s consent, the Owner shall collect new consent from the User, where required.';

  @override
  String get definitionsContent =>
      'Key terms and their meanings as used in this document';

  @override
  String get errorOpeningUrl => 'Error opening URL';

  @override
  String get providedByLabel => 'Provided by: ';

  @override
  String get cookiePolicyPageTitle => 'Cookie Policy';

  @override
  String get cookiePolicyWelcomeText =>
      'This page explains how we use cookies and tracking technologies to improve your experience.';

  @override
  String get whatAreCookiesSection => 'What are cookies?';

  @override
  String get whatAreCookiesContent =>
      'Cookies are small data files that are placed on your computer or mobile device when you visit a website. They are widely used to make websites work more efficiently, provide better user experience, and to provide reporting information.';

  @override
  String get typesOfCookiesSection => 'Types of cookies we use';

  @override
  String get necessaryCookiesTitle => 'Necessary cookies';

  @override
  String get necessaryCookiesDescription =>
      'These cookies are essential for the website to function properly. They enable core functionality such as security, network management, and accessibility.';

  @override
  String get measurementCookiesTitle => 'Measurement cookies';

  @override
  String get measurementCookiesDescription =>
      'These cookies help us understand how visitors interact with our website by collecting and reporting information anonymously.';

  @override
  String get trackingToolsSection => 'Tracking tools';

  @override
  String get trackingToolsIntro =>
      'AstroGods uses the following tracking tools:';

  @override
  String get matomoSelfHostedTitle => 'Matomo (self-hosted)';

  @override
  String get matomoSelfHostedDescription =>
      'We use Matomo, a privacy-focused analytics platform hosted on our own servers. This means your data never leaves our infrastructure and is not shared with third parties. Matomo helps us understand how users interact with our service while respecting your privacy.';

  @override
  String get dataCollectedByMatomo => 'Data collected by Matomo:';

  @override
  String get managingCookiesSection => 'Managing cookies';

  @override
  String get managingCookiesContent =>
      'You have control over the cookies we use. You can manage your preferences through your browser settings or by using the controls we provide. Please note that disabling certain cookies may affect the functionality of our website.';

  @override
  String get browserSettingsTitle => 'Browser settings';

  @override
  String get browserSettingsContent =>
      'Most web browsers allow you to control cookies through their settings preferences. You can set your browser to refuse cookies or delete certain cookies. Generally, you can also manage similar technologies in the same way.';

  @override
  String get consequencesOfBlockingTitle => 'Consequences of blocking cookies';

  @override
  String get consequencesOfBlockingContent =>
      'If you choose to block or delete cookies, some features of our website may not work properly. You may experience reduced functionality and a less personalized experience.';

  @override
  String get complianceSection => 'Compliance';

  @override
  String get complianceContent =>
      'Our cookie policy complies with EU data protection standards. We only use first-party tracking tools and do not share your data with third-party advertisers.';

  @override
  String get contactForCookiesTitle => 'Contact us about cookies';

  @override
  String get contactForCookiesContent =>
      'If you have any questions about our use of cookies or tracking technologies, please contact us:';

  @override
  String get cookiePolicyLastModified => 'Last modified: September 7, 2025';

  @override
  String get termsAndConditionsTitle => 'Terms and Conditions of AstroGods';

  @override
  String get termsIntroduction => 'Introduction';

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get registration => 'Registration';

  @override
  String get registrationRequired =>
      'To use the Service, User can open an account by providing all required data and information completely and truthfully. It is not possible to use the Service without opening a User account.';

  @override
  String get accountRequirements => 'Account Requirements';

  @override
  String get accountClosureTitle => 'Account Closure';

  @override
  String get accountSuspension => 'Account Suspension and Cancellation';

  @override
  String get accountSuspensionText =>
      'The Owner reserves the right to suspend or cancel a User\'s account at any time at its sole discretion and without notice if deemed inappropriate, offensive, or contrary to these Terms.';

  @override
  String get permittedUse => 'Permitted Use';

  @override
  String get permittedUseText =>
      'AstroGods and the Service may only be used for the purposes for which they are offered, according to these Terms and applicable law.';

  @override
  String get salesTerms => 'Sales terms and conditions';

  @override
  String get paidProducts => 'Paid Products';

  @override
  String get productDescription => 'Product Description';

  @override
  String get purchaseProcedure => 'Purchase Procedure';

  @override
  String get orderSubmission => 'Order Submission';

  @override
  String get pricing => 'Pricing';

  @override
  String get promotionsAndDiscounts => 'Promotions and Discounts';

  @override
  String get vouchers => 'Vouchers';

  @override
  String get paymentMethods => 'Payment Methods';

  @override
  String get purchaseViaAppStore => 'Purchase via App Store';

  @override
  String get deliveryOfDigitalContent => 'Delivery of Digital Content';

  @override
  String get contractDuration => 'Contract Duration';

  @override
  String get trialPeriod => 'Trial Period';

  @override
  String get subscriptions => 'Subscriptions';

  @override
  String get lifetimeSubscriptions => 'Lifetime Subscriptions';

  @override
  String get fixedTermSubscriptions => 'Fixed-term Subscriptions';

  @override
  String get automaticRenewal => 'Automatic Renewal';

  @override
  String get cancellation => 'Cancellation';

  @override
  String get userRights => 'User Rights';

  @override
  String get rightOfWithdrawal => 'Right of Withdrawal';

  @override
  String get liabilityAndIndemnification => 'Liability and Indemnification';

  @override
  String get indemnificationText =>
      'The User agrees to indemnify and hold harmless the Owner and its subordinates, affiliates, officers, agents, co-trademark holders, partners and employees to the extent permitted by law from any claim or demand - including, without limitation, legal fees and costs - advanced by third parties due to or in connection with behaviors in violation of these Terms, third party rights or law, implemented in connection with the use of the Service and attributable to the User, its affiliates, officers, agents, co-trademark holders, partners and employees, on the basis of fault.';

  @override
  String get commonProvisions => 'Common Provisions';

  @override
  String get noWaiverImplied => 'No Waiver Implied';

  @override
  String get serviceInterruption => 'Service Interruption';

  @override
  String get serviceResale => 'Service Resale';

  @override
  String get privacyPolicyReference => 'Privacy Policy';

  @override
  String get contractAssignment => 'Contract Assignment';

  @override
  String get contacts => 'Contacts';

  @override
  String get severabilityClause => 'Severability Clause';

  @override
  String get applicableLaw => 'Applicable Law';

  @override
  String get disputeResolution => 'Dispute Resolution';

  @override
  String get definitions => 'Definitions and Legal References';

  @override
  String get astrologicalServiceNature => 'Nature of the astrological service';

  @override
  String get astrologicalServiceDescription =>
      'AstroGods uses astrology as a system of symbolic knowledge and personal research tool. The User understands that:';

  @override
  String get astrologicalServicePoint1 =>
      'Astrology is an ancient system of interpretation based on symbolic correlations, not on demonstrable scientific causality';

  @override
  String get astrologicalServicePoint2 =>
      'The service offers tools for self-exploration and self-understanding through astrological language';

  @override
  String get astrologicalServicePoint3 =>
      'The interpretations provided are aimed at inner research and the development of personal awareness';

  @override
  String get astrologicalServicePoint4 =>
      'No professional advice of a medical, psychological, legal or financial nature is provided';

  @override
  String get astrologicalServicePoint5 =>
      'Astrological analyses are tools for reflection and do not predict events with absolute certainty';

  @override
  String get astrologicalServicePoint6 =>
      'The User is responsible for the use they make of the information received in their personal growth journey';

  @override
  String get referralProgram => 'Referral Program';

  @override
  String get termsAcceptanceRequired => 'Please read this document carefully.';

  @override
  String get ownerName => 'Arcangelo Massari - Bologna (Italy)';

  @override
  String get ownerEmail => 'Owner\'s email address:';

  @override
  String get termsGovernText => 'These Terms govern';

  @override
  String get useOfService => 'the use of AstroGods and';

  @override
  String get legalRelationship =>
      'any other Agreement or legal relationship with the Owner';

  @override
  String get bindingManner =>
      'in a binding manner. Capitalized terms are defined in the relevant section of this document.';

  @override
  String get consumerRequirement => 'User acts as a Consumer';

  @override
  String get notUnderEmbargo =>
      'User is not located in a country subject to a US government embargo or listed as a terrorist-sponsoring country';

  @override
  String get notOnProhibitedList =>
      'User is not listed on any US government list of prohibited contractors';

  @override
  String get botRegistrationProhibited =>
      'Account opening via bots or other automated means is not permitted.';

  @override
  String get oneAccountPerUser =>
      'Unless otherwise specified, each User may create only one account.';

  @override
  String get accountSharingProhibited =>
      'Unless expressly permitted, a User\'s account may not be shared with other people.';

  @override
  String get externalResources => 'Access to External Resources';

  @override
  String get externalResourcesDisclaimer =>
      'Through AstroGods, Users may have access to resources provided by third parties. Users acknowledge and accept that the Owner has no control over such resources.';

  @override
  String get orderConfirmation =>
      'Once the order is submitted, Users will receive an order receipt confirmation.';

  @override
  String get trialAutoConversion =>
      'Upon expiration, the trial period will automatically convert to the equivalent paid Product unless the User cancels the purchase before the trial period expires.';

  @override
  String get lifetimeRefundPolicy =>
      'If the Product ceases its activity within a period of less than 24 months, Users will receive a refund.';

  @override
  String get fixedTermSubscriptionText =>
      'Paid fixed-term subscriptions start from the day the Owner receives payment and remain active for the duration of the subscription chosen by the User.';

  @override
  String get consumerExceptionText =>
      'However, regardless of the foregoing, if the User acts as a Consumer, the following applies:';

  @override
  String get withdrawalRightSummary =>
      'Unless an exception applies, the User may enjoy the right to withdraw from the contract within the period specified below (usually 14 days) for any reason and without justification. The User can find more information about the right of withdrawal in this section.';

  @override
  String get whoHasWithdrawalRights => 'Who has the right of withdrawal';

  @override
  String get europeanConsumersWithdrawal =>
      'Where none of the exceptions listed below apply, Users acting as European Consumers have the legal right to withdraw from contracts concluded online (distance contracts) within the time period specified below for any reason and without justification.';

  @override
  String get nonEuropeanUsersNoRights =>
      'Users who do not meet these requirements do not have the rights described in this section. The Consumer will be liable to the Seller only for any diminished value of the goods resulting from handling of the goods other than what is necessary to establish the nature, characteristics and functioning of the goods.';

  @override
  String get exerciseOfWithdrawalRight => 'Exercise of the right of withdrawal';

  @override
  String get withdrawalExercise =>
      'To exercise the right of withdrawal, the User must send the Owner an unequivocal communication of their intention to withdraw from the contract.';

  @override
  String get withdrawalFormInstructions =>
      'For this purpose, the User may use the standard withdrawal form found in the definitions section of this document. However, the User is free to express their intention to withdraw from the contract in any other suitable form. In order to comply with the period within which the right must be exercised, the User must send the withdrawal declaration before the withdrawal deadline expires.';

  @override
  String get withdrawalDeadlineQuestion =>
      'When does the withdrawal deadline expire?';

  @override
  String get digitalContentWithdrawalDeadline =>
      'In the case of contracts for the purchase of digital content not provided on a material medium, the withdrawal deadline expires 14 days after the day of conclusion of the contract, unless the User has waived the right of withdrawal.';

  @override
  String get effectsOfWithdrawal => 'Effects of withdrawal';

  @override
  String get withdrawalEffects =>
      'The Owner will refund all payments received, including delivery costs if any, to Users who have correctly exercised the right of withdrawal.';

  @override
  String get deliveryCostException =>
      'However, the additional cost arising from the choice of a particular delivery method other than the cheapest standard delivery offered by the Owner will remain the User\'s responsibility.';

  @override
  String get refundTimeline =>
      'The refund will be made without undue delay and in any case within 14 days from the day on which the Owner was informed of the User\'s decision to withdraw from the contract. Unless otherwise agreed with the User, the refund will be made using the same means of payment used for the initial transaction. The User will not incur any cost as a result of the withdrawal.';

  @override
  String get indemnification => 'Indemnification';

  @override
  String get userActivityLiabilityLimitation =>
      'Limitation of liability for User activities on AstroGods';

  @override
  String get generalLiabilityExclusion =>
      'Unless otherwise specified and subject to applicable legal provisions, any claim for damages against the Owner (or any natural or legal person acting on its behalf) is excluded.';

  @override
  String get liabilityExceptions =>
      'The foregoing does not limit the Owner\'s liability for death, personal injury or damage to physical or mental integrity, damages arising from breach of essential contractual obligations, such as obligations strictly necessary to achieve the purpose of the contract, and/or damages caused intentionally or through gross negligence, provided that the User\'s use of AstroGods has been appropriate and correct.';

  @override
  String get limitedLiabilityScope =>
      'Unless the damages were caused intentionally or through gross negligence or affect life and/or personal, physical or mental integrity, the Owner is only liable to the extent of damage typical for the type of contract and foreseeable at the time of conclusion.';

  @override
  String get noResponsibilityIntro =>
      'In particular, within the limits set out above, the Owner assumes no responsibility regarding:';

  @override
  String get forceMAjeureExclusion =>
      'damages or losses arising from interruptions or malfunctions of AstroGods due to force majeure or unforeseen and unforeseeable events and, in any case, independent of the will and beyond the control of the Owner, such as, by way of example only, failures or interruptions of telephone or electrical lines, Internet connection and/or other means of transmission, inaccessibility of websites, strikes, natural disasters, viruses and computer attacks, interruptions in the supply of third-party products, services or applications;';

  @override
  String get indirectLossExclusion =>
      'any lost profits or other losses, including indirect ones, that the User may have suffered (such as, by way of example only, commercial losses, loss of revenue, profits or anticipated savings, loss of contractual or commercial relationships, loss of goodwill or damage to reputation, etc.);';

  @override
  String get nonDirectLossExclusion =>
      'any losses that are not a direct consequence of a breach of the Terms by the Owner;';

  @override
  String get noImplicitWaiver =>
      'The Owner\'s failure to exercise legal rights or claims arising from these Terms does not constitute a waiver thereof. No waiver may be considered final in relation to a specific right or any other right.';

  @override
  String get serviceMaintenanceRight =>
      'To ensure the best possible level of service, the Owner reserves the right to interrupt the Service for maintenance, system updates, or any other changes, giving appropriate notice to Users.';

  @override
  String get serviceTerminationRights =>
      'Within the limits of the law, the Owner reserves the right to suspend or completely terminate the Service. In case of termination of the Service, the Owner will endeavor to allow Users to extract their personal data and information and will respect Users\' rights relating to continued use of the product and/or compensation, according to legal provisions.';

  @override
  String get forceMAjeureUnavailability =>
      'Additionally, the Service may not be available for reasons beyond the reasonable control of the Owner, such as force majeure (e.g., infrastructure malfunctions, blackouts, etc.).';

  @override
  String get advanceNotice =>
      'The Owner undertakes to inform Users with at least 30 days\' notice, where possible.';

  @override
  String get unauthorizedResale =>
      'Users are not authorized to reproduce, duplicate, copy, sell, resell, or exploit AstroGods or the Service in whole or in part without the Owner\'s prior written consent, expressed directly or through a legitimate resale program.';

  @override
  String get privacyPolicySection => 'Privacy policy';

  @override
  String get privacyPolicyReferenceContent =>
      'For detailed information about how we collect, use, and protect your personal data, please refer to our complete Privacy Policy.';

  @override
  String get viewPrivacyPolicy => 'View Privacy Policy';

  @override
  String get termsModification => 'Terms Modification';

  @override
  String get termsModificationRight =>
      'The Owner reserves the right to modify the Terms at any time. In such case, the Owner will give appropriate notice of the changes to Users.';

  @override
  String get modificationsEffectiveDate =>
      'The changes will take effect in relation to the User only from the moment communicated to the User.';

  @override
  String get termsModificationAcceptance =>
      'Continued use of the Service implies User acceptance of the updated Terms. If the User does not wish to accept the changes, they must cease using the Service and may withdraw from the Agreement.';

  @override
  String get previousVersionValidity =>
      'The previous version continues to govern the relationship until acceptance of the changes by the User. This version may be requested from the Owner.';

  @override
  String get advanceNotificationRequirement =>
      'If required by law, the Owner will notify Users in advance of the effective date of the modified Terms.';

  @override
  String get contractTransferRight =>
      'The Owner reserves the right to transfer, assign, dispose of, novate, or subcontract any or all rights and obligations under these Terms, having regard for the legitimate interests of Users.';

  @override
  String get assignmentTermsApplication =>
      'The provisions relating to the modification of these Terms apply.';

  @override
  String get userAssignmentRestriction =>
      'The User is not authorized to assign or transfer their rights and obligations under the Terms without the written consent of the Owner.';

  @override
  String get communicationRequirement =>
      'All communications relating to the use of AstroGods must be sent to the contact details indicated in this document.';

  @override
  String get generalSeverability =>
      'Should any provision of these Terms be or become null or ineffective under applicable law, the nullity or ineffectiveness of such provision does not cause the ineffectiveness of the remaining provisions, which therefore remain valid and effective.';

  @override
  String get europeanUsersTitle => 'European Users';

  @override
  String get europeanSeverability =>
      'Should a provision of these Terms be or become null, invalid, or ineffective, the parties will endeavor to identify amicably a valid and effective provision to replace the null, invalid, or ineffective one. In case of failure to reach agreement as described above, if permitted or provided by applicable law, the null, invalid, or ineffective provision will be replaced by the applicable legal provisions.';

  @override
  String get severabilityLimitations =>
      'Notwithstanding the above, the nullity, invalidity, or ineffectiveness of a specific provision of these Terms does not result in nullity of the entire Agreement, unless the null, invalid, or ineffective provisions within the Agreement are essential or of such importance that the parties would not have concluded the contract if they had known the provision would be invalid, or in cases where the remaining provisions would impose an excessive and unacceptable burden on one of the parties.';

  @override
  String get governingLaw =>
      'The Terms are governed by the law of the place where the Owner is established, as indicated in the relevant section of this document, regardless of conflict of law rules.';

  @override
  String get nationalLawPrevalence => 'National Law Prevalence';

  @override
  String get nationalLawPrevails =>
      'If the law of the User\'s country provides a higher level of consumer protection, that higher level of protection prevails.';

  @override
  String get competentJurisdiction => 'Competent Jurisdiction';

  @override
  String get exclusiveJurisdiction =>
      'Exclusive jurisdiction to hear any dispute arising from or in connection with the Terms belongs to the court of the place where the Owner is established, as indicated in the relevant section of this document.';

  @override
  String get europeanConsumerExceptionTitle =>
      'Exception for Consumers in Europe';

  @override
  String get europeanConsumerException =>
      'The above does not apply to Users acting as European Consumers or Consumers located in the United Kingdom, Switzerland, Norway, or Iceland.';

  @override
  String get amicableDisputeComposition => 'Amicable dispute composition';

  @override
  String get amicableDisputeResolution =>
      'Users may report any disputes to the Owner, who will seek to resolve them amicably.';

  @override
  String get judicialRightsPreservation =>
      'Without prejudice to the Users\' right to bring legal action, in case of disputes concerning the use of AstroGods or the Service, Users are requested to contact the Owner at the contact details indicated in this document.';

  @override
  String get complaintProcedure =>
      'Users may address a complaint to the Owner\'s email address indicated in this document, including a brief description and, if applicable, details of the affected order, purchase, or account.';

  @override
  String get responseTimeline =>
      'The Owner will process the request without undue delay and within 14 days of its receipt.';

  @override
  String get agreementDefinition =>
      'Any legally binding relationship or contract between the Owner and the User governed by the Terms.';

  @override
  String get voucherDefinition =>
      'Any digital or paper code or voucher that allows the User to purchase the Product at a discounted price.';

  @override
  String get europeanDefinition =>
      'Applies when the User, regardless of nationality, is located in the European Union.';

  @override
  String get ownerDefinition =>
      'Indicates the natural or legal person who provides AstroGods and/or offers the Service to Users.';

  @override
  String get productDefinition =>
      'A good or service available through AstroGods, including specifically: personalized astrological interpretations, birth chart analyses, astrological predictions and forecasts, compatibility reports, astrological educational content, and any other astrological service or digital content defined separately in this document.';

  @override
  String get serviceDefinition =>
      'The service offered through AstroGods as described in the Terms and on AstroGods.';

  @override
  String get termsDefinition =>
      'All conditions applicable to the use of AstroGods and/or the provision of the Service as described in this document as well as in any other document or agreement related to it, in the most updated version respectively.';

  @override
  String get userDefinition =>
      'Indicates any natural person who uses AstroGods.';

  @override
  String get consumerDefinition =>
      'Any User considered as such under applicable law.';

  @override
  String get astroGodsDefinitionTitle => 'AstroGods (or this Application)';

  @override
  String get astroGodsDefinition =>
      'The structure that enables the provision of the Service.';

  @override
  String get agreementDefinitionTitle => 'Agreement';

  @override
  String get voucherDefinitionTitle => 'Voucher';

  @override
  String get europeanDefinitionTitle => 'European (or Europe)';

  @override
  String get withdrawalFormTitle => 'Standard withdrawal form';

  @override
  String get withdrawalFormHeader => 'Addressed to:';

  @override
  String get withdrawalFormAddress =>
      'Arcangelo Massari - Bologna (Italy)\ncontact@astrogods.it';

  @override
  String get withdrawalFormNotification =>
      'I/we hereby notify withdrawal from my/our contract of sale for the following goods/services:';

  @override
  String get withdrawalFormDescription =>
      '_____________________________________________ (insert here a description of the goods/services from whose purchase you wish to withdraw)';

  @override
  String get withdrawalFormOrderDate =>
      'Ordered on: _____________________________________________ (insert the date)';

  @override
  String get withdrawalFormReceiveDate =>
      'Received on: _____________________________________________ (insert the date)';

  @override
  String get withdrawalFormConsumerName =>
      'Name of consumer(s):_____________________________________________';

  @override
  String get withdrawalFormConsumerAddress =>
      'Address of consumer(s):_____________________________________________';

  @override
  String get withdrawalFormDate =>
      'Date: _____________________________________________';

  @override
  String get withdrawalFormSignature =>
      '(sign only if this form is notified in paper version)';

  @override
  String get ownerDefinitionTitle => 'Owner (or We)';

  @override
  String get productDefinitionTitle => 'Product';

  @override
  String get serviceDefinitionTitle => 'Service';

  @override
  String get termsDefinitionTitle => 'Terms';

  @override
  String get userDefinitionTitle => 'User (or You)';

  @override
  String get consumerDefinitionTitle => 'Consumer';

  @override
  String get lastModifiedTerms => 'Last modified: September 7, 2025';

  @override
  String get termsTableOfContents => 'Table of Contents';

  @override
  String get termsIntroductionSection => 'Introduction';

  @override
  String get astrologicalServiceNatureSection =>
      'Nature of the astrological service';

  @override
  String get termsOfUseSection => 'Terms of Use';

  @override
  String get salesTermsSection => 'Sales terms and conditions';

  @override
  String get deliverySection => 'Delivery';

  @override
  String get contractDurationSection => 'Contract Duration';

  @override
  String get userRightsSection => 'User Rights';

  @override
  String get liabilitySection => 'Liability and Indemnification';

  @override
  String get commonProvisionsSection => 'Common Provisions';

  @override
  String get disputeResolutionSection => 'Dispute Resolution';

  @override
  String get cookiesAndTrackingSection => 'Cookies and tracking';

  @override
  String get cookiesAndTrackingReferenceContent =>
      'For detailed information about cookies and tracking technologies we use, please refer to our complete Cookie Policy.';

  @override
  String get viewCookiePolicy => 'View Cookie Policy';

  @override
  String get cookiesAndTrackingTitle => 'Cookies and tracking';

  @override
  String get contactUsSection => 'Contact Us';

  @override
  String get appleThirdPartyBeneficiary =>
      'Notwithstanding that the contractual relationship for the purchase of such Products is concluded exclusively between Owner and Users, Users acknowledge and accept that, should the provision of AstroGods have occurred through the Apple App Store or Google Play Store, the respective platform provider may exercise rights arising from these Terms as a third party beneficiary.';

  @override
  String get astroGodsServiceOf => 'AstroGods is a service of:';

  @override
  String get astroGodsRefersTo => '\"AstroGods\" refers to';

  @override
  String get thisSiteDescription =>
      'this website, accessible via browser, including related subdomains and any other site through which the Owner offers the Service;';

  @override
  String get mobileApplicationsDescription =>
      'applications for mobile devices (iOS and Android), tablets, desktop (Linux, Windows, macOS) or similar platforms;';

  @override
  String get termsOfUseGeneralValidity =>
      'Unless otherwise specified, the terms of use of AstroGods set out in this section have general validity.';

  @override
  String get additionalConditions =>
      'Additional conditions of use or access applicable in particular situations are expressly indicated in this document.';

  @override
  String get usingAstroGodsUserDeclares =>
      'By using AstroGods the User declares to meet the following requirements:';

  @override
  String get passwordSecurity =>
      'It is the Users\' responsibility to keep their access credentials secure and confidential. To this end, Users must choose a password that corresponds to the highest level of security available on AstroGods.';

  @override
  String get accountResponsibility =>
      'By creating an account, the User accepts to be fully responsible for all activities carried out with their access credentials. Users are required to inform the Owner immediately and unambiguously through the contact details indicated in this document if they believe that their personal information, such as the User account, access credentials or personal data, have been violated, unlawfully disclosed or stolen.';

  @override
  String get registrationRequirementsText =>
      'The registration of a User account on AstroGods is subject to the conditions specified below. By registering an account, the User confirms that they meet these conditions.';

  @override
  String get accountClosureProcedure =>
      'Users are free to close their account and cease using the Service at any time by following this procedure:';

  @override
  String get usingAccountClosureTools =>
      'Using the account closure tools available on AstroGods.';

  @override
  String get paidSubscriptionSuspension =>
      'However, the closure of the User account will be suspended until the expiry of any paid subscription services purchased by the User.';

  @override
  String get noCompensationForSuspension =>
      'Account suspension or cancellation does not entitle the User to any compensation, refund or indemnification.';

  @override
  String get paymentObligationRemains =>
      'The suspension or cancellation of an account for causes attributable to the User does not exempt the User from payment of fees or prices that may be applicable.';

  @override
  String get thirdPartyResourcesDisclaimer =>
      'The conditions applicable to resources provided by third parties, including those applicable to any grants of rights on content, are determined by the same third parties and governed by their respective terms and conditions or, in their absence, by law.';

  @override
  String get userExclusiveResponsibility =>
      'It is the User\'s exclusive responsibility to ensure that the use of AstroGods and/or the Service does not violate the law, regulations or the rights of third parties.';

  @override
  String get ownerProtectiveRights =>
      'Therefore, the Owner reserves the right to adopt any suitable measure to protect their legitimate interests, and in particular to deny the User access to AstroGods or the Service, terminate contracts, report any objectionable activity carried out through AstroGods or the Service to competent authorities - e.g. judicial or administrative authority - whenever the User implements or there is suspicion that they implement:';

  @override
  String get violationsOfLaw =>
      'violations of law, regulations and/or the Terms;';

  @override
  String get injuryToThirdPartyRights => 'injury to third party rights;';

  @override
  String get actsHarmingOwnerInterests =>
      'acts that may considerably harm the Owner\'s legitimate interests;';

  @override
  String get offensesToOwnerOrThird =>
      'offenses to the Owner or a third party.';

  @override
  String get referralBenefits =>
      'AstroGods allows Users to receive benefits if, thanks to their recommendation, a new User purchases a Product offered on AstroGods.';

  @override
  String get referralCodeUsage =>
      'To take advantage of this opportunity, the User can invite friends to purchase Products on AstroGods by sending them a special code provided by the Owner. Each code can be redeemed only once.';

  @override
  String get referralRewardSystem =>
      'If one of the invited people purchasing a Product on AstroGods decides to redeem an invitation code, the User who invited them will receive the benefit or advantage (such as: a discount, an additional service, an upgrade etc.) indicated on AstroGods.';

  @override
  String get referralCodeLimitations =>
      'Invitation codes may only be redeemable for some Products among those offered on AstroGods.';

  @override
  String get ownerDiscretionaryRight =>
      'The Owner reserves the right to cease the offer at any time at their sole discretion.';

  @override
  String get referralLimitations =>
      'Although there is no limit to the number of people who can be invited, the number of benefits or advantages that each User can receive for an equal number of redeemed invitation codes may be subject to a maximum limit.';

  @override
  String get salesTermsIntro =>
      'Some of the Products offered on AstroGods as part of the service are paid.';

  @override
  String get salesTermsDetails =>
      'The rates, duration and conditions applicable to the sale of such Products are described below and in the respective sections of AstroGods.';

  @override
  String get purchaseRegistrationRequired =>
      'To purchase Products, the User is required to register or log in to AstroGods.';

  @override
  String get productDescriptionInfo =>
      'Prices, descriptions and availability of astrological Products (including personalized birth chart readings, compatibility analyses, daily and monthly predictions, relationship insights, and travel astrology recommendations) are specified in the respective sections of AstroGods and are subject to change without notice.';

  @override
  String get productRepresentationDisclaimer =>
      'Although Products on AstroGods are presented with the maximum technically possible accuracy, the representation on AstroGods through any means (including, as the case may be, graphic materials, images, colors, sounds) is to be understood as a mere reference and does not imply any guarantee regarding the characteristics of the Product purchased.';

  @override
  String get productCharacteristicsSpecified =>
      'The characteristics of the selected Product will be specified during the purchase procedure.';

  @override
  String get purchaseProcedureSteps =>
      'Each step, from product selection to order submission, is part of the purchase procedure. The purchase procedure includes the following steps:';

  @override
  String get stripeCheckoutAccess =>
      'By clicking the checkout button, Users access the Stripe checkout area where they will be asked to provide their contact details and a payment method of their choice.';

  @override
  String get stripePaymentStorage =>
      'Users who have not yet done so, can request Stripe to store their payment information for future purchases on AstroGods or on other sites that use Stripe as a payment gateway. For information on the processing of personal data and related rights, the User can consult the privacy policy of Stripe and AstroGods.';

  @override
  String get stripeBillingAddress =>
      'Within the Stripe checkout area, Users may also be asked to specify their billing and shipping address.';

  @override
  String get stripeExpressCheckout =>
      'Within the Stripe checkout area, Users will have the possibility to choose express checkout. Express checkout allows Users to complete the purchase directly, using payment information and contact details stored by the most common online payment management services (such as \"ApplePay\", \"Google Pay\", \"Microsoft Pay\").';

  @override
  String get orderSubmissionRequirement =>
      'To submit the order, Users are required to accept these Terms and use the respective button or mechanism on AstroGods, thereby committing to pay the agreed price.';

  @override
  String get orderSubmissionConsequences =>
      'Order submission entails the following:';

  @override
  String get contractConclusion =>
      'Order submission by the user determines the conclusion of the contract and gives rise to the User\'s obligation to pay the price, taxes and any additional charges and expenses, as specified in the order page.';

  @override
  String get userCollaborationObligation =>
      'In the event that the purchased Product requires action by the User, such as the provision of information or personal data, specifications or particular requests, order submission also constitutes the User\'s obligation to collaborate accordingly.';

  @override
  String get orderConfirmationEmail =>
      'Once the order is submitted, Users will receive an order receipt confirmation.';

  @override
  String get purchaseNotifications =>
      'All notifications related to the purchase procedure described above will be sent to the email address provided by the User for this purpose.';

  @override
  String get pricingTransparency =>
      'During the purchase procedure and before order submission, Users are duly informed of all fees, taxes and costs (including any shipping charges) that will be charged to them.';

  @override
  String get pricingPolicy =>
      'Prices on AstroGods include all applicable fees, taxes and costs.';

  @override
  String get promotionsDisclaimer =>
      'The Owner may offer discounts or special promotions for the purchase of Products. Such promotions or discounts are always subject to the requirements and terms and conditions provided in the relevant section of AstroGods.';

  @override
  String get promotionsDiscretion =>
      'Promotions and offers are always granted at the sole discretion of the Owner.';

  @override
  String get promotionsNoRights =>
      'Repeated or periodic promotions or discounts do not constitute any claim or right enforceable by Users in the future.';

  @override
  String get promotionsTimeLimit =>
      'Depending on the case, discounts and promotions are valid for a certain period of time or until stocks run out. Unless otherwise specified, the time limitations of promotions and discounts refer to the time zone of the Owner\'s headquarters, as indicated in the contact details in this document.';

  @override
  String get vouchersPromoForm =>
      'Promotions and discounts may be offered in the form of Vouchers.';

  @override
  String get vouchersViolationConsequences =>
      'In case of violation of the conditions applicable to Vouchers, the Owner may legitimately refuse to fulfill their contractual obligations and expressly reserves the right to take action in appropriate venues, including judicial ones, in order to protect their rights and interests.';

  @override
  String get vouchersAdditionalProvisions =>
      'Any additional or divergent provisions applicable to the use of Vouchers reported in the relevant information page or on the Voucher itself prevail in any case, regardless of the provisions that follow.';

  @override
  String get vouchersRules =>
      'Unless otherwise specified, the following rules apply to the use of Vouchers:';

  @override
  String get voucherValidityRule =>
      'Each Voucher is valid only if used according to the methods and within the time period specified on the website and/or on the Voucher;';

  @override
  String get voucherFullRedemption =>
      'The Voucher can only be redeemed in full at the time of purchase – partial use is not permitted;';

  @override
  String get voucherSingleUse =>
      'Unless otherwise specified, single-use Vouchers can be redeemed only once per purchase and can therefore be redeemed only once even in the case of installment purchases;';

  @override
  String get vouchersNotCumulative => 'Vouchers are not cumulative;';

  @override
  String get voucherExpiration =>
      'The Voucher must be used within the specified validity period. Once the period expires, the Voucher will be automatically canceled. Any possibility of claiming rights, including refund of the Voucher value, is excluded;';

  @override
  String get voucherNoCredit =>
      'The User is not entitled to any credit/refund/compensation in case there is a difference between the Voucher value and the redeemed value;';

  @override
  String get voucherNonCommercialUse =>
      'The Voucher is to be understood exclusively for non-commercial use. The reproduction, counterfeiting and commercialization of the Voucher are strictly prohibited, as well as any illegal activity connected to the purchase and/or use of the Voucher.';

  @override
  String get paymentMethodsInfo =>
      'AstroGods processes all payments securely through Stripe, a certified PCI DSS compliant payment processor. Accepted payment methods include major credit and debit cards (Visa, Mastercard, American Express), digital wallets (Apple Pay, Google Pay), and other methods available through Stripe in your region.';

  @override
  String get paymentMethodsConditions =>
      'Payment processing is handled entirely by Stripe Technology Europe Ltd. AstroGods does not store or have access to your payment card details, which are processed and stored securely by Stripe according to the highest industry security standards.';

  @override
  String get paymentThirdPartyHandling =>
      'All payments are handled independently by third-party services. Therefore, AstroGods does not collect payment-related data – such as credit card numbers – but receives a notification once the payment has been successful. For further information on the processing of personal data and related rights, the User can refer to the AstroGods privacy policy.';

  @override
  String get paymentFailureConsequences =>
      'In the event that payment made with one of the available methods fails or is rejected by the payment service provider, the Owner is not obligated to execute the order. In the event that payment is not successful, the Owner reserves the right to request the User to reimburse any related expenses or damages.';

  @override
  String get stripeRecurringPayments =>
      'For subscription services, Stripe securely stores payment method information to process recurring payments automatically. Users can manage, update, or cancel their payment methods and subscriptions through the customer portal accessible from their account settings.';

  @override
  String get stripeCustomerPortal =>
      'Users can access the Stripe Customer Portal to view billing history, download invoices, update payment methods, and manage subscription settings. This portal is provided directly by Stripe and ensures secure access to payment and billing information.';

  @override
  String get appStorePurchases =>
      'AstroGods or certain Products sold on AstroGods must be purchased through a third-party app store. To make such purchases, Users are asked to follow the instructions in the relevant app store (for example \"Apple App Store\" or \"Google Play\"). This information may vary depending on the specific device used.';

  @override
  String get appStoreTermsPrecedence =>
      'Unless otherwise specified, purchases made through third-party online stores are also subject to the terms and conditions of such third parties. Such terms and conditions prevail in any case of inconsistency or conflict with respect to these Terms.';

  @override
  String get appStoreTermsAcceptance =>
      'Therefore, Users who make purchases through such third-party online stores are asked to carefully read and accept the related terms and conditions of sale.';

  @override
  String get ownershipReservationTitle => 'Ownership reservation';

  @override
  String get ownershipReservation =>
      'Until receipt of payment of the full purchase price by the Owner, the User does not acquire ownership of the ordered Products.';

  @override
  String get usageRightsReservationTitle => 'Usage rights reservation';

  @override
  String get usageRightsReservation =>
      'Until receipt of payment of the full purchase price by the Owner, the User does not acquire the usage rights of the ordered Products.';

  @override
  String get contractualWithdrawalRightTitle => 'Contractual withdrawal right';

  @override
  String get contractualWithdrawalRight =>
      'The Owner grants Users the contractual right to withdraw from the purchase contract according to the terms and conditions set out in the relevant section of AstroGods within 30 days of the conclusion of the contract.';

  @override
  String get delivery => 'Delivery';

  @override
  String get digitalContentDeliveryDetails =>
      'Unless otherwise specified, astrological content purchased on AstroGods consists of textual interpretations and analyses (including birth chart analyses, personalized interpretations, predictions, and compatibility reports) delivered digitally through the online application interface. AstroGods functions primarily as an online service accessible through web browsers and mobile applications.';

  @override
  String get deviceRequirements =>
      'Users acknowledge and accept that, to download and/or use the Product, the chosen device(s) and their respective software (including operating systems) must be legal, commonly used, updated and in line with current market standards.';

  @override
  String get downloadLimitations =>
      'Users acknowledge and accept that the possibility of downloading the purchased Product may be limited in time and space.';

  @override
  String get trialPeriodAvailability =>
      'Users have the opportunity to try AstroGods or individual Products free of charge for a 7-day, non-renewable trial period. Some functions or features of AstroGods may not be available during the trial period. Additional conditions applicable to the trial period will be specified on AstroGods.';

  @override
  String get subscriptionContinuousProduct =>
      'Through subscription, the User receives a Product continuously or periodically. Details regarding the type of subscription and termination are described below.';

  @override
  String get lifetimeSubscriptionDuration =>
      'Lifetime subscriptions are subscriptions that remain active for the entire duration of activity of the subscribed Product. Lifetime subscriptions start from the day the Owner receives payment. They terminate only if and when the related Product ceases its activity.';

  @override
  String get fixedTermSubscriptionEnd =>
      'Once the subscription duration has ended, the Product will no longer be accessible.';

  @override
  String get appleAccountSubscriptions =>
      'Users can subscribe to a Product using the Apple Account associated with their Apple App Store account through the related procedure on AstroGods. In doing so, Users acknowledge and accept that:';

  @override
  String get appleAccountPayment =>
      'any payment due will be charged to the Apple account;';

  @override
  String get appleAccountAutoRenewal =>
      'subscriptions automatically renew for the same duration unless the User communicates cancellation at least 24 hours before the expiration of the current subscription period;';

  @override
  String get appleAccountRenewalCharges =>
      'all fees or payments due for renewal will be charged within 24 hours before the expiration of the current period;';

  @override
  String get appleAccountManagement =>
      'subscriptions can be managed or canceled directly through the User\'s Apple App Store account settings.';

  @override
  String get appleTermsPrecedence =>
      'The above prevails over any conflicting or divergent provision of the Terms.';

  @override
  String get automaticRenewalPolicy =>
      'Subscriptions automatically renew through Stripe\'s secure billing system with a charge to the User\'s chosen payment method. Users receive email notifications before each renewal and can cancel or modify their subscription anytime through the Stripe Customer Portal.';

  @override
  String get renewalDurationMatch =>
      'The renewal has the same duration as the original subscription period.';

  @override
  String get subscriptionTermination =>
      'Subscriptions can be terminated by: (1) accessing the Stripe Customer Portal through your account settings to cancel immediately, (2) sending a clear cancellation notice to the Owner using the contact details provided in this document, or (3) following the cancellation instructions on AstroGods.';

  @override
  String get cancellationEffectiveTiming =>
      'If the cancellation notice reaches the Owner before the subscription renewal date, the termination will take effect at the end of the current period.';

  @override
  String get consumerExceptionTitle => 'Exception for Consumers';

  @override
  String get consumerIndefiniteExtension =>
      'At the end of the initial term, subscriptions are automatically extended indefinitely, unless the User cancels before the end of such term.';

  @override
  String get consumerRenewalCharging =>
      'The fee due at the time of extension will be charged to the payment method that the User chose when purchasing.';

  @override
  String get consumerMonthlyTermination =>
      'After the extension, the subscription will have an indefinite duration and may be terminated monthly.';

  @override
  String get consumerCancellationTiming =>
      'If the cancellation reaches the Owner within the end of the current month, the subscription expires at the end of that month.';

  @override
  String get resolution => 'Resolution';

  @override
  String get appleAccountSubscriptionsTitle =>
      'Subscriptions managed through Apple Account';

  @override
  String get differentiatedLicensingSection => 'Differentiated licensing';

  @override
  String get differentiatedLicensing => 'Differentiated licensing for content';

  @override
  String get differentiatedLicensingText =>
      'The contents of AstroGods are subject to three distinct licensing regimes:';

  @override
  String get proprietaryContentStandard => 'A) Proprietary standard content';

  @override
  String get proprietaryContentStandardText =>
      'The application interface, algorithms, software, trademarks, user database and all technical elements remain the exclusive property of the Owner with all rights reserved.';

  @override
  String get codexCreativeCommons =>
      'B) Codex - Educational content (CC BY 4.0 license)';

  @override
  String get codexCreativeCommonsText =>
      'The contents of the Codex, including interpretive texts, images and educational materials, are released under the Creative Commons Attribution 4.0 International license. Users may:';

  @override
  String get codexRights1 =>
      'Reproduce, distribute and publicly communicate the work';

  @override
  String get codexRights2 =>
      'Modify, transform the work and create derivative works';

  @override
  String get codexRights3 => 'Use the work for commercial purposes';

  @override
  String get codexAttributionRequired =>
      'Mandatory condition: Attribution through citation \"Source: AstroGods (astrogods.it) - CC BY 4.0 License\"';

  @override
  String get codexThirdPartyLicenseHierarchy =>
      'Where Codex content incorporates third-party materials subject to more restrictive licenses, the terms of the more restrictive license shall prevail. Users must identify and comply with all applicable license requirements, including attribution to original sources.';

  @override
  String get aiGeneratedInterpretations =>
      'C) AI-generated personalized interpretations';

  @override
  String get aiGeneratedInterpretationsText =>
      'The personalized astrological interpretations generated by the service may be freely reused by users for any purpose, provided they are accompanied by the statement: \"Interpretation generated by AstroGods (astrogods.it)\"';

  @override
  String get startFreeSevenDays => 'START FREE - 7 DAYS';

  @override
  String thenPricePerMonth(Object price) {
    return 'Then $price/month';
  }

  @override
  String billedAnnuallyAt(Object amount) {
    return 'billed $amount/year';
  }

  @override
  String saveAmount(Object amount) {
    return 'SAVE $amount/YEAR';
  }

  @override
  String get exploreOtherPlans => 'Explore other plans';

  @override
  String get hideOtherPlans => 'Hide other plans';

  @override
  String get recommendedPlan => 'BEST VALUE';

  @override
  String get currentPlan => 'Current plan';

  @override
  String get upgrade => 'Upgrade to Premium';

  @override
  String get downgrade => 'Downgrade to Standard';

  @override
  String get nextRenewal => 'Next renewal';

  @override
  String get changePlan => 'Change plan';

  @override
  String get birthInformation => 'Birth Information';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get placeOfBirth => 'Place of Birth';

  @override
  String get timeOfBirth => 'Time of Birth';

  @override
  String get unknownTime => 'Unknown';

  @override
  String get person => 'Person';

  @override
  String get transitInformation => 'Transit information';

  @override
  String get transitDate => 'Transit date';

  @override
  String get transitLocation => 'Transit location';

  @override
  String get transitPeriod => 'Transit period';

  @override
  String get lunarPhase => 'Lunar phase';

  @override
  String dayNumber(int number) {
    return 'day $number';
  }

  @override
  String dailyTransitOf(String name) {
    return 'Daily transit of $name';
  }

  @override
  String monthlyTransitOf(String name) {
    return 'Monthly transit of $name';
  }

  @override
  String get pdfDownloadedSuccessfully => 'PDF downloaded successfully';

  @override
  String get downloadPdf => 'Download PDF';

  @override
  String get savePdfDialogTitle => 'Save PDF';

  @override
  String get sharePdf => 'Share PDF';

  @override
  String get generatingPdf => 'Generating PDF...';

  @override
  String pdfGenerationError(Object error) {
    return 'Error generating PDF: $error';
  }

  @override
  String get generateDailyTransit => 'Generate Daily Transit';

  @override
  String get generateMonthlyTransit => 'Generate Monthly Transit';

  @override
  String get dailyMonthlyTransits => 'Daily and monthly transits';

  @override
  String get dailyPredictions => 'Daily predictions';

  @override
  String get monthlyPredictions => 'Monthly predictions';

  @override
  String get anticipateYourDayWithTransits =>
      'Anticipate your day with transit analysis';

  @override
  String get anticipateYourMonthWithTransits =>
      'Anticipate your month with transit analysis';

  @override
  String get pleaseSelectBirthChart => 'Please select a birth chart';

  @override
  String get pleaseSelectDate => 'Please select a date';

  @override
  String get pleaseSelectLocation => 'Please select a location';

  @override
  String get selectLocation => 'Select location';

  @override
  String get transitFor => 'Transit for';

  @override
  String get dailySkyOf => 'Sky of the day';

  @override
  String get monthlySkyOf => 'Sky of the month';

  @override
  String get selectDate => 'Select Date';

  @override
  String get selectMonth => 'Select Month';

  @override
  String get selectChart => 'Select chart';

  @override
  String get subscribeToDaily => 'Subscribe to daily horoscope';

  @override
  String get subscribeToMonthly => 'Subscribe to monthly horoscope';

  @override
  String get unsubscribe => 'Unsubscribe';

  @override
  String get subscribeSuccess => 'Successfully subscribed to newsletter';

  @override
  String get unsubscribeSuccess => 'Successfully unsubscribed from newsletter';

  @override
  String get noNewsletterSubscriptions => 'No active horoscope by email';

  @override
  String get emailNotifications => 'Horoscope by email';

  @override
  String get newsletterType => 'Newsletter type';

  @override
  String get currentLocation => 'Current location';

  @override
  String get addNewsletter => 'Add horoscope by email';

  @override
  String get create => 'Create';

  @override
  String get birthChartCreated => 'Birth chart created successfully';

  @override
  String get authenticationRequired => 'Authentication required';

  @override
  String get pleaseLoginToSaveCharts =>
      'Please login to save birth charts to your account. Without login, charts cannot be saved for future use.';

  @override
  String get premiumRequiredForDailyTransit =>
      'Premium subscription required to generate daily transit readings';

  @override
  String get premiumRequiredForMonthlyTransit =>
      'Premium subscription required to generate monthly transit readings';

  @override
  String get premiumRequiredForSynastry =>
      'Premium subscription required to create couple compatibility analyses';

  @override
  String get unsubscribeError => 'Failed to unsubscribe';

  @override
  String get unsubscribeSuccessMessage =>
      'You will no longer receive these emails. You can resubscribe anytime from your account settings.';

  @override
  String get goHome => 'Go to Home';

  @override
  String get allNewsletters => 'All newsletters';

  @override
  String get birthChart => 'Birth chart';

  @override
  String get processingUnsubscribeRequest =>
      'Processing unsubscribe request...';

  @override
  String get unknownErrorOccurred => 'Unknown error occurred';

  @override
  String get networkErrorOccurred => 'Network error occurred';

  @override
  String get newMoon => 'New moon';

  @override
  String get waxingCrescent => 'Waxing crescent';

  @override
  String get firstQuarter => 'First quarter';

  @override
  String get waxingGibbous => 'Waxing gibbous';

  @override
  String get fullMoon => 'Full moon';

  @override
  String get waningGibbous => 'Waning gibbous';

  @override
  String get lastQuarter => 'Last quarter';

  @override
  String get waningCrescent => 'Waning crescent';

  @override
  String dayCount(Object day) {
    return 'Day $day';
  }

  @override
  String get connectionError =>
      'Connection failed. Check your network and try again.';

  @override
  String get serverUnavailable =>
      'We\'re making some improvements. Back in a moment!';

  @override
  String get connectionTimeout =>
      'The request took too long. Please try again.';

  @override
  String get aboutAndFaq => 'About and FAQ';

  @override
  String get aboutFaqTitle => 'About AstroGods';

  @override
  String get aboutFaqTableOfContents => 'Table of contents';

  @override
  String get storySectionTitle => 'Our story';

  @override
  String get missionSectionTitle => 'Our mission';

  @override
  String get teamSectionTitle => 'The team';

  @override
  String get faqSectionTitle => 'Frequently asked questions';

  @override
  String get storyText =>
      'AstroGods was born from a friendship. Arcangelo has always been struck by Jacopo\'s ability to describe people with precision based only on their birth date, and to read moments of his life with an inexplicable depth. He wanted to always carry that perspective with him, and so AstroGods was born: an attempt to translate into an algorithm the method Jacopo uses to decipher reality through Astrology.';

  @override
  String get missionText =>
      'Ours is first and foremost a research mission: we ourselves are curious to discover what is possible with this tool. We use software that considers all factors simultaneously to reach increasingly precise interpretations. AstroGods makes astrological interpretation more accessible to non-experts, while also simplifying the work of astrologers: no matter how skilled or experienced, they must symbolically blend infinite elements. Having a tool that keeps them all in consideration means nothing gets forgotten: a support that enhances, not replaces, human expertise.';

  @override
  String get teamMemberJacopoTitle => 'Jacopo Trombetti';

  @override
  String get teamMemberJacopoRole => 'Astrologer';

  @override
  String get teamMemberJacopoDescription =>
      'Trained at the Accademia di Astrologia Egizia founded by Pascal Fabio Patruno, Jacopo is a brilliant astrologer capable of computing synastry mentally, memorizing degrees and planets from charts he has seen only once in his life.';

  @override
  String get teamMemberArcangeloTitle => 'Arcangelo Massari';

  @override
  String get teamMemberArcangeloRole => 'Technical development';

  @override
  String get teamMemberArcangeloDescription =>
      'Student of Jacopo and responsible for the technical side of AstroGods. Passionate about Astrology, studying the subject since 2016.';

  @override
  String get teamMemberCorradoTitle => 'Corrado Camponeschi';

  @override
  String get teamMemberCorradoRole => 'Community';

  @override
  String get teamMemberCorradoDescription =>
      'Explorer of various paths of self-knowledge, Corrado is responsible for spreading AstroGods to the world and building bridges between Astrology and other disciplines.';

  @override
  String get faq1Question =>
      'Does artificial intelligence make interpretations random?';

  @override
  String get faq1Answer =>
      'AI plays a minor role in AstroGods. The interpretations are handwritten and curated by Jacopo Trombetti and Arcangelo Massari. The astronomical calculations use the Swiss Ephemeris, the most precise in the world. AI only assembles the various interpretive pieces into coherent sentences, nothing more.';

  @override
  String get faq2Question => 'Why are Uranus, Neptune, and Pluto not included?';

  @override
  String get faq2Answer =>
      'According to this interpretive approach, the human energy constitution articulates across seven chakras corresponding to seven planets, from the Moon to Saturn. Beyond these, the human constitution simply has no receptive channels for superior planetary powers. These planets have an impact, but of a generational type: for example, Pluto in Scorpio (1983-1995) characterizes an entire generation. They are more useful for studying historical periods than individuals, and therefore are not included.';

  @override
  String get faq3Question =>
      'Why are the planets in different Houses compared to other apps?';

  @override
  String get faq3Answer =>
      'Domification is the method used to calculate the twelve astrological Houses. Most apps use Placidus, which divides the sky based on time, creating unequal Houses that vary by latitude: some can be enormous, others tiny. We use Vehlow, which divides the zodiac into twelve equal Houses of 30 degrees each. It makes no symbolic sense to divide the human soul into unequal parts: no area of life is less important than another.';

  @override
  String get faq4Question => 'Why is the birth time important?';

  @override
  String get faq4Answer =>
      'The Ascendant and Houses depend on the exact birth time. The entire chart rotates completely in 24 hours. Without the time of birth, we can only analyze planetary positions in signs, missing half of the symbolic picture: the Houses that describe in which areas of life planetary energies manifest.';

  @override
  String get faq5Question =>
      'What is the source of the astrological calculations?';

  @override
  String get faq5Answer =>
      'We use the Swiss Ephemeris, the most precise astronomical tables in the world. Developed and maintained by Astrodienst (astro.com), they calculate exact planetary positions for any date in history or the future. They are the standard reference for professional astrological software.';

  @override
  String get faq6Question => 'Why Egyptian Astrology?';

  @override
  String get faq6Answer =>
      'Egypt is the hermetic matrix of Western culture. Horoscopic Astrology was born in Alexandria, Egypt, where Pharaoh Nechepso and priest Petosiris wrote the foundational texts (~150-120 BCE) from which all Greek and Roman astrologers drew. Ptolemy, author of the Tetrabiblos (foundation of Western Astrology), worked in Alexandria. Hermes Trismegistus, the fusion of Greek Hermes and Egyptian Thoth, is considered the founder of this tradition. Egyptian Astrology is not a variant: it is the original source.';

  @override
  String get faq7Question =>
      'Does this app replace consultation with an astrologer?';

  @override
  String get faq7Answer =>
      'No. Astrological elements have multiple symbolic meanings, and interpreting them within a specific energetic constitution requires an exchange between souls, hearts, and sensibilities. An expert astrologer can use AstroGods to simplify their work, but through personal exchange they will be better able to bring out deeper meanings. Furthermore, AstroGods does not yet consider the entire astrological spectrum: the expert astrologer remains irreplaceable.';

  @override
  String get viewChart => 'View chart';

  @override
  String get chartOnlyMode => 'Chart only, without reading';

  @override
  String get birthChartGraph => 'Birth chart';

  @override
  String get synastryGraph => 'Synastry chart';

  @override
  String get dailyTransitGraph => 'Daily transit chart';

  @override
  String get monthlyTransitGraph => 'Monthly transit chart';

  @override
  String get releaseNotes => 'Release notes';

  @override
  String get releaseNotesTitle => 'What\'s new';

  @override
  String version(Object version) {
    return 'Version $version';
  }

  @override
  String get releaseNotes_4_5_1 =>
      'New app icons. Improved logo quality in the menu. Fixed a validation issue when editing birth charts.';

  @override
  String get releaseNotes_4_0_1 =>
      'Fixed an issue where the PDF button did not appear after reading generation. Saved charts now refresh correctly when navigating back with the browser.';

  @override
  String get releaseNotes_4_0_0 =>
      'High-resolution images in fullscreen view. New aspect grid for synastry and transits. PDF exports now include details and aspect grid pages. Enhanced desktop navigation with arrows, clickable indicators, and keyboard shortcuts. Improved fullscreen zoom for charts and images. Lighter and faster app. Fixed layout issue in landscape mode on mobile.';

  @override
  String get releaseNotes_3_0_0 =>
      'New release notes screen to view version history. The app now checks compatibility and notifies you when an update is available. Improved reading generation stability.';

  @override
  String get releaseNotes_2_4_0 =>
      'Readings can now resume if your connection is interrupted. Improved overall stability.';

  @override
  String get releaseNotes_2_3_0 =>
      'Enhanced chart visualization with degree markers and planet connector lines. Improved water sign colors for better contrast. Visual refinements to the chart display.';

  @override
  String get releaseNotes_2_2_1 => 'Bug fixes and stability improvements.';

  @override
  String get releaseNotes_2_2_0 =>
      'Faster transit calculations, up to 40% faster for monthly transits. New team member: Corrado Camponeschi.';

  @override
  String get releaseNotes_2_1_0 =>
      'Chart-only PDF download for birth chart, synastry, and transits. PDF export for daily and monthly transit readings. House numbers now shown in chart details. Birth charts created before registration are now automatically linked to your account.';

  @override
  String get releaseNotes_2_0_4 => 'Bug fixes and stability improvements.';

  @override
  String get releaseNotes_2_0_3 => 'Performance improvements.';

  @override
  String get releaseNotes_2_0_2 => 'Bug fixes and stability improvements.';

  @override
  String get releaseNotes_2_0_1 =>
      'Initial release with birth chart readings, synastry analysis for couple compatibility, and daily and monthly transit predictions. PDF export. Full support for English and Italian.';

  @override
  String get updateRequired => 'Just a moment!';

  @override
  String get updateNow => 'Update';

  @override
  String get errorMessageCopied => 'Error message copied to clipboard';
}
