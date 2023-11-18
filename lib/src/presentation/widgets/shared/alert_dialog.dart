import 'package:flutter/cupertino.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final void Function()? confirm;
  const AppAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.confirm,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          onPressed: () => {
            confirm!(),
            Navigator.of(context).pop(),
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
