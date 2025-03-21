import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/answer_section.dart';
import 'package:perplexity_clone/widgets/side_navbar.dart';
import 'package:perplexity_clone/widgets/sources_section.dart';

class ChatPage extends StatelessWidget {
  final String question;
  const ChatPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideNavbar(),
          const SizedBox(
            width: 100,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const SourcesSection(),
                    const SizedBox(
                      height: 24,
                    ),
                    const AnswerSection()
                  ],
                ),
              ),
            ),
          ),
          const Placeholder(strokeWidth: 0, color: AppColors.background)
        ],
      ),
    );
  }
}
