import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../state_mangment/dark_mode_state_manager.dart';
import 'appbar.dart';

class SecondryScreensAppbar extends ConsumerWidget
    implements PreferredSizeWidget {
  final String title;

  const SecondryScreensAppbar({
    Key? key,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlashCardsAppBar(childern: [
      const Spacer(),
      Expanded(
          flex: 2,
          child: AutoSizeText(
            title,
            style: GoogleFonts.robotoCondensed(
              textStyle: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300),
            ),
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
              onSelected: (String value) => ref
                  .read(darkModeStateManagerProvider.notifier)
                  .switchDarkMode(),
              itemBuilder: (BuildContext context) {
                return {
                  Theme.of(context).brightness == Brightness.light
                      ? 'Dark mode'
                      : 'Light mode',
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
