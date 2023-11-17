import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? errorText;
  const AppTextField({
    super.key,
    this.label,
    this.keyboardType,
    this.minLines,
    this.maxLines,
    this.onChanged,
    this.validator,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      minLines: minLines ?? maxLines ?? 1,
      maxLines: maxLines ?? minLines ?? 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(minLines != null || maxLines != null ? 10 : 20)),
        ),
        labelText: minLines == null && maxLines == null ? label : null,
        hintText: minLines != null || maxLines != null ? label : null,
        errorText: errorText,
      ),
    );
  }
}
