import 'package:flutter/material.dart';

import '../Core/constants/textStyles.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {

  final String text;

  const CustomAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: (){

          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      title: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyles.bold19,
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
