import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import '../models/glossry.dart';
import '../widgets/appbar.dart';

class GlossariesScreen extends StatefulWidget {
  final List<Glossry> glossries;
  const GlossariesScreen({Key? key, required this.glossries}) : super(key: key);

  @override
  State<GlossariesScreen> createState() => _GlossariesScreenState();
}

class _GlossariesScreenState extends State<GlossariesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlashCardsAppBar(showLogo: false, title: "Glossaries"),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Text(
                "Glossries",
                style: GoogleFonts.oswald(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.glossries.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ExpansionTile(
                        key: GlobalKey(),
                        tilePadding: const EdgeInsets.all(15),
                        title: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                widget.glossries[index].title,
                                maxLines: 1,
                                style: GoogleFonts.robotoCondensed(
                                  textStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        children: [
                          ...List<Widget>.generate(
                              widget.glossries[index].questions.length, (i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.glossries[index].questions[i],
                                style: GoogleFonts.robotoCondensed(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 22,
                                )),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
