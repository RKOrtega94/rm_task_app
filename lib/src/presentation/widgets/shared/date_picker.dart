import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDatePicker extends StatelessWidget {
  final String label;
  final Function(DateTime?)? onChanged;
  final String? Function(String?)? validator;
  final DateTime? initialDate;
  const AppDatePicker({
    super.key,
    this.label = 'Fecha',
    this.onChanged,
    this.validator,
    this.initialDate,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, state) {
      DateTime? date = initialDate;
      return TextFormField(
        readOnly: true,
        controller: TextEditingController(
          text: date == null ? '' : DateFormat.yMMMMEEEEd().format(date),
        ),
        validator: validator,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: label,
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        onTap: () async {
          date = await showDatePicker(
            context: context,
            initialDate: date ?? DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)),
          );
          onChanged?.call(date);
          state(() {});
        },
      );
    });
  }
}
