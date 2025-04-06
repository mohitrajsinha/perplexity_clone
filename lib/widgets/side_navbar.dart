import 'package:flutter/material.dart';
import 'package:perplexity_clone/pages/home_page.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/sidebar_button.dart';

class SideNavbar extends StatefulWidget {
  const SideNavbar({super.key});

  @override
  State<SideNavbar> createState() => _SideNavbarState();
}

class _SideNavbarState extends State<SideNavbar> {
  bool _isCollapsed = true;
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: _isCollapsed ? 64 : 180,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(height: 32),
          Image.asset(
            _isCollapsed ? 'assets/icon.png' : 'assets/expanded_icon.png',
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: _isCollapsed
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: _isCollapsed
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 10),
                        child: Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                          size: _isCollapsed ? 30 : 20,
                        ),
                      ),
                      Visibility(
                        visible: !_isCollapsed,
                        child: const Text(
                          'New Thread',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SidebarButton(
                    isCollapsed: _isCollapsed,
                    icon: Icons.search,
                    title: 'Home'),
                SidebarButton(
                    isCollapsed: _isCollapsed,
                    icon: Icons.travel_explore_outlined,
                    title: 'Discover'),
                SidebarButton(
                    isCollapsed: _isCollapsed,
                    icon: Icons.space_dashboard,
                    title: 'Spaces'),
                SidebarButton(
                    isCollapsed: _isCollapsed,
                    icon: Icons.local_library,
                    title: 'Library'),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                  child: MouseRegion(
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
                          color: _isHovered
                              ? AppColors.proButton
                              : Colors.transparent),
                      child: Row(
                        mainAxisAlignment: _isCollapsed
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            margin: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: Icon(
                              _isCollapsed
                                  ? Icons.arrow_forward_ios
                                  : Icons.arrow_back_ios,
                              color: Colors.white,
                              size: _isCollapsed ? 30 : 20,
                            ),
                          ),
                          Visibility(
                            visible: !_isCollapsed,
                            child: const Text(
                              'Collapse',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  indent: 16,
                  endIndent: 16,
                  thickness: 1,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    mainAxisAlignment: _isCollapsed
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        margin: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.white,
                          size: _isCollapsed ? 30 : 20,
                        ),
                      ),
                      Visibility(
                        visible: !_isCollapsed,
                        child: const Text(
                          'Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
