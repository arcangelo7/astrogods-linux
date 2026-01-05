import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../constants/text_styles.dart';
import '../providers/auth_provider.dart';
import '../utils/snackbar_utils.dart';

class MainNavigationWrapper extends StatelessWidget {
  final int selectedIndex;
  final Widget child;

  const MainNavigationWrapper({
    super.key,
    required this.selectedIndex,
    required this.child,
  });

  List<NavigationDestination> _getBottomDestinations(BuildContext context) => [
    NavigationDestination(
      icon: const Icon(Icons.home_outlined),
      selectedIcon: const Icon(Icons.home),
      label: AppLocalizations.of(context)!.homeTitle,
    ),
    NavigationDestination(
      icon: const Icon(Icons.person_outline),
      selectedIcon: const Icon(Icons.person),
      label: AppLocalizations.of(context)!.personalityTitle,
    ),
    NavigationDestination(
      icon: const Icon(Icons.favorite_outline),
      selectedIcon: const Icon(Icons.favorite),
      label: AppLocalizations.of(context)!.relationshipsTitle,
    ),
    NavigationDestination(
      icon: const Icon(Icons.schedule_outlined),
      selectedIcon: const Icon(Icons.schedule),
      label: AppLocalizations.of(context)!.predictionsTitle,
    ),
  ];

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/personality');
        break;
      case 2:
        context.go('/relationships');
        break;
      case 3:
        context.go('/predictions');
        break;
    }
  }

  String _getScreenTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (selectedIndex) {
      case 0:
        return l10n.appTitle;
      case 1:
        return l10n.personalityTitle;
      case 2:
        return l10n.relationshipsTitle;
      case 3:
        return l10n.predictionsTitle;
      default:
        return l10n.appTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          _getScreenTitle(context),
          style: TextStyle(
            color: selectedIndex == 0
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).appBarTheme.titleTextStyle?.color,
          ),
        ),
        foregroundColor: selectedIndex == 0
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).appBarTheme.foregroundColor,
        iconTheme: IconThemeData(
          color: selectedIndex == 0
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).appBarTheme.iconTheme?.color,
        ),
      ),
      drawer: Drawer(
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/images/logos/astrogods_logo.svg',
                            width: 64,
                            height: 64,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            AppLocalizations.of(context)!.appTitle,
                            style: AppTextStyles.drawerHeaderStyle,
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.book_outlined),
                      title: Text(AppLocalizations.of(context)!.codexTitle),
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/codex');
                      },
                    ),
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        if (authProvider.isAuthenticated) {
                          return ListTile(
                            leading: const Icon(Icons.bookmark_outline),
                            title: Text(
                              AppLocalizations.of(context)!.savedChartsTitle,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              context.push('/saved-charts');
                            },
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.payment_outlined),
                      title: Text(AppLocalizations.of(context)!.viewPlans),
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/subscription-plans');
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.settings_outlined),
                      title: Text(AppLocalizations.of(context)!.settingsTitle),
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/settings');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.groups_outlined),
                      title: Text(AppLocalizations.of(context)!.aboutAndFaq),
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/about-faq');
                      },
                    ),
                    const Divider(),
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        if (authProvider.isAuthenticated) {
                          return Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.person_outlined),
                                title: Text(
                                  AppLocalizations.of(context)!.profile,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  context.push('/profile');
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.logout_outlined),
                                title: Text(
                                  AppLocalizations.of(context)!.logout,
                                ),
                                onTap: () async {
                                  Navigator.pop(context);
                                  await authProvider.logout();
                                  if (context.mounted) {
                                    SnackbarUtils.showSuccess(
                                      context,
                                      AppLocalizations.of(
                                        context,
                                      )!.logoutSuccessful,
                                    );
                                  }
                                },
                              ),
                            ],
                          );
                        } else {
                          return ListTile(
                            leading: const Icon(Icons.login_outlined),
                            title: Text(AppLocalizations.of(context)!.login),
                            onTap: () {
                              Navigator.pop(context);
                              context.go('/login');
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.transparent
            : null,
        onDestinationSelected: (index) {
          _onDestinationSelected(context, index);
        },
        destinations: _getBottomDestinations(context),
      ),
    );
  }
}