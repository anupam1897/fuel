import 'package:feul/services/feul_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x022B46),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.shortestSide * 0.30,
              width: MediaQuery.of(context).size.shortestSide * 0.60,
              child: SvgPicture.string(
                FeulLogo.white,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              "Feuling your ambition",
              style: GoogleFonts.robotoCondensed(
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
