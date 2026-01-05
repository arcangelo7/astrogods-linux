import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../utils/snackbar_utils.dart';

class AuthGuard extends StatefulWidget {
  final Widget child;
  final bool showLoginPrompt;
  final String? message;

  const AuthGuard({
    super.key,
    required this.child,
    this.showLoginPrompt = true,
    this.message,
  });

  @override
  State<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends State<AuthGuard> {
  bool _hasRedirected = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        // Always show loading while auth is being determined
        if (authProvider.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // User is authenticated, show the protected content
        if (authProvider.isAuthenticated) {
          return widget.child;
        }

        // User is not authenticated, handle redirect
        if (widget.showLoginPrompt && !_hasRedirected) {
          _hasRedirected = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && !authProvider.isAuthenticated) {
              if (widget.message != null) {
                SnackbarUtils.showError(context, widget.message!);
              }
              context.go('/login');
            }
          });
        }

        // Show loading while redirect is happening
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
