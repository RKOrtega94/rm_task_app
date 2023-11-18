import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final bool isLoading;
  final ButtonStyle? style;
  const AppButton(
    this.label, {
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(style: style),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          child: isLoading ? const CircularProgressIndicator() : Text(label),
        ),
      ),
    );
  }
}
