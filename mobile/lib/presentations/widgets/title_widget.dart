import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'Wuthering Waves',
              style: textTheme.titleLarge
          ),
          TextSpan(
            text: ' $text',
            style: textTheme.titleLarge!.copyWith(
                color: Colors.yellowAccent
            ),
          ),
        ],
      ),
    );
  }
}
