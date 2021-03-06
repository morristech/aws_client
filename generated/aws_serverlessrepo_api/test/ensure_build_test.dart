import 'package:aws_serverlessrepo_api/serverlessrepo-2017-09-08.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_serverlessrepo_api'));

  t.test('ensure_compilation', () {
    ServerlessApplicationRepository(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
