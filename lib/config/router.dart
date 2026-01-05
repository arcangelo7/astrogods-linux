import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../screens/home_screen.dart';
import '../screens/personality_screen.dart';
import '../screens/relationships_screen.dart';
import '../screens/predictions_screen.dart';
import '../screens/codex_screen.dart';
import '../screens/saved_charts_screen.dart';
import '../screens/subscription_plans_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/auth/reset_password_screen.dart';
import '../screens/birth_chart_reading_screen.dart';
import '../screens/birth_chart_reading_wrapper.dart';
import '../screens/birth_chart_preview_screen.dart';
import '../screens/synastry_reading_screen.dart';
import '../screens/synastry_reading_wrapper.dart';
import '../screens/transit_reading_wrapper.dart';
import '../screens/cavern_details_screen.dart';
import '../screens/privacy_policy_screen.dart';
import '../screens/cookie_policy_screen.dart';
import '../screens/terms_and_conditions_screen.dart';
import '../screens/unsubscribe_screen.dart';
import '../screens/about_faq_screen.dart';
import '../screens/release_notes_screen.dart';
import '../widgets/update_required_screen.dart';
import '../models/birth_chart.dart';
import '../models/synastry.dart';
import '../providers/auth_provider.dart';
import '../widgets/main_navigation_wrapper.dart';
import '../widgets/auth_guard.dart';

late GoRouter _appRouter;

GoRouter get appRouter => _appRouter;

class AppRouter {
  static const String home = '/';
  static const String personality = '/personality';
  static const String relationships = '/relationships';
  static const String predictions = '/predictions';
  static const String codex = '/codex';
  static const String savedCharts = '/saved-charts';
  static const String subscriptionPlans = '/subscription-plans';
  static const String settings = '/settings';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String register = '/register';
  static const String privacyPolicy = '/privacy-policy';
  static const String cookiePolicy = '/cookie-policy';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String aboutFaq = '/about-faq';
  static const String releaseNotes = '/release-notes';

  static GoRouter createRouter() {
    _appRouter = GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        final isAuthRoute =
            state.fullPath == '/login' ||
            state.fullPath == '/register' ||
            state.fullPath == '/forgot-password' ||
            state.fullPath?.startsWith('/reset-password') == true;

        final isPublicRoute =
            state.fullPath?.startsWith('/unsubscribe') == true ||
            state.fullPath == '/privacy-policy' ||
            state.fullPath == '/cookie-policy' ||
            state.fullPath == '/terms-and-conditions';

        if (isPublicRoute) {
          return null;
        }

        if (authProvider.isAuthenticated &&
            isAuthRoute &&
            !authProvider.isLoading) {
          return '/';
        }

        return null;
      },
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            String currentPath = state.fullPath ?? '/';
            int selectedIndex = _getNavigationIndex(currentPath);

            return MainNavigationShell(
              selectedIndex: selectedIndex,
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: '/',
              name: 'home',
              builder: (context, state) => HomeScreen(
                onGetStarted: () {
                  context.go('/personality');
                },
              ),
            ),
            GoRoute(
              path: '/personality',
              name: 'personality',
              builder: (context, state) => const PersonalityScreen(),
            ),
            GoRoute(
              path: '/relationships',
              name: 'relationships',
              builder: (context, state) => const AuthGuard(child: RelationshipsScreen()),
            ),
            GoRoute(
              path: '/predictions',
              name: 'predictions',
              builder: (context, state) => const AuthGuard(child: PredictionsScreen()),
            ),
          ],
        ),
        GoRoute(
          path: '/codex',
          name: 'codex',
          builder: (context, state) => const CodexScreen(),
          routes: [
            GoRoute(
              path: '/cavern/:houseNumber',
              name: 'codex-cavern-details',
              builder: (context, state) {
                final houseNumberStr = state.pathParameters['houseNumber'];
                final houseNumber = int.tryParse(houseNumberStr ?? '');
                if (houseNumber == null ||
                    houseNumber < 1 ||
                    houseNumber > 12) {
                  return const CodexScreen();
                }
                final extra = state.extra as Map<String, dynamic>?;
                return CavernDetailsScreen(
                  houseNumber: houseNumber,
                  extra: extra,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/saved-charts',
          name: 'saved-charts',
          builder: (context, state) =>
              const AuthGuard(child: SavedChartsScreen()),
        ),
        GoRoute(
          path: '/subscription-plans',
          name: 'subscription-plans',
          builder: (context, state) => const SubscriptionPlansScreen(),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) {
            final error = state.uri.queryParameters['error'];
            return LoginScreen(error: error);
          },
        ),
        GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: '/forgot-password',
          name: 'forgot-password',
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
        GoRoute(
          path: '/reset-password',
          name: 'reset-password',
          builder: (context, state) {
            final token = state.uri.queryParameters['token'];
            if (token == null || token.isEmpty) {
              return const LoginScreen();
            }
            return ResetPasswordScreen(token: token);
          },
        ),
        GoRoute(
          path: '/birth-chart-reading/:id',
          name: 'birth-chart-reading',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final birthChartId = state.pathParameters['id'];
            final chartOnly = extra?['chartOnly'] as bool? ?? false;

            Map<String, dynamic>? birthChartData;

            if (extra != null) {
              birthChartData = extra['birthChart'] as Map<String, dynamic>?;
            }

            if (birthChartData != null) {
              final birthChart = BirthChart.fromJson(birthChartData);
              return BirthChartReadingScreen(
                birthChart: birthChart,
                chartOnly: chartOnly,
              );
            }

            if (birthChartId != null) {
              return BirthChartReadingWrapper(
                birthChartId: int.tryParse(birthChartId) ?? 0,
                chartOnly: chartOnly,
              );
            }

            return const HomeScreen();
          },
        ),
        GoRoute(
          path: '/birth-chart-preview/:id',
          name: 'birth-chart-preview',
          builder: (context, state) {
            final birthChartData = state.extra as Map<String, dynamic>?;
            if (birthChartData == null) {
              return const HomeScreen();
            }
            final birthChart = BirthChart.fromJson(birthChartData);
            return BirthChartPreviewScreen(birthChart: birthChart);
          },
        ),
        GoRoute(
          path: '/synastry/:id',
          name: 'synastry-reading',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final synastryId = state.pathParameters['id'];
            final chartOnly = extra?['chartOnly'] as bool? ?? false;

            dynamic synastryData;

            if (extra != null) {
              synastryData = extra['synastry'];
            }

            if (synastryData != null) {
              final synastry = synastryData is Synastry
                  ? synastryData
                  : Synastry.fromJson(synastryData);
              return SynastryReadingScreen(
                synastry: synastry,
                chartOnly: chartOnly,
              );
            }

            if (synastryId != null) {
              return SynastryReadingWrapper(
                synastryId: int.tryParse(synastryId) ?? 0,
                chartOnly: chartOnly,
              );
            }

            return const RelationshipsScreen();
          },
        ),
        GoRoute(
          path: '/daily-transit/:id',
          name: 'daily-transit-reading',
          builder: (context, state) {
            final readingId = state.pathParameters['id'];
            final extra = state.extra as Map<String, dynamic>?;
            final chartOnly = extra?['chartOnly'] as bool? ?? false;

            if (readingId != null) {
              return TransitReadingWrapper(
                readingId: int.tryParse(readingId) ?? 0,
                transitType: 'daily',
                chartOnly: chartOnly,
              );
            }

            return const PredictionsScreen();
          },
        ),
        GoRoute(
          path: '/monthly-transit/:id',
          name: 'monthly-transit-reading',
          builder: (context, state) {
            final readingId = state.pathParameters['id'];
            final extra = state.extra as Map<String, dynamic>?;
            final chartOnly = extra?['chartOnly'] as bool? ?? false;

            if (readingId != null) {
              return TransitReadingWrapper(
                readingId: int.tryParse(readingId) ?? 0,
                transitType: 'monthly',
                chartOnly: chartOnly,
              );
            }

            return const PredictionsScreen();
          },
        ),
        GoRoute(
          path: '/cavern-details/:houseNumber',
          name: 'cavern-details',
          builder: (context, state) {
            final houseNumberStr = state.pathParameters['houseNumber'];
            final houseNumber = int.tryParse(houseNumberStr ?? '');
            if (houseNumber == null || houseNumber < 1 || houseNumber > 12) {
              return const HomeScreen();
            }
            final extra = state.extra as Map<String, dynamic>?;
            return CavernDetailsScreen(houseNumber: houseNumber, extra: extra);
          },
        ),
        GoRoute(
          path: '/privacy-policy',
          name: 'privacy-policy',
          builder: (context, state) => const PrivacyPolicyScreen(),
        ),
        GoRoute(
          path: '/cookie-policy',
          name: 'cookie-policy',
          builder: (context, state) => const CookiePolicyScreen(),
        ),
        GoRoute(
          path: '/terms-and-conditions',
          name: 'terms-and-conditions',
          builder: (context, state) => const TermsAndConditionsScreen(),
        ),
        GoRoute(
          path: '/about-faq',
          name: 'about-faq',
          builder: (context, state) => const AboutFaqScreen(),
        ),
        GoRoute(
          path: '/release-notes',
          name: 'release-notes',
          builder: (context, state) => const ReleaseNotesScreen(),
        ),
        GoRoute(
          path: '/unsubscribe/:token',
          name: 'unsubscribe',
          builder: (context, state) {
            final token = state.pathParameters['token'];
            if (token == null) {
              return const HomeScreen();
            }
            return UnsubscribeScreen(token: token);
          },
        ),
        GoRoute(
          path: '/customer-portal-return',
          name: 'customer-portal-return',
          redirect: (context, state) {
            return '/settings';
          },
        ),
        GoRoute(
          path: '/update-required',
          name: 'update-required',
          builder: (context, state) {
            final message = state.extra as String? ?? '';
            return UpdateRequiredScreen(message: message);
          },
        ),
      ],
    );
    return _appRouter;
  }

  static int _getNavigationIndex(String path) {
    switch (path) {
      case '/':
        return 0;
      case '/personality':
        return 1;
      case '/relationships':
        return 2;
      case '/predictions':
        return 3;
      default:
        return 0;
    }
  }
}

class MainNavigationShell extends StatelessWidget {
  final int selectedIndex;
  final Widget child;

  const MainNavigationShell({
    super.key,
    required this.selectedIndex,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MainNavigationWrapper(selectedIndex: selectedIndex, child: child);
  }
}
