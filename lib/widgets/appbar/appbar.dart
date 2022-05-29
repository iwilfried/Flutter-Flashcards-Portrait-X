import 'package:flutter/material.dart';

class FlashCardsAppBar extends StatelessWidget {
  final List<Widget> childern;
  const FlashCardsAppBar({
    Key? key,
    this.childern = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: this.childern,
        ),
      ),
    );
  }
}
