import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rm_task_app/src/presentation/widgets/shared/_shared.dart';

void main() {
  testWidgets('AppTextFieldWidget test', (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: AppTextField(
        label: 'Label value',
        initialValue: 'Initial value',
        keyboardType: TextInputType.text,
        minLines: 1,
        maxLines: 1,
        onChanged: (value) {},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    )));

    // Check if widget is rendered correctly
    expect(find.byType(AppTextField), findsOneWidget);

    // Check if initial value is set correctly
    expect(find.text('Initial value'), findsOneWidget);

    // Check if label is set correctly
    expect(find.text('Label value'), findsOneWidget);

    // Check if value updates correctly
    await widgetTester.enterText(find.byType(TextFormField), 'New value');
    expect(find.text('New value'), findsOneWidget);
  });
}
