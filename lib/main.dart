import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiMode, SystemUiOverlayStyle, Brightness;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'web_url_strategy_stub.dart'
    if (dart.library.html) 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'l10n/app_localizations.dart';
import 'providers/language_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/auth_provider.dart';
import 'themes/app_theme.dart';
import 'constants/colors.dart';
import 'config/environment.dart';
import 'config/router.dart';
import 'config/stripe_config.dart';
import 'widgets/custom_title_bar.dart';

// coverage:ignore-start
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    usePathUrlStrategy();
  }

  GoRouter.optionURLReflectsImperativeAPIs = true;

  await Environment.init();

  if (!kIsWeb) {
    Stripe.publishableKey = StripeConfig.publishableKey;
    // TODO: Register a Merchant ID in Apple Developer Console for Apple Pay on iOS
    Stripe.merchantIdentifier = 'merchant.com.astrogods.app';
  }

  if (!kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.windows ||
          defaultTargetPlatform == TargetPlatform.linux ||
          defaultTargetPlatform == TargetPlatform.macOS)) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
      size: const Size(1200, 800),
      minimumSize: const Size(800, 600),
      center: true,
      backgroundColor: AppColors.darkBackground,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      title: 'AstroGods',
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setMinimumSize(const Size(800, 600));
    });
  }

  if (!kDebugMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  runApp(createApp());
}
// coverage:ignore-end

Widget createApp() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: const AstroGodsApp(),
  );
}

class AstroGodsApp extends StatefulWidget {
  const AstroGodsApp({super.key});

  @override
  State<AstroGodsApp> createState() => _AstroGodsAppState();
}

class _AstroGodsAppState extends State<AstroGodsApp> {
  late final GoRouter _router;

  bool get _isMobile =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  bool get _isDesktop =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.windows ||
          defaultTargetPlatform == TargetPlatform.linux ||
          defaultTargetPlatform == TargetPlatform.macOS);

  @override
  void initState() {
    super.initState();
    _router = AppRouter.createRouter();

    if (_isMobile) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final languageProvider = Provider.of<LanguageProvider>(
        context,
        listen: false,
      );
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

      authProvider.setLanguageProvider(languageProvider);
      authProvider.setThemeProvider(themeProvider);
      await authProvider.initialize();

      if (_isMobile) {
        _updateSystemUIOverlay(themeProvider.themeMode == ThemeMode.dark);
      }
    });
  }

  void _updateSystemUIOverlay(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: isDark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LanguageProvider, ThemeProvider>(
      builder: (context, languageProvider, themeProvider, child) {
        if (_isMobile) {
          final isDark =
              themeProvider.themeMode == ThemeMode.dark ||
              (themeProvider.themeMode == ThemeMode.system &&
                  MediaQuery.platformBrightnessOf(context) == Brightness.dark);
          _updateSystemUIOverlay(isDark);
        }

        return MaterialApp.router(
          title: 'AstroGods',
          locale: languageProvider.currentLocale,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('it')],
          routerConfig: _router,
          builder: (context, child) {
            if (_isDesktop && child != null) {
              return Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    CustomTitleBar(title: 'AstroGods'),
                    Expanded(child: child),
                  ],
                ),
              );
            }
            return child ?? const SizedBox.shrink();
          },
        );
      },
    );
  }
}
