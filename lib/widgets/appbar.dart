import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/glossry.dart';
import '../screens/glossries_screen.dart';
import '../screens/impressum.dart';
import '../screens/main_screen.dart';
import '../state_mangment/dark_mode_state_manager.dart';

class FlashCardsAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final bool showLogo;
  final String title;
  final int page;
  final int listLength;
  final List<Glossry> glossries;
  const FlashCardsAppBar({
    Key? key,
    this.showLogo = true,
    this.glossries = const [],
    this.title = "",
    this.page = 0,
    this.listLength = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      shape: const Border(top: BorderSide(color: Colors.green, width: 3)),
      backgroundColor: Theme.of(context).cardColor,
      centerTitle: false,
      titleSpacing: 0,
      shadowColor: Theme.of(context).shadowColor,
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor, //change your color here
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (showLogo)
                    InkWell(
                      onTap: () => title.isNotEmpty
                          ? null
                          : Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()),
                            ),
                      child: SizedBox(
                        height: 30,
                        child: Image.asset('assets/images/LogoMaster.png'),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: title.isNotEmpty
                  ? AutoSizeText(
                      title,
                      style: GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          '${page + 1}',
                          style: GoogleFonts.robotoCondensed(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '/',
                          style: GoogleFonts.robotoCondensed(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '$listLength',
                          style: GoogleFonts.robotoCondensed(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.6)),
                          ),
                        ),
                      ],
                    ),
            ),
            if (title.isEmpty)
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              GlossariesScreen(glossries: glossries),
                        ),
                      ),
                  icon: Icon(
                    Icons.collections_bookmark,
                    color: Theme.of(context).primaryColor,
                  )),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton<String>(
                    child: Icon(
                      Icons.more_vert,
                      color: Theme.of(context).primaryColor,
                    ),
                    onSelected: (String value) => value == 'FlashDecks'
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                          )
                        : value == 'Impressum'
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ImpressumScreen()),
                              )
                            : ref
                                .read(darkModeStateManagerProvider.notifier)
                                .switchDarkMode(),
                    itemBuilder: (BuildContext context) {
                      return {
                        Theme.of(context).brightness == Brightness.light
                            ? 'Dark mode'
                            : 'Light mode',
                        if (title.isEmpty) 'FlashDecks',
                        if (title != "Impressum") 'Impressum',
                      }.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
