import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressLoader extends StatelessWidget {
  const ProgressLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitWave(
      color: Colors.green,
      size: 40.0,
    );
  }
}
