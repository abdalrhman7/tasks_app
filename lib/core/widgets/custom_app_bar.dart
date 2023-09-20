import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/text_style.dart';

// AppBar buildCustomAppBar({required List<Widget> widgets}) {
//   return
// }

class BuildCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildCustomAppBar({super.key, required this.widgets});
  final List<Widget> widgets;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Today'),
          Text(
            '10/10/2022',
            style: Style.textStyle10.copyWith(color: kTextColor),
          ),
        ],
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
