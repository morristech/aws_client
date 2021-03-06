import 'package:aws_pinpoint_sms_voice_api/pinpoint-sms-voice-2018-09-05.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_pinpoint_sms_voice_api'));

  t.test('ensure_compilation', () {
    PinpointSMSVoice(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
