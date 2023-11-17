import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const AppButton(
    this.label, {
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}
