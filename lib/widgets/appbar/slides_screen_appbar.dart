import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/main_screen.dart';
import '../../state_mangment/dark_mode_state_manager.dart';
import 'appbar.dart';

class SlidesScreenAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final int page;
  final int listLength;
  const SlidesScreenAppbar({
    Key? key,
    this.page = 0,
    this.listLength = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlashCardsAppBar(childern: [
      Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
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
        child: Row(
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
                    color: Theme.of(context).primaryColor.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
      IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () => {},
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
                      ? {}
                      : ref
                          .read(darkModeStateManagerProvider.notifier)
                          .switchDarkMode(),
              itemBuilder: (BuildContext context) {
                return {
                  Theme.of(context).brightness == Brightness.light
                      ? 'Dark mode'
                      : 'Light mode',
                  'FlashDecks',
                  'Impressum',
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
    ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
