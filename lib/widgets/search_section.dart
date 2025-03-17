import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/searchbar_button.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'What do you want to know?',
          style: GoogleFonts.ibmPlexMono(
              fontSize: 40, fontWeight: FontWeight.w400, letterSpacing: -0.5),
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          width: 700,
          decoration: BoxDecoration(
              color: AppColors.searchBar,
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: AppColors.searchBarBorder, width: 1.75)),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Ask anything...',
                      hintStyle:
                          TextStyle(color: AppColors.textGrey, fontSize: 16),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const SearchbarButton(
                      icon: Icons.auto_awesome_outlined,
                      text: 'Focus',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const SearchbarButton(
                      icon: Icons.add_circle_outlined,
                      text: 'Attach',
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          color: AppColors.submitButton,
                          borderRadius: BorderRadius.circular(40)),
                      child: const Icon(
                        Icons.arrow_forward_outlined,
                        color: AppColors.background,
                        size: 16,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
