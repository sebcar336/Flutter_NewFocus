import 'package:flutter/material.dart';
import 'package:new_focus_/styles/palleta.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 18),
          children: [
            StylizedText(
              firstPart: '  New ',
              secondPart: 'Focus',
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
          padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 25),
        ),
      ],
      centerTitle: true,
    );
  }
}

class StylizedText extends TextSpan {
  StylizedText({
    required String firstPart,
    required String secondPart,
    Key? key,
  }) : super(
          children: [
            TextSpan(
              text: firstPart,
              style: const TextStyle(
                color: Pallete.appBarNew,
                shadows: [
                  Shadow(
                    color: Pallete.appBarNewShadow,
                    blurRadius: 15,
                  ),
                ],
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: secondPart,
              style: const TextStyle(
                color: Pallete.appBarFocus,
                shadows: [
                  Shadow(
                    color: Pallete.appBarFocusShadow,
                    blurRadius: 15,
                  ),
                ],
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        );
}
