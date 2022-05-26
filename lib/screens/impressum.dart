import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appbar.dart';

class ImpressumScreen extends StatelessWidget {
  const ImpressumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FlashCardsAppBar(
          title: "Impressum",
          showLogo: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: AutoSizeText(
                    "Achtung: Dieses Impressum ist Diction& Es handelt sich bei dieser App urn eine DEMO Version. ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                        height: 1.7,
                      ),
                    ))),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: AutoSizeText(
                    "Rechtsanwalte Brell \nHammer Strasse 89 \n48153 Munster",
                    style: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        height: 1.7,
                      ),
                    ))),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: AutoSizeText(
                    "Tel +49 (0) 251 322 65 44 0 \nFax: +49 (0) 251 322 65 44 99 \nMail: in(o@dimento.com ",
                    style: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        height: 1.7,
                      ),
                    ))),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: AutoSizeText(
                    "Llmsatzeteueeldentifikationenummer nach \n§27a Urnsatzetenergesetz: \nDE123456789 ",
                    style: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        height: 1.7,
                      ),
                    ))),
          ],
        ));
  }
}
