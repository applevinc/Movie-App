import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabHeaderText extends StatelessWidget {
  const TabHeaderText({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: GoogleFonts.montserrat(
          color: Color(0xffC1C1C6),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
