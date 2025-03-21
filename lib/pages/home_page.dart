import 'package:flutter/material.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/footer_text.dart';
import 'package:perplexity_clone/widgets/search_section.dart';
import 'package:perplexity_clone/widgets/side_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ChatService().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideNavbar(),
          Expanded(
            child: Column(children: [
              const Expanded(child: SearchSection()),
              Container(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    FooterText(
                      txt: 'Pro',
                    ),
                    FooterText(
                      txt: 'Enterprise',
                    ),
                    FooterText(
                      txt: 'Api',
                    ),
                    FooterText(
                      txt: 'Blog',
                    ),
                    FooterText(
                      txt: 'Careers',
                    ),
                    FooterText(
                      txt: 'Store',
                    ),
                    FooterText(
                      txt: 'Finance',
                    ),
                    FooterText(
                      txt: 'English',
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
