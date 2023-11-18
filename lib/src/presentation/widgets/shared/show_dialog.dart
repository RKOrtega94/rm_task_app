import 'package:flutter/material.dart';
import 'package:rm_task_app/src/presentation/widgets/shared/_shared.dart';

appShowDialog(
  BuildContext context, {
  required String title,
  required String content,
  void Function()? confirm,
}) =>
    showDialog(
      context: context,
      builder: (context) => AppAlertDialog(
        title: title,
        content: content,
        confirm: confirm,
      ),
    );
