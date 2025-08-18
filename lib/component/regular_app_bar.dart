import 'package:flutter/material.dart';

class RegularAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RegularAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Navigator.canPop(context)
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.chevron_left_rounded),
            )
          : null,
      title: Text('Back'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
