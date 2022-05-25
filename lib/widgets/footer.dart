import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashCardsFooter extends StatelessWidget {
  final String title;
  final String tail;
  const FlashCardsFooter({Key? key, required this.title, this.tail = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.blue,
      width: double.infinity,
      height: 45,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        AutoSizeText(title,
            style: GoogleFonts.robotoSlab(
              textStyle: GoogleFonts.robotoSlab(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            )),
        const Spacer(),
        if (tail.isNotEmpty)
          AutoSizeText(tail,
              style: GoogleFonts.robotoSlab(
                textStyle: GoogleFonts.robotoSlab(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              )),
      ]),
    );
  }
}
