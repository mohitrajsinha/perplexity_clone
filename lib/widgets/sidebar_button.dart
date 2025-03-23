import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';

class SidebarButton extends StatefulWidget {
  final bool isCollapsed;
  final IconData icon;
  final String title;
  const SidebarButton(
      {super.key,
      required this.isCollapsed,
      required this.icon,
      required this.title});

  @override
  State<SidebarButton> createState() => _SidebarButtonState();
}

class _SidebarButtonState extends State<SidebarButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => setState(() {
        _isHovered = true;
      }),
      onExit: (event) => setState(() {
        _isHovered = false;
      }),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: _isHovered ? AppColors.proButton : Colors.transparent),
        child: Row(
          mainAxisAlignment: widget.isCollapsed
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Icon(
                widget.icon,
                color: _isHovered ? AppColors.whiteColor : AppColors.iconGrey,
                size: 20,
              ),
            ),
            Visibility(
              visible: !widget.isCollapsed,
              child: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
