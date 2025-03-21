import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullResponse = '''
  Conor Anthony McGregor, known as "The Notorious," is an Irish former professional mixed martial artist, entrepreneur, and public figure. Born on July 14, 1988, in Dublin, Ireland, McGregor rose to fame in the Ultimate Fighting Championship (UFC) by becoming the first fighter to hold titles in two weight classes simultaneously: Featherweight and Lightweight[1][3].

### Early Life and Career

McGregor grew up in Crumlin, a working-class suburb of Dublin. He began training in boxing at the age of 12 and later transitioned to mixed martial arts at Straight Blast Gym Ireland under coach John Kavanagh[3]. Initially, he worked as a plumber's apprentice but left to pursue a career in MMA full-time[3].

### Professional Career

- **MMA Career**: McGregor started his professional MMA career in 2008 and joined the UFC in 2013. He won the UFC Featherweight Championship in 2015 and the Lightweight Championship in 2016[1][2].
- **Boxing Career**: In 2017, McGregor transitioned to professional boxing for a highly publicized fight against Floyd Mayweather Jr., which he lost via TKO[1].

### Business Ventures

McGregor has been successful in various business ventures, including co-founding Proper No. Twelve Irish Whiskey, which became one of the fastest-growing whiskey brands[2]. He has also invested in other businesses like TIDL Recovery Spray and The Black Forge Inn in Dublin[2].

Citations:
[1] https://en.wikipedia.org/wiki/Conor_McGregor
[2] https://shop.conormcgregor.com/pages/about-conor
[3] https://www.britannica.com/biography/Conor-McGregor
[4] https://www.imdb.com/name/nm6135552/bio/
[5] https://www.espn.in/mma/fighter/_/id/3022677/conor-mcgregor
[6] https://x.com/thenotoriousmma?lang=en
[7] https://www.imdb.com/name/nm6135552/
[8] https://www.firstpost.com/explainers/who-is-conor-mcgregor-the-controversial-fighter-who-announced-bid-for-irelands-presidency-13873421.html
  ''';
  @override
  void initState() {
    ChatService().contentController.listen((data) {
      if (isLoading) {
        fullResponse = "";
      }
      setState(() {
        fullResponse += data['data'];
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Perplexity',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Skeletonizer(
        effect: ShimmerEffect(
          baseColor: Colors.grey,
          highlightColor: Colors.grey[100]!,
          duration: const Duration(seconds: 1),
        ),
        enabled: isLoading,
        child: Markdown(
          data: fullResponse,
          shrinkWrap: true,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            codeblockDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(10)),
            code: const TextStyle(fontSize: 14),
          ),
        ),
      )
    ]);
  }
}
