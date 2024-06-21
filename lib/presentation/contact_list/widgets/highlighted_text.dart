import "package:flutter/material.dart";

class HighlightedText extends StatefulWidget {
  const HighlightedText({
    required this.text,
    required this.highlightText,
    super.key,
  });
  final String text;
  final String highlightText;

  @override
  State<HighlightedText> createState() => _HighlightedTextState();
}

class _HighlightedTextState extends State<HighlightedText> {
  String? t1;
  String? t2;
  String? t3;

  @override
  Widget build(final BuildContext context) => RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge,
          children: <InlineSpan>[
            if (t1 != null) TextSpan(text: t1),
            if (t2 != null)
              TextSpan(
                text: t2,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            if (t3 != null) TextSpan(text: t3),
          ],
        ),
      );

  void _generateHighlightText() {
    final String textLower = widget.text.toLowerCase();
    final String highlightTextLower = widget.highlightText.toLowerCase();
    if (!textLower.contains(highlightTextLower)) {
      t1 = widget.text;
      return;
    }
    final int highlightTextIndex = textLower.indexOf(highlightTextLower);
    final int highlightTextRange =
        highlightTextIndex + widget.highlightText.length;
    t1 = widget.text.substring(0, highlightTextIndex);
    t2 = widget.text.substring(highlightTextIndex, highlightTextRange);
    t3 = widget.text.substring(highlightTextRange);
  }

  @override
  void initState() {
    super.initState();
    super.didChangeDependencies();
    _generateHighlightText();
  }

  @override
  void didUpdateWidget(covariant final HighlightedText oldWidget) {
    super.didUpdateWidget(oldWidget);
    super.didChangeDependencies();
    _generateHighlightText();
  }
}
