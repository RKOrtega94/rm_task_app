import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDatePicker extends StatefulWidget {
  final String label;
  final Function(DateTime?)? onChanged;
  final String? Function(String?)? validator;
  const AppDatePicker({
    super.key,
    this.label = 'Fecha',
    this.onChanged,
    this.validator,
  });

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  late DateTime? _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(
        text: _date != null
            ? DateFormat.yMMMMEEEEd().format(_date ?? DateTime.now())
            : '',
      ),
      validator: widget.validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        labelText: widget.label,
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      onTap: () async {
        _date = await showDatePicker(
          context: context,
          initialDate: _date ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        setState(() {});
        widget.onChanged?.call(_date);
      },
    );
  }
}
