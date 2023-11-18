import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// This test is to validate the environment variables for firebase options are not null.
void main() {
  test('test firebase options', () async {
    await dotenv.load(fileName: ".env");
    expect(dotenv.env['FIREBASE_ANDROID_API_KEY'], isNotNull);
    expect(dotenv.env['FIREBASE_ANDROID_APP_ID'], isNotNull);
    expect(dotenv.env['FIREBASE_MESSAGING_SENDER_ID'], isNotNull);
    expect(dotenv.env['FIREBASE_PROJECT_ID'], isNotNull);
    expect(dotenv.env['FIREBASE_STORAGE_BUCKET'], isNotNull);
    expect(dotenv.env['FIREBASE_IOS_API_KEY'], isNotNull);
    expect(dotenv.env['FIREBASE_IOS_APP_ID'], isNotNull);
    expect(dotenv.env['FIREBASE_MESSAGING_SENDER_ID'], isNotNull);
    expect(dotenv.env['FIREBASE_PROJECT_ID'], isNotNull);
  });
}
