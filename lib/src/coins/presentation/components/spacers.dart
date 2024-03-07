import 'package:flutter/widgets.dart';

class SmallHorizontalSpacer extends StatelessWidget {
  const SmallHorizontalSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 4,
    );
  }
}

class MediumHorizontalSpacer extends StatelessWidget {
  const MediumHorizontalSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 8,
    );
  }
}

class LargeHorizontalSpacer extends StatelessWidget {
  const LargeHorizontalSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}

class ExtraLargeHorizontalSpacer extends StatelessWidget {
  const ExtraLargeHorizontalSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}