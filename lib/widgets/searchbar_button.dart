import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';

class SearchbarButton extends StatefulWidget {
  final IconData icon;
  final String text;
  const SearchbarButton({super.key, required this.icon, required this.text});

  @override
  State<SearchbarButton> createState() => _SearchbarButtonState();
}

class _SearchbarButtonState extends State<SearchbarButton> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        _isHovered = true;
      }),
      onExit: (event) => setState(() {
        _isHovered = false;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: _isHovered ? AppColors.proButton : Colors.transparent),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: AppColors.iconGrey,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              widget.text,
              style: const TextStyle(color: AppColors.textGrey),
            )
          ],
        ),
      ),
    );
  }
}
