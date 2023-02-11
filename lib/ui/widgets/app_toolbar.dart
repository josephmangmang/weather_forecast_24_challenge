import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';

class AppToolbar extends StatelessWidget {
  const AppToolbar({
    super.key,
    this.title = '',
    this.leading,
    this.trailing,
  });

  final String title;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                leading ??
                    const Icon(
                      Icons.cloud,
                      size: 48,
                    ),
                horizontalSpaceMedium,
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                trailing ?? const SizedBox.shrink()
              ],
            ),
          ),
          const Divider(
            height: 5,
            thickness: 2,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
