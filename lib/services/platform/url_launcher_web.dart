import 'package:web/web.dart' as web;

Future<void> launchUrl(String url) async {
  web.window.open(url, '_blank');
}