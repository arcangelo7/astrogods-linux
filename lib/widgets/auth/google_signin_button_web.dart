import 'package:flutter/material.dart';
import 'package:google_sign_in_web/web_only.dart' as web;

class GoogleSignInButtonWeb extends StatelessWidget {
  const GoogleSignInButtonWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: web.renderButton(),
    );
  }
}
