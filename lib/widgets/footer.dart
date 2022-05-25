import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashCardsFooter extends StatelessWidget {
  const FlashCardsFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      color: Colors.blue,
      width: double.infinity,
      height: 45,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AutoSizeText("General Data Protection Regulation(GDPR)",
            maxLines: 1,
            style: GoogleFonts.robotoSlab(
              textStyle: GoogleFonts.robotoSlab(
                  textStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            )),
      ),
    );
  }
}
