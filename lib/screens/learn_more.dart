import 'package:flash_cards_portrait_app/widgets/appbar.dart';
import 'package:flash_cards_portrait_app/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';

class LearnMore extends StatelessWidget {
  final String text;
  final String categoryName;
  final Map<String, StyledTextTagBase> tags;
  const LearnMore(
      {Key? key,
      required this.text,
      required this.tags,
      required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FlashCardsAppBar(title: "Learn more...", showLogo: false),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: StyledText(
                      text: text,
                      style: GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                          height: 1.7,
                        ),
                      ),
                      tags: tags,
                    )),
              ),
            ),
            FlashCardsFooter(title: categoryName)
          ],
        ));
  }
}
