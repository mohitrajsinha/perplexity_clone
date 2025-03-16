import 'package:flutter/material.dart';

class SidebarButton extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String title;
  const SidebarButton(
      {super.key,
      required this.isCollapsed,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        Visibility(
          visible: !isCollapsed,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
