import 'dart:async';
import 'dart:io';

class LoopbackServer {
  HttpServer? _server;
  final String title;
  final String message;

  LoopbackServer({
    required this.title,
    required this.message,
  });

  Future<String> start() async {
    _server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    return 'http://localhost:${_server!.port}/callback';
  }

  Future<void> waitForCallback() async {
    if (_server == null) {
      throw StateError('Server not started. Call start() first.');
    }

    final completer = Completer<void>();

    _server!.listen((request) async {
      if (request.uri.path == '/callback') {
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.html
          ..write(_getSuccessPage());
        await request.response.close();

        await _server?.close();
        _server = null;

        if (!completer.isCompleted) {
          completer.complete();
        }
      }
    });

    await completer.future;
  }

  Future<void> close() async {
    await _server?.close();
    _server = null;
  }

  String _getSuccessPage() {
    return '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>AstroGods</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
      color: white;
    }
    .container {
      text-align: center;
      padding: 40px;
    }
    h1 { margin-bottom: 16px; }
    p { opacity: 0.8; }
  </style>
</head>
<body>
  <div class="container">
    <h1>$title</h1>
    <p>$message</p>
  </div>
</body>
</html>
''';
  }
}
