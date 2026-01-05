import 'package:url_launcher/url_launcher.dart' as launcher;

Future<void> launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  final launched = await launcher.launchUrl(uri, mode: launcher.LaunchMode.externalApplication);
  if (!launched) {
    throw Exception('Could not launch $url');
  }
}