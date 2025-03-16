import 'package:flutter/material.dart';
import 'package:perplexity_clone/widgets/side_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          SideNavbar(),
        ],
      ),
    );
  }
}
