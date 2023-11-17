import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final bool isLoading;
  const AppButton(
    this.label, {
    super.key,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading ? const CircularProgressIndicator() : Text(label),
      ),
    );
  }
}
