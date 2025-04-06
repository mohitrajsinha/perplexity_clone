import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  bool isLoading = true;
  List searchResult = [
    {'title': 'ChatGPT', 'url': 'https://chat.openai.com/'},
    {'title': 'Google', 'url': 'https://www.google.com,'},
    {'title': 'Bing', 'url': 'https://www.bing.com'}
  ];
  @override
  void initState() {
    
    ChatService().searchResultController.listen((data) {
      setState(() {
        searchResult = data['data'];
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(children: [
          Icon(
            Icons.source_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Sources',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        ]),
        const SizedBox(
          height: 16,
        ),
        Skeletonizer(
          effect: ShimmerEffect(
            baseColor: Colors.grey,
            highlightColor: Colors.grey[100]!,
            duration: const Duration(seconds: 1),
          ),
          enabled: isLoading,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: searchResult.map((res) {
              return GestureDetector(
                onTap: () async {
                  await launchUrl(
                    Uri.parse(res['url']),
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          res['title'],
                          maxLines: 2,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          res['url'],
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    )),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
