import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../state_mangment/dark_mode_state_manager.dart';

class FlashCardsAppBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      shape: const Border(top: BorderSide(color: Colors.green, width: 3)),
      backgroundColor: Theme.of(context).cardColor,
      centerTitle: false,
      titleSpacing: 0,
      shadowColor: Theme.of(context).shadowColor,
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
                  SizedBox(
                    height: 30,
                    child: Image.asset('assets/images/LogoMaster.png'),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Center(
                  child: AutoSizeText("Accelerated Learning",
                      maxLines: 1,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w300))),
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
                    onSelected: (String value) => value == 'Impressum'
                        ? {}
                        : ref
                            .read(darkModeStateManagerProvider.notifier)
                            .switchDarkMode(),
                    itemBuilder: (BuildContext context) {
                      return {
                        Theme.of(context).brightness == Brightness.light
                            ? 'Dark mode'
                            : 'Light mode',
                        'Impressum'
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
