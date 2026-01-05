import 'environment.dart';

class ImageUrls {
  static String cavern(String filename) =>
      '${Environment.staticBaseUrl}/static/images/caverns/$filename';

  static String cavernHd(String filename) =>
      '${Environment.staticBaseUrl}/static/images/caverns/${_toHd(filename)}';

  static String cavernPdf(String filename) =>
      '${Environment.staticBaseUrl}/static/images/caverns_pdf/$filename';

  static String division(String filename) =>
      '${Environment.staticBaseUrl}/static/images/divisions/$filename';

  static String divisionHd(String filename) =>
      '${Environment.staticBaseUrl}/static/images/divisions/${_toHd(filename)}';

  static String _toHd(String filename) {
    final lastDot = filename.lastIndexOf('.');
    return '${filename.substring(0, lastDot)}_hd${filename.substring(lastDot)}';
  }
}
