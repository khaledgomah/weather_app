import 'package:flutter/material.dart';

class NoWeatherWidget extends StatelessWidget {
  const NoWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          'There is no wheather 😥 start searching now 🔍',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
