// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'workmailmessageflow-2019-05-01.g.dart';

/// The WorkMail Message Flow API provides access to email messages as they are
/// being sent and received by a WorkMail organization.
class WorkMailMessageFlow {
  final _s.RestJsonProtocol _protocol;
  WorkMailMessageFlow({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'workmailmessageflow',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Retrieves the raw content of an in-transit email message, in MIME format.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [messageId] :
  /// The identifier of the email message to retrieve.
  Future<GetRawMessageContentResponse> getRawMessageContent({
    @_s.required String messageId,
  }) async {
    ArgumentError.checkNotNull(messageId, 'messageId');
    _s.validateStringLength(
      'messageId',
      messageId,
      1,
      120,
      isRequired: true,
    );
    _s.validateStringPattern(
      'messageId',
      messageId,
      r'''[a-z0-9\-]*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/messages/${Uri.encodeComponent(messageId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRawMessageContentResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRawMessageContentResponse {
  /// The raw content of the email message, in MIME format.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'messageContent')
  final Uint8List messageContent;

  GetRawMessageContentResponse({
    @_s.required this.messageContent,
  });
  factory GetRawMessageContentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRawMessageContentResponseFromJson(json);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
