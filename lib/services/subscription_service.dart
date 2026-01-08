import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/subscription.dart';
import 'api_client.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../l10n/app_localizations.dart';
import 'loopback_server.dart';

class SubscriptionService {
  final ApiClient _apiClient;
  final BuildContext? _context;

  SubscriptionService({BuildContext? context})
      : _apiClient = ApiClient(context: context),
        _context = context;

  Future<SubscriptionStatusResponse> getSubscriptionStatus() async {
    try {
      final response = await _apiClient.getSubscriptionStatus();
      return SubscriptionStatusResponse.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch subscription status: ${e.toString()}');
    }
  }

  Future<void> openCustomerPortal({String? priceId}) async {
    try {
      final isDesktop = !kIsWeb &&
          (defaultTargetPlatform == TargetPlatform.linux ||
              defaultTargetPlatform == TargetPlatform.windows ||
              defaultTargetPlatform == TargetPlatform.macOS);

      String? returnUrl;
      LoopbackServer? server;

      if (isDesktop && _context != null) {
        final l10n = AppLocalizations.of(_context)!;
        server = LoopbackServer(
          title: l10n.portalReturnTitle,
          message: l10n.portalReturnMessage,
        );
        returnUrl = await server.start();
      }

      final response = await _apiClient.createPortalSession(
        priceId: priceId,
        returnUrl: returnUrl,
      );
      final url = response['url'] as String?;

      if (url == null || url.isEmpty) {
        await server?.close();
        throw Exception('No portal URL received');
      }

      if (kIsWeb) {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw Exception('Cannot open URL');
        }
      } else if (isDesktop) {
        await _openInBrowserWithLoopback(url, server!);
      } else {
        final context = _context;
        if (context == null || !context.mounted) {
          throw Exception('Context not available');
        }
        await _openInAppWebView(url, context);
      }
    } catch (e) {
      throw Exception('Failed to open customer portal: ${e.toString()}');
    }
  }

  Future<void> _openInBrowserWithLoopback(
    String url,
    LoopbackServer server,
  ) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      await server.close();
      throw Exception('Cannot open URL');
    }

    await server.waitForCallback();
  }

  Future<void> _openInAppWebView(String url, BuildContext context) async {
    if (!context.mounted) return;

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _CustomerPortalWebView(url: url),
        fullscreenDialog: true,
      ),
    );
  }
}

class _CustomerPortalWebView extends StatefulWidget {
  final String url;

  const _CustomerPortalWebView({required this.url});

  @override
  State<_CustomerPortalWebView> createState() => _CustomerPortalWebViewState();
}

class _CustomerPortalWebViewState extends State<_CustomerPortalWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            if (url.contains('/customer-portal-return')) {
              if (mounted) {
                Navigator.of(context).pop();
              }
            }
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.manageSubscription),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}