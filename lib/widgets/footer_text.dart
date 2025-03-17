import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';

class FooterText extends StatelessWidget {
  final String txt;
  const FooterText({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        txt,
        style: TextStyle(fontSize: 14, color: AppColors.footerGrey),
      ),
    );
  }
}
