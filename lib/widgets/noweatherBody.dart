import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/text.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(text: 'there is no weather 😔 start'),
          CustomText(text: 'searching now 🔍'),
        ],
      ),
    );
  }
}