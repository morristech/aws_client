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

part 'backup-2018-11-15.g.dart';

/// AWS Backup is a unified backup service designed to protect AWS services and
/// their associated data. AWS Backup simplifies the creation, migration,
/// restoration, and deletion of backups, while also providing reporting and
/// auditing.
class Backup {
  final _s.RestJsonProtocol _protocol;
  Backup({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'backup',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Backup plans are documents that contain information that AWS Backup uses
  /// to schedule tasks that create recovery points of resources.
  ///
  /// If you call <code>CreateBackupPlan</code> with a plan that already exists,
  /// an <code>AlreadyExistsException</code> is returned.
  ///
  /// May throw [LimitExceededException].
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlan] :
  /// Specifies the body of a backup plan. Includes a
  /// <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.
  ///
  /// Parameter [backupPlanTags] :
  /// To help organize your resources, you can assign your own metadata to the
  /// resources that you create. Each tag is a key-value pair. The specified
  /// tags are assigned to all backups created with this plan.
  ///
  /// Parameter [creatorRequestId] :
  /// Identifies the request and allows failed requests to be retried without
  /// the risk of executing the operation twice. If the request includes a
  /// <code>CreatorRequestId</code> that matches an existing backup plan, that
  /// plan is returned. This parameter is optional.
  Future<CreateBackupPlanOutput> createBackupPlan({
    @_s.required BackupPlanInput backupPlan,
    Map<String, String> backupPlanTags,
    String creatorRequestId,
  }) async {
    ArgumentError.checkNotNull(backupPlan, 'backupPlan');
    final $payload = <String, dynamic>{
      'BackupPlan': backupPlan,
      'BackupPlanTags': backupPlanTags,
      'CreatorRequestId': creatorRequestId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/backup/plans/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackupPlanOutput.fromJson(response);
  }

  /// Creates a JSON document that specifies a set of resources to assign to a
  /// backup plan. Resources can be included by specifying patterns for a
  /// <code>ListOfTags</code> and selected <code>Resources</code>.
  ///
  /// For example, consider the following patterns:
  ///
  /// <ul>
  /// <li>
  /// <code>Resources: "arn:aws:ec2:region:account-id:volume/volume-id"</code>
  /// </li>
  /// <li>
  /// <code>ConditionKey:"department"</code>
  ///
  /// <code>ConditionValue:"finance"</code>
  ///
  /// <code>ConditionType:"STRINGEQUALS"</code>
  /// </li>
  /// <li>
  /// <code>ConditionKey:"importance"</code>
  ///
  /// <code>ConditionValue:"critical"</code>
  ///
  /// <code>ConditionType:"STRINGEQUALS"</code>
  /// </li>
  /// </ul>
  /// Using these patterns would back up all Amazon Elastic Block Store (Amazon
  /// EBS) volumes that are tagged as <code>"department=finance"</code>,
  /// <code>"importance=critical"</code>, in addition to an EBS volume with the
  /// specified volume Id.
  ///
  /// Resources and conditions are additive in that all resources that match the
  /// pattern are selected. This shouldn't be confused with a logical AND, where
  /// all conditions must match. The matching patterns are logically 'put
  /// together using the OR operator. In other words, all patterns that match
  /// are selected for backup.
  ///
  /// May throw [LimitExceededException].
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies the backup plan to be associated with the selection of
  /// resources.
  ///
  /// Parameter [backupSelection] :
  /// Specifies the body of a request to assign a set of resources to a backup
  /// plan.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of executing the operation twice.
  Future<CreateBackupSelectionOutput> createBackupSelection({
    @_s.required String backupPlanId,
    @_s.required BackupSelection backupSelection,
    String creatorRequestId,
  }) async {
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    ArgumentError.checkNotNull(backupSelection, 'backupSelection');
    final $payload = <String, dynamic>{
      'BackupSelection': backupSelection,
      'CreatorRequestId': creatorRequestId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId.toString())}/selections/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackupSelectionOutput.fromJson(response);
  }

  /// Creates a logical container where backups are stored. A
  /// <code>CreateBackupVault</code> request includes a name, optionally one or
  /// more resource tags, an encryption key, and a request ID.
  /// <note>
  /// Sensitive data, such as passport numbers, should not be included the name
  /// of a backup vault.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  /// May throw [AlreadyExistsException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [backupVaultTags] :
  /// Metadata that you can assign to help organize the resources that you
  /// create. Each tag is a key-value pair.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of executing the operation twice.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  Future<CreateBackupVaultOutput> createBackupVault({
    @_s.required String backupVaultName,
    Map<String, String> backupVaultTags,
    String creatorRequestId,
    String encryptionKeyArn,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'BackupVaultTags': backupVaultTags,
      'CreatorRequestId': creatorRequestId,
      'EncryptionKeyArn': encryptionKeyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackupVaultOutput.fromJson(response);
  }

  /// Deletes a backup plan. A backup plan can only be deleted after all
  /// associated selections of resources have been deleted. Deleting a backup
  /// plan deletes the current version of a backup plan. Previous versions, if
  /// any, will still exist.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  Future<DeleteBackupPlanOutput> deleteBackupPlan({
    @_s.required String backupPlanId,
  }) async {
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBackupPlanOutput.fromJson(response);
  }

  /// Deletes the resource selection associated with a backup plan that is
  /// specified by the <code>SelectionId</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  ///
  /// Parameter [selectionId] :
  /// Uniquely identifies the body of a request to assign a set of resources to
  /// a backup plan.
  Future<void> deleteBackupSelection({
    @_s.required String backupPlanId,
    @_s.required String selectionId,
  }) async {
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    ArgumentError.checkNotNull(selectionId, 'selectionId');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId.toString())}/selections/${Uri.encodeComponent(selectionId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the backup vault identified by its name. A vault can be deleted
  /// only if it is empty.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and theAWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  Future<void> deleteBackupVault({
    @_s.required String backupVaultName,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the policy document that manages permissions on a backup vault.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  Future<void> deleteBackupVaultAccessPolicy({
    @_s.required String backupVaultName,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}/access-policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes event notifications for the specified backup vault.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  Future<void> deleteBackupVaultNotifications({
    @_s.required String backupVaultName,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}/notification-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the recovery point specified by a recovery point ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  Future<void> deleteRecoveryPoint({
    @_s.required String backupVaultName,
    @_s.required String recoveryPointArn,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}/recovery-points/${Uri.encodeComponent(recoveryPointArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns metadata associated with creating a backup of a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [DependencyFailureException].
  ///
  /// Parameter [backupJobId] :
  /// Uniquely identifies a request to AWS Backup to back up a resource.
  Future<DescribeBackupJobOutput> describeBackupJob({
    @_s.required String backupJobId,
  }) async {
    ArgumentError.checkNotNull(backupJobId, 'backupJobId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup-jobs/${Uri.encodeComponent(backupJobId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBackupJobOutput.fromJson(response);
  }

  /// Returns metadata about a backup vault specified by its name.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  Future<DescribeBackupVaultOutput> describeBackupVault({
    @_s.required String backupVaultName,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBackupVaultOutput.fromJson(response);
  }

  /// Returns metadata associated with creating a copy of a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [copyJobId] :
  /// Uniquely identifies a request to AWS Backup to copy a resource.
  Future<DescribeCopyJobOutput> describeCopyJob({
    @_s.required String copyJobId,
  }) async {
    ArgumentError.checkNotNull(copyJobId, 'copyJobId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/copy-jobs/${Uri.encodeComponent(copyJobId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCopyJobOutput.fromJson(response);
  }

  /// Returns information about a saved resource, including the last time it was
  /// backed-up, its Amazon Resource Name (ARN), and the AWS service type of the
  /// saved resource.
  ///
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  Future<DescribeProtectedResourceOutput> describeProtectedResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resources/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProtectedResourceOutput.fromJson(response);
  }

  /// Returns metadata associated with a recovery point, including ID, status,
  /// encryption, and lifecycle.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  Future<DescribeRecoveryPointOutput> describeRecoveryPoint({
    @_s.required String backupVaultName,
    @_s.required String recoveryPointArn,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}/recovery-points/${Uri.encodeComponent(recoveryPointArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRecoveryPointOutput.fromJson(response);
  }

  /// Returns metadata associated with a restore job that is specified by a job
  /// ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [DependencyFailureException].
  ///
  /// Parameter [restoreJobId] :
  /// Uniquely identifies the job that restores a recovery point.
  Future<DescribeRestoreJobOutput> describeRestoreJob({
    @_s.required String restoreJobId,
  }) async {
    ArgumentError.checkNotNull(restoreJobId, 'restoreJobId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restore-jobs/${Uri.encodeComponent(restoreJobId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRestoreJobOutput.fromJson(response);
  }

  /// Returns the backup plan that is specified by the plan ID as a backup
  /// template.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  Future<ExportBackupPlanTemplateOutput> exportBackupPlanTemplate({
    @_s.required String backupPlanId,
  }) async {
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId.toString())}/toTemplate/',
      exceptionFnMap: _exceptionFns,
    );
    return ExportBackupPlanTemplateOutput.fromJson(response);
  }

  /// Returns the body of a backup plan in JSON format, in addition to plan
  /// metadata.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  ///
  /// Parameter [versionId] :
  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at
  /// most 1,024 bytes long. Version IDs cannot be edited.
  Future<GetBackupPlanOutput> getBackupPlan({
    @_s.required String backupPlanId,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    var _query = '';
    _query = '?${[
      if (versionId != null) _s.toQueryParam('versionId', versionId),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId.toString())}/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupPlanOutput.fromJson(response);
  }

  /// Returns a valid JSON document specifying a backup plan or an error.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [backupPlanTemplateJson] :
  /// A customer-supplied backup plan document in JSON format.
  Future<GetBackupPlanFromJSONOutput> getBackupPlanFromJSON({
    @_s.required String backupPlanTemplateJson,
  }) async {
    ArgumentError.checkNotNull(
        backupPlanTemplateJson, 'backupPlanTemplateJson');
    final $payload = <String, dynamic>{
      'BackupPlanTemplateJson': backupPlanTemplateJson,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backup/template/json/toPlan',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupPlanFromJSONOutput.fromJson(response);
  }

  /// Returns the template specified by its <code>templateId</code> as a backup
  /// plan.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [backupPlanTemplateId] :
  /// Uniquely identifies a stored backup plan template.
  Future<GetBackupPlanFromTemplateOutput> getBackupPlanFromTemplate({
    @_s.required String backupPlanTemplateId,
  }) async {
    ArgumentError.checkNotNull(backupPlanTemplateId, 'backupPlanTemplateId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup/template/plans/${Uri.encodeComponent(backupPlanTemplateId.toString())}/toPlan',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupPlanFromTemplateOutput.fromJson(response);
  }

  /// Returns selection metadata and a document in JSON format that specifies a
  /// list of resources that are associated with a backup plan.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  ///
  /// Parameter [selectionId] :
  /// Uniquely identifies the body of a request to assign a set of resources to
  /// a backup plan.
  Future<GetBackupSelectionOutput> getBackupSelection({
    @_s.required String backupPlanId,
    @_s.required String selectionId,
  }) async {
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    ArgumentError.checkNotNull(selectionId, 'selectionId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId.toString())}/selections/${Uri.encodeComponent(selectionId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupSelectionOutput.fromJson(response);
  }

  /// Returns the access policy document that is associated with the named
  /// backup vault.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  Future<GetBackupVaultAccessPolicyOutput> getBackupVaultAccessPolicy({
    @_s.required String backupVaultName,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}/access-policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupVaultAccessPolicyOutput.fromJson(response);
  }

  /// Returns event notifications for the specified backup vault.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  Future<GetBackupVaultNotificationsOutput> getBackupVaultNotifications({
    @_s.required String backupVaultName,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}/notification-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupVaultNotificationsOutput.fromJson(response);
  }

  /// Returns a set of metadata key-value pairs that were used to create the
  /// backup.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  Future<GetRecoveryPointRestoreMetadataOutput>
      getRecoveryPointRestoreMetadata({
    @_s.required String backupVaultName,
    @_s.required String recoveryPointArn,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}/recovery-points/${Uri.encodeComponent(recoveryPointArn.toString())}/restore-metadata',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecoveryPointRestoreMetadataOutput.fromJson(response);
  }

  /// Returns the AWS resource types supported by AWS Backup.
  ///
  /// May throw [ServiceUnavailableException].
  Future<GetSupportedResourceTypesOutput> getSupportedResourceTypes() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/supported-resource-types',
      exceptionFnMap: _exceptionFns,
    );
    return GetSupportedResourceTypesOutput.fromJson(response);
  }

  /// Returns metadata about your backup jobs.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [byBackupVaultName] :
  /// Returns only backup jobs that will be stored in the specified backup
  /// vault. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  ///
  /// Parameter [byCreatedAfter] :
  /// Returns only backup jobs that were created after the specified date.
  ///
  /// Parameter [byCreatedBefore] :
  /// Returns only backup jobs that were created before the specified date.
  ///
  /// Parameter [byResourceArn] :
  /// Returns only backup jobs that match the specified resource Amazon Resource
  /// Name (ARN).
  ///
  /// Parameter [byResourceType] :
  /// Returns only backup jobs for the specified resources:
  ///
  /// <ul>
  /// <li>
  /// <code>DynamoDB</code> for Amazon DynamoDB
  /// </li>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>EFS</code> for Amazon Elastic File System
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for AWS Storage Gateway
  /// </li>
  /// </ul>
  ///
  /// Parameter [byState] :
  /// Returns only backup jobs that are in the specified state.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupJobsOutput> listBackupJobs({
    String byBackupVaultName,
    DateTime byCreatedAfter,
    DateTime byCreatedBefore,
    String byResourceArn,
    String byResourceType,
    BackupJobState byState,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'byBackupVaultName',
      byBackupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
    );
    _s.validateStringPattern(
      'byResourceType',
      byResourceType,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (byBackupVaultName != null)
        _s.toQueryParam('backupVaultName', byBackupVaultName),
      if (byCreatedAfter != null)
        _s.toQueryParam('createdAfter', byCreatedAfter),
      if (byCreatedBefore != null)
        _s.toQueryParam('createdBefore', byCreatedBefore),
      if (byResourceArn != null) _s.toQueryParam('resourceArn', byResourceArn),
      if (byResourceType != null)
        _s.toQueryParam('resourceType', byResourceType),
      if (byState != null) _s.toQueryParam('state', byState),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup-jobs/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupJobsOutput.fromJson(response);
  }

  /// Returns metadata of your saved backup plan templates, including the
  /// template ID, name, and the creation and deletion dates.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupPlanTemplatesOutput> listBackupPlanTemplates({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup/template/plans$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupPlanTemplatesOutput.fromJson(response);
  }

  /// Returns version metadata of your backup plans, including Amazon Resource
  /// Names (ARNs), backup plan IDs, creation and deletion dates, plan names,
  /// and version IDs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupPlanVersionsOutput> listBackupPlanVersions({
    @_s.required String backupPlanId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId.toString())}/versions/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupPlanVersionsOutput.fromJson(response);
  }

  /// Returns metadata of your saved backup plans, including Amazon Resource
  /// Names (ARNs), plan IDs, creation and deletion dates, version IDs, plan
  /// names, and creator request IDs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [includeDeleted] :
  /// A Boolean value with a default value of <code>FALSE</code> that returns
  /// deleted backup plans when set to <code>TRUE</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupPlansOutput> listBackupPlans({
    bool includeDeleted,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (includeDeleted != null)
        _s.toQueryParam('includeDeleted', includeDeleted),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup/plans/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupPlansOutput.fromJson(response);
  }

  /// Returns an array containing metadata of the resources associated with the
  /// target backup plan.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupSelectionsOutput> listBackupSelections({
    @_s.required String backupPlanId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId.toString())}/selections/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupSelectionsOutput.fromJson(response);
  }

  /// Returns a list of recovery point storage containers along with information
  /// about them.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupVaultsOutput> listBackupVaults({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup-vaults/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupVaultsOutput.fromJson(response);
  }

  /// Returns metadata about your copy jobs.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [byCreatedAfter] :
  /// Returns only copy jobs that were created after the specified date.
  ///
  /// Parameter [byCreatedBefore] :
  /// Returns only copy jobs that were created before the specified date.
  ///
  /// Parameter [byDestinationVaultArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a source backup
  /// vault to copy from; for example,
  /// arn:aws:backup:us-east-1:123456789012:vault:aBackupVault.
  ///
  /// Parameter [byResourceArn] :
  /// Returns only copy jobs that match the specified resource Amazon Resource
  /// Name (ARN).
  ///
  /// Parameter [byResourceType] :
  /// Returns only backup jobs for the specified resources:
  ///
  /// <ul>
  /// <li>
  /// <code>DynamoDB</code> for Amazon DynamoDB
  /// </li>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>EFS</code> for Amazon Elastic File System
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for AWS Storage Gateway
  /// </li>
  /// </ul>
  ///
  /// Parameter [byState] :
  /// Returns only copy jobs that are in the specified state.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return maxResults number of items, NextToken allows
  /// you to return more items in your list starting at the location pointed to
  /// by the next token.
  Future<ListCopyJobsOutput> listCopyJobs({
    DateTime byCreatedAfter,
    DateTime byCreatedBefore,
    String byDestinationVaultArn,
    String byResourceArn,
    String byResourceType,
    CopyJobState byState,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'byResourceType',
      byResourceType,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (byCreatedAfter != null)
        _s.toQueryParam('createdAfter', byCreatedAfter),
      if (byCreatedBefore != null)
        _s.toQueryParam('createdBefore', byCreatedBefore),
      if (byDestinationVaultArn != null)
        _s.toQueryParam('destinationVaultArn', byDestinationVaultArn),
      if (byResourceArn != null) _s.toQueryParam('resourceArn', byResourceArn),
      if (byResourceType != null)
        _s.toQueryParam('resourceType', byResourceType),
      if (byState != null) _s.toQueryParam('state', byState),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/copy-jobs/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListCopyJobsOutput.fromJson(response);
  }

  /// Returns an array of resources successfully backed up by AWS Backup,
  /// including the time the resource was saved, an Amazon Resource Name (ARN)
  /// of the resource, and a resource type.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListProtectedResourcesOutput> listProtectedResources({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resources/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListProtectedResourcesOutput.fromJson(response);
  }

  /// Returns detailed information about the recovery points stored in a backup
  /// vault.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [byBackupPlanId] :
  /// Returns only recovery points that match the specified backup plan ID.
  ///
  /// Parameter [byCreatedAfter] :
  /// Returns only recovery points that were created after the specified
  /// timestamp.
  ///
  /// Parameter [byCreatedBefore] :
  /// Returns only recovery points that were created before the specified
  /// timestamp.
  ///
  /// Parameter [byResourceArn] :
  /// Returns only recovery points that match the specified resource Amazon
  /// Resource Name (ARN).
  ///
  /// Parameter [byResourceType] :
  /// Returns only recovery points that match the specified resource type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListRecoveryPointsByBackupVaultOutput>
      listRecoveryPointsByBackupVault({
    @_s.required String backupVaultName,
    String byBackupPlanId,
    DateTime byCreatedAfter,
    DateTime byCreatedBefore,
    String byResourceArn,
    String byResourceType,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'byResourceType',
      byResourceType,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (byBackupPlanId != null)
        _s.toQueryParam('backupPlanId', byBackupPlanId),
      if (byCreatedAfter != null)
        _s.toQueryParam('createdAfter', byCreatedAfter),
      if (byCreatedBefore != null)
        _s.toQueryParam('createdBefore', byCreatedBefore),
      if (byResourceArn != null) _s.toQueryParam('resourceArn', byResourceArn),
      if (byResourceType != null)
        _s.toQueryParam('resourceType', byResourceType),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}/recovery-points/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListRecoveryPointsByBackupVaultOutput.fromJson(response);
  }

  /// Returns detailed information about recovery points of the type specified
  /// by a resource Amazon Resource Name (ARN).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// An ARN that uniquely identifies a resource. The format of the ARN depends
  /// on the resource type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListRecoveryPointsByResourceOutput> listRecoveryPointsByResource({
    @_s.required String resourceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/resources/${Uri.encodeComponent(resourceArn.toString())}/recovery-points/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListRecoveryPointsByResourceOutput.fromJson(response);
  }

  /// Returns a list of jobs that AWS Backup initiated to restore a saved
  /// resource, including metadata about the recovery process.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListRestoreJobsOutput> listRestoreJobs({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restore-jobs/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListRestoreJobsOutput.fromJson(response);
  }

  /// Returns a list of key-value pairs assigned to a target recovery point,
  /// backup plan, or backup vault.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the type of resource. Valid targets for
  /// <code>ListTags</code> are recovery points, backup plans, and backup
  /// vaults.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListTagsOutput> listTags({
    @_s.required String resourceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tags/${Uri.encodeComponent(resourceArn.toString())}/$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsOutput.fromJson(response);
  }

  /// Sets a resource-based policy that is used to manage access permissions on
  /// the target backup vault. Requires a backup vault name and an access policy
  /// document in JSON format.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [policy] :
  /// The backup vault access policy document in JSON format.
  Future<void> putBackupVaultAccessPolicy({
    @_s.required String backupVaultName,
    String policy,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Policy': policy,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}/access-policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Turns on notifications on a backup vault for the specified topic and
  /// events.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultEvents] :
  /// An array of events that indicate the status of jobs to back up resources
  /// to the backup vault.
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [sNSTopicArn] :
  /// The Amazon Resource Name (ARN) that specifies the topic for a backup
  /// vault’s events; for example,
  /// <code>arn:aws:sns:us-west-2:111122223333:MyVaultTopic</code>.
  Future<void> putBackupVaultNotifications({
    @_s.required List<String> backupVaultEvents,
    @_s.required String backupVaultName,
    @_s.required String sNSTopicArn,
  }) async {
    ArgumentError.checkNotNull(backupVaultEvents, 'backupVaultEvents');
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sNSTopicArn, 'sNSTopicArn');
    final $payload = <String, dynamic>{
      'BackupVaultEvents': backupVaultEvents,
      'SNSTopicArn': sNSTopicArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}/notification-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a job to create a one-time backup of the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [iamRoleArn] :
  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  ///
  /// Parameter [resourceArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  ///
  /// Parameter [completeWindowMinutes] :
  /// The amount of time AWS Backup attempts a backup before canceling the job
  /// and returning an error.
  ///
  /// Parameter [idempotencyToken] :
  /// A customer chosen string that can be used to distinguish between calls to
  /// <code>StartBackupJob</code>.
  ///
  /// Parameter [lifecycle] :
  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup will transition and expire backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  ///
  /// Parameter [recoveryPointTags] :
  /// To help organize your resources, you can assign your own metadata to the
  /// resources that you create. Each tag is a key-value pair.
  ///
  /// Parameter [startWindowMinutes] :
  /// The amount of time in minutes before beginning a backup.
  Future<StartBackupJobOutput> startBackupJob({
    @_s.required String backupVaultName,
    @_s.required String iamRoleArn,
    @_s.required String resourceArn,
    int completeWindowMinutes,
    String idempotencyToken,
    Lifecycle lifecycle,
    Map<String, String> recoveryPointTags,
    int startWindowMinutes,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(iamRoleArn, 'iamRoleArn');
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $payload = <String, dynamic>{
      'BackupVaultName': backupVaultName,
      'IamRoleArn': iamRoleArn,
      'ResourceArn': resourceArn,
      'CompleteWindowMinutes': completeWindowMinutes,
      'IdempotencyToken': idempotencyToken,
      'Lifecycle': lifecycle,
      'RecoveryPointTags': recoveryPointTags,
      'StartWindowMinutes': startWindowMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/backup-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartBackupJobOutput.fromJson(response);
  }

  /// Starts a job to create a one-time copy of the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [destinationBackupVaultArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a destination
  /// backup vault to copy to; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  ///
  /// Parameter [iamRoleArn] :
  /// Specifies the IAM role ARN used to copy the target recovery point; for
  /// example, arn:aws:iam::123456789012:role/S3Access.
  ///
  /// Parameter [recoveryPointArn] :
  /// An ARN that uniquely identifies a recovery point to use for the copy job;
  /// for example,
  /// arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45.
  ///
  /// Parameter [sourceBackupVaultName] :
  /// The name of a logical source container where backups are stored. Backup
  /// vaults are identified by names that are unique to the account used to
  /// create them and the AWS Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens. &gt;
  ///
  /// Parameter [idempotencyToken] :
  /// A customer chosen string that can be used to distinguish between calls to
  /// <code>StartCopyJob</code>.
  Future<StartCopyJobOutput> startCopyJob({
    @_s.required String destinationBackupVaultArn,
    @_s.required String iamRoleArn,
    @_s.required String recoveryPointArn,
    @_s.required String sourceBackupVaultName,
    String idempotencyToken,
    Lifecycle lifecycle,
  }) async {
    ArgumentError.checkNotNull(
        destinationBackupVaultArn, 'destinationBackupVaultArn');
    ArgumentError.checkNotNull(iamRoleArn, 'iamRoleArn');
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    ArgumentError.checkNotNull(sourceBackupVaultName, 'sourceBackupVaultName');
    _s.validateStringPattern(
      'sourceBackupVaultName',
      sourceBackupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'DestinationBackupVaultArn': destinationBackupVaultArn,
      'IamRoleArn': iamRoleArn,
      'RecoveryPointArn': recoveryPointArn,
      'SourceBackupVaultName': sourceBackupVaultName,
      'IdempotencyToken': idempotencyToken,
      'Lifecycle': lifecycle,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/copy-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartCopyJobOutput.fromJson(response);
  }

  /// Recovers the saved resource identified by an Amazon Resource Name (ARN).
  ///
  /// If the resource ARN is included in the request, then the last complete
  /// backup of that resource is recovered. If the ARN of a recovery point is
  /// supplied, then that recovery point is restored.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [iamRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that AWS Backup uses to
  /// create the target recovery point; for example,
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  ///
  /// Parameter [metadata] :
  /// A set of metadata key-value pairs. Contains information, such as a
  /// resource name, required to restore a recovery point.
  ///
  /// You can get configuration metadata about a resource at the time it was
  /// backed-up by calling <code>GetRecoveryPointRestoreMetadata</code>.
  /// However, values in addition to those provided by
  /// <code>GetRecoveryPointRestoreMetadata</code> might be required to restore
  /// a resource. For example, you might need to provide a new resource name if
  /// the original already exists.
  ///
  /// You need to specify specific metadata to restore an Amazon Elastic File
  /// System (Amazon EFS) instance:
  ///
  /// <ul>
  /// <li>
  /// <code>file-system-id</code>: ID of the Amazon EFS file system that is
  /// backed up by AWS Backup. Returned in
  /// <code>GetRecoveryPointRestoreMetadata</code>.
  /// </li>
  /// <li>
  /// <code>Encrypted</code>: A Boolean value that, if true, specifies that the
  /// file system is encrypted. If <code>KmsKeyId</code> is specified,
  /// <code>Encrypted</code> must be set to <code>true</code>.
  /// </li>
  /// <li>
  /// <code>KmsKeyId</code>: Specifies the AWS KMS key that is used to encrypt
  /// the restored file system.
  /// </li>
  /// <li>
  /// <code>PerformanceMode</code>: Specifies the throughput mode of the file
  /// system.
  /// </li>
  /// <li>
  /// <code>CreationToken</code>: A user-supplied value that ensures the
  /// uniqueness (idempotency) of the request.
  /// </li>
  /// <li>
  /// <code>newFileSystem</code>: A Boolean value that, if true, specifies that
  /// the recovery point is restored to a new Amazon EFS file system.
  /// </li>
  /// </ul>
  ///
  /// Parameter [recoveryPointArn] :
  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [idempotencyToken] :
  /// A customer chosen string that can be used to distinguish between calls to
  /// <code>StartRestoreJob</code>.
  ///
  /// Parameter [resourceType] :
  /// Starts a job to restore a recovery point for one of the following
  /// resources:
  ///
  /// <ul>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for AWS Storage Gateway
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>DDB</code> for Amazon DynamoDB
  /// </li>
  /// <li>
  /// <code>EFS</code> for Amazon Elastic File System
  /// </li>
  /// </ul>
  Future<StartRestoreJobOutput> startRestoreJob({
    @_s.required String iamRoleArn,
    @_s.required Map<String, String> metadata,
    @_s.required String recoveryPointArn,
    String idempotencyToken,
    String resourceType,
  }) async {
    ArgumentError.checkNotNull(iamRoleArn, 'iamRoleArn');
    ArgumentError.checkNotNull(metadata, 'metadata');
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    _s.validateStringPattern(
      'resourceType',
      resourceType,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
    );
    final $payload = <String, dynamic>{
      'IamRoleArn': iamRoleArn,
      'Metadata': metadata,
      'RecoveryPointArn': recoveryPointArn,
      'IdempotencyToken': idempotencyToken,
      'ResourceType': resourceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/restore-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartRestoreJobOutput.fromJson(response);
  }

  /// Attempts to cancel a job to create a one-time backup of a resource.
  ///
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupJobId] :
  /// Uniquely identifies a request to AWS Backup to back up a resource.
  Future<void> stopBackupJob({
    @_s.required String backupJobId,
  }) async {
    ArgumentError.checkNotNull(backupJobId, 'backupJobId');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backup-jobs/${Uri.encodeComponent(backupJobId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns a set of key-value pairs to a recovery point, backup plan, or
  /// backup vault identified by an Amazon Resource Name (ARN).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// An ARN that uniquely identifies a resource. The format of the ARN depends
  /// on the type of the tagged resource.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that are used to help organize your resources. You can
  /// assign your own metadata to the resources you create.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a set of key-value pairs from a recovery point, backup plan, or
  /// backup vault identified by an Amazon Resource Name (ARN)
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// An ARN that uniquely identifies a resource. The format of the ARN depends
  /// on the type of the tagged resource.
  ///
  /// Parameter [tagKeyList] :
  /// A list of keys to identify which key-value tags to remove from a resource.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeyList,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeyList, 'tagKeyList');
    final $payload = <String, dynamic>{
      'TagKeyList': tagKeyList,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untag/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Replaces the body of a saved backup plan identified by its
  /// <code>backupPlanId</code> with the input document in JSON format. The new
  /// version is uniquely identified by a <code>VersionId</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlan] :
  /// Specifies the body of a backup plan. Includes a
  /// <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  Future<UpdateBackupPlanOutput> updateBackupPlan({
    @_s.required BackupPlanInput backupPlan,
    @_s.required String backupPlanId,
  }) async {
    ArgumentError.checkNotNull(backupPlan, 'backupPlan');
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    final $payload = <String, dynamic>{
      'BackupPlan': backupPlan,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBackupPlanOutput.fromJson(response);
  }

  /// Sets the transition lifecycle of a recovery point.
  ///
  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [lifecycle] :
  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  Future<UpdateRecoveryPointLifecycleOutput> updateRecoveryPointLifecycle({
    @_s.required String backupVaultName,
    @_s.required String recoveryPointArn,
    Lifecycle lifecycle,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateStringPattern(
      'backupVaultName',
      backupVaultName,
      r'''^[a-zA-Z0-9\-\_\.]{1,50}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    final $payload = <String, dynamic>{
      'Lifecycle': lifecycle,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName.toString())}/recovery-points/${Uri.encodeComponent(recoveryPointArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRecoveryPointLifecycleOutput.fromJson(response);
  }
}

/// Contains detailed information about a backup job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupJob {
  /// Uniquely identifies a request to AWS Backup to back up a resource.
  @_s.JsonKey(name: 'BackupJobId')
  final String backupJobId;

  /// The size, in bytes, of a backup.
  @_s.JsonKey(name: 'BackupSizeInBytes')
  final int backupSizeInBytes;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  @_s.JsonKey(name: 'BackupVaultArn')
  final String backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'BackupVaultName')
  final String backupVaultName;

  /// The size in bytes transferred to a backup vault at the time that the job
  /// status was queried.
  @_s.JsonKey(name: 'BytesTransferred')
  final int bytesTransferred;

  /// The date and time a job to create a backup job is completed, in Unix format
  /// and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CompletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completionDate;

  /// Contains identifying information about the creation of a backup job,
  /// including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>,
  /// <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup
  /// plan used to create it.
  @_s.JsonKey(name: 'CreatedBy')
  final RecoveryPointCreator createdBy;

  /// The date and time a backup job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// The date and time a job to back up resources is expected to be completed, in
  /// Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>ExpectedCompletionDate</code> is accurate to milliseconds. For
  /// example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'ExpectedCompletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime expectedCompletionDate;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// Contains an estimated percentage complete of a job at the time the job
  /// status was queried.
  @_s.JsonKey(name: 'PercentDone')
  final String percentDone;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  @_s.JsonKey(name: 'RecoveryPointArn')
  final String recoveryPointArn;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The type of AWS resource to be backed-up; for example, an Amazon Elastic
  /// Block Store (Amazon EBS) volume or an Amazon Relational Database Service
  /// (Amazon RDS) database.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// Specifies the time in Unix format and Coordinated Universal Time (UTC) when
  /// a backup job must be started before it is canceled. The value is calculated
  /// by adding the start window to the scheduled time. So if the scheduled time
  /// were 6:00 PM and the start window is 2 hours, the <code>StartBy</code> time
  /// would be 8:00 PM on the date specified. The value of <code>StartBy</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'StartBy',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startBy;

  /// The current state of a resource recovery point.
  @_s.JsonKey(name: 'State')
  final BackupJobState state;

  /// A detailed message explaining the status of the job to back up a resource.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  BackupJob({
    this.backupJobId,
    this.backupSizeInBytes,
    this.backupVaultArn,
    this.backupVaultName,
    this.bytesTransferred,
    this.completionDate,
    this.createdBy,
    this.creationDate,
    this.expectedCompletionDate,
    this.iamRoleArn,
    this.percentDone,
    this.recoveryPointArn,
    this.resourceArn,
    this.resourceType,
    this.startBy,
    this.state,
    this.statusMessage,
  });
  factory BackupJob.fromJson(Map<String, dynamic> json) =>
      _$BackupJobFromJson(json);
}

enum BackupJobState {
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('ABORTING')
  aborting,
  @_s.JsonValue('ABORTED')
  aborted,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('EXPIRED')
  expired,
}

/// Contains an optional backup plan display name and an array of
/// <code>BackupRule</code> objects, each of which specifies a backup rule. Each
/// rule in a backup plan is a separate scheduled task and can back up a
/// different selection of AWS resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupPlan {
  /// The display name of a backup plan.
  @_s.JsonKey(name: 'BackupPlanName')
  final String backupPlanName;

  /// An array of <code>BackupRule</code> objects, each of which specifies a
  /// scheduled task that is used to back up a selection of resources.
  @_s.JsonKey(name: 'Rules')
  final List<BackupRule> rules;

  BackupPlan({
    @_s.required this.backupPlanName,
    @_s.required this.rules,
  });
  factory BackupPlan.fromJson(Map<String, dynamic> json) =>
      _$BackupPlanFromJson(json);
}

/// Contains an optional backup plan display name and an array of
/// <code>BackupRule</code> objects, each of which specifies a backup rule. Each
/// rule in a backup plan is a separate scheduled task and can back up a
/// different selection of AWS resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BackupPlanInput {
  /// The display name of a backup plan.
  @_s.JsonKey(name: 'BackupPlanName')
  final String backupPlanName;

  /// An array of <code>BackupRule</code> objects, each of which specifies a
  /// scheduled task that is used to back up a selection of resources.
  @_s.JsonKey(name: 'Rules')
  final List<BackupRuleInput> rules;

  BackupPlanInput({
    @_s.required this.backupPlanName,
    @_s.required this.rules,
  });
  Map<String, dynamic> toJson() => _$BackupPlanInputToJson(this);
}

/// An object specifying metadata associated with a backup plan template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupPlanTemplatesListMember {
  /// Uniquely identifies a stored backup plan template.
  @_s.JsonKey(name: 'BackupPlanTemplateId')
  final String backupPlanTemplateId;

  /// The optional display name of a backup plan template.
  @_s.JsonKey(name: 'BackupPlanTemplateName')
  final String backupPlanTemplateName;

  BackupPlanTemplatesListMember({
    this.backupPlanTemplateId,
    this.backupPlanTemplateName,
  });
  factory BackupPlanTemplatesListMember.fromJson(Map<String, dynamic> json) =>
      _$BackupPlanTemplatesListMemberFromJson(json);
}

/// Contains metadata about a backup plan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupPlansListMember {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  @_s.JsonKey(name: 'BackupPlanArn')
  final String backupPlanArn;

  /// Uniquely identifies a backup plan.
  @_s.JsonKey(name: 'BackupPlanId')
  final String backupPlanId;

  /// The display name of a saved backup plan.
  @_s.JsonKey(name: 'BackupPlanName')
  final String backupPlanName;

  /// The date and time a resource backup plan is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of executing the operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// The date and time a backup plan is deleted, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>DeletionDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'DeletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime deletionDate;

  /// The last time a job to back up resources was executed with this rule. A date
  /// and time, in Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>LastExecutionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'LastExecutionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastExecutionDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1,024 bytes long. Version IDs cannot be edited.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  BackupPlansListMember({
    this.backupPlanArn,
    this.backupPlanId,
    this.backupPlanName,
    this.creationDate,
    this.creatorRequestId,
    this.deletionDate,
    this.lastExecutionDate,
    this.versionId,
  });
  factory BackupPlansListMember.fromJson(Map<String, dynamic> json) =>
      _$BackupPlansListMemberFromJson(json);
}

/// Specifies a scheduled task used to back up a selection of resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupRule {
  /// An optional display name for a backup rule.
  @_s.JsonKey(name: 'RuleName')
  final String ruleName;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'TargetBackupVaultName')
  final String targetBackupVaultName;

  /// A value in minutes after a backup job is successfully started before it must
  /// be completed or it is canceled by AWS Backup. This value is optional.
  @_s.JsonKey(name: 'CompletionWindowMinutes')
  final int completionWindowMinutes;

  /// An array of <code>CopyAction</code> objects, which contains the details of
  /// the copy operation.
  @_s.JsonKey(name: 'CopyActions')
  final List<CopyAction> copyActions;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup has
  /// been transitioned to cold.
  @_s.JsonKey(name: 'Lifecycle')
  final Lifecycle lifecycle;

  /// An array of key-value pair strings that are assigned to resources that are
  /// associated with this rule when restored from backup.
  @_s.JsonKey(name: 'RecoveryPointTags')
  final Map<String, String> recoveryPointTags;

  /// Uniquely identifies a rule that is used to schedule the backup of a
  /// selection of resources.
  @_s.JsonKey(name: 'RuleId')
  final String ruleId;

  /// A CRON expression specifying when AWS Backup initiates a backup job.
  @_s.JsonKey(name: 'ScheduleExpression')
  final String scheduleExpression;

  /// An optional value that specifies a period of time in minutes after a backup
  /// is scheduled before a job is canceled if it doesn't start successfully.
  @_s.JsonKey(name: 'StartWindowMinutes')
  final int startWindowMinutes;

  BackupRule({
    @_s.required this.ruleName,
    @_s.required this.targetBackupVaultName,
    this.completionWindowMinutes,
    this.copyActions,
    this.lifecycle,
    this.recoveryPointTags,
    this.ruleId,
    this.scheduleExpression,
    this.startWindowMinutes,
  });
  factory BackupRule.fromJson(Map<String, dynamic> json) =>
      _$BackupRuleFromJson(json);
}

/// Specifies a scheduled task used to back up a selection of resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BackupRuleInput {
  /// &gt;An optional display name for a backup rule.
  @_s.JsonKey(name: 'RuleName')
  final String ruleName;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'TargetBackupVaultName')
  final String targetBackupVaultName;

  /// The amount of time AWS Backup attempts a backup before canceling the job and
  /// returning an error.
  @_s.JsonKey(name: 'CompletionWindowMinutes')
  final int completionWindowMinutes;

  /// An array of <code>CopyAction</code> objects, which contains the details of
  /// the copy operation.
  @_s.JsonKey(name: 'CopyActions')
  final List<CopyAction> copyActions;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup will transition and expire backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days”. The “transition to
  /// cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold.
  @_s.JsonKey(name: 'Lifecycle')
  final Lifecycle lifecycle;

  /// To help organize your resources, you can assign your own metadata to the
  /// resources that you create. Each tag is a key-value pair.
  @_s.JsonKey(name: 'RecoveryPointTags')
  final Map<String, String> recoveryPointTags;

  /// A CRON expression specifying when AWS Backup initiates a backup job.
  @_s.JsonKey(name: 'ScheduleExpression')
  final String scheduleExpression;

  /// The amount of time in minutes before beginning a backup.
  @_s.JsonKey(name: 'StartWindowMinutes')
  final int startWindowMinutes;

  BackupRuleInput({
    @_s.required this.ruleName,
    @_s.required this.targetBackupVaultName,
    this.completionWindowMinutes,
    this.copyActions,
    this.lifecycle,
    this.recoveryPointTags,
    this.scheduleExpression,
    this.startWindowMinutes,
  });
  Map<String, dynamic> toJson() => _$BackupRuleInputToJson(this);
}

/// Used to specify a set of resources to a backup plan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BackupSelection {
  /// The ARN of the IAM role that AWS Backup uses to authenticate when restoring
  /// the target resource; for example,
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// The display name of a resource selection document.
  @_s.JsonKey(name: 'SelectionName')
  final String selectionName;

  /// An array of conditions used to specify a set of resources to assign to a
  /// backup plan; for example, <code>"STRINGEQUALS":
  /// {"ec2:ResourceTag/Department": "accounting"</code>.
  @_s.JsonKey(name: 'ListOfTags')
  final List<Condition> listOfTags;

  /// An array of strings that contain Amazon Resource Names (ARNs) of resources
  /// to assign to a backup plan.
  @_s.JsonKey(name: 'Resources')
  final List<String> resources;

  BackupSelection({
    @_s.required this.iamRoleArn,
    @_s.required this.selectionName,
    this.listOfTags,
    this.resources,
  });
  factory BackupSelection.fromJson(Map<String, dynamic> json) =>
      _$BackupSelectionFromJson(json);

  Map<String, dynamic> toJson() => _$BackupSelectionToJson(this);
}

/// Contains metadata about a <code>BackupSelection</code> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupSelectionsListMember {
  /// Uniquely identifies a backup plan.
  @_s.JsonKey(name: 'BackupPlanId')
  final String backupPlanId;

  /// The date and time a backup plan is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of executing the operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// Specifies the IAM role Amazon Resource Name (ARN) to create the target
  /// recovery point; for example,
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// Uniquely identifies a request to assign a set of resources to a backup plan.
  @_s.JsonKey(name: 'SelectionId')
  final String selectionId;

  /// The display name of a resource selection document.
  @_s.JsonKey(name: 'SelectionName')
  final String selectionName;

  BackupSelectionsListMember({
    this.backupPlanId,
    this.creationDate,
    this.creatorRequestId,
    this.iamRoleArn,
    this.selectionId,
    this.selectionName,
  });
  factory BackupSelectionsListMember.fromJson(Map<String, dynamic> json) =>
      _$BackupSelectionsListMemberFromJson(json);
}

enum BackupVaultEvent {
  @_s.JsonValue('BACKUP_JOB_STARTED')
  backupJobStarted,
  @_s.JsonValue('BACKUP_JOB_COMPLETED')
  backupJobCompleted,
  @_s.JsonValue('BACKUP_JOB_SUCCESSFUL')
  backupJobSuccessful,
  @_s.JsonValue('BACKUP_JOB_FAILED')
  backupJobFailed,
  @_s.JsonValue('BACKUP_JOB_EXPIRED')
  backupJobExpired,
  @_s.JsonValue('RESTORE_JOB_STARTED')
  restoreJobStarted,
  @_s.JsonValue('RESTORE_JOB_COMPLETED')
  restoreJobCompleted,
  @_s.JsonValue('RESTORE_JOB_SUCCESSFUL')
  restoreJobSuccessful,
  @_s.JsonValue('RESTORE_JOB_FAILED')
  restoreJobFailed,
  @_s.JsonValue('COPY_JOB_STARTED')
  copyJobStarted,
  @_s.JsonValue('COPY_JOB_SUCCESSFUL')
  copyJobSuccessful,
  @_s.JsonValue('COPY_JOB_FAILED')
  copyJobFailed,
  @_s.JsonValue('RECOVERY_POINT_MODIFIED')
  recoveryPointModified,
  @_s.JsonValue('BACKUP_PLAN_CREATED')
  backupPlanCreated,
  @_s.JsonValue('BACKUP_PLAN_MODIFIED')
  backupPlanModified,
}

/// Contains metadata about a backup vault.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupVaultListMember {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  @_s.JsonKey(name: 'BackupVaultArn')
  final String backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'BackupVaultName')
  final String backupVaultName;

  /// The date and time a resource backup is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of executing the operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  @_s.JsonKey(name: 'EncryptionKeyArn')
  final String encryptionKeyArn;

  /// The number of recovery points that are stored in a backup vault.
  @_s.JsonKey(name: 'NumberOfRecoveryPoints')
  final int numberOfRecoveryPoints;

  BackupVaultListMember({
    this.backupVaultArn,
    this.backupVaultName,
    this.creationDate,
    this.creatorRequestId,
    this.encryptionKeyArn,
    this.numberOfRecoveryPoints,
  });
  factory BackupVaultListMember.fromJson(Map<String, dynamic> json) =>
      _$BackupVaultListMemberFromJson(json);
}

/// Contains <code>DeleteAt</code> and <code>MoveToColdStorageAt</code>
/// timestamps, which are used to specify a lifecycle for a recovery point.
///
/// The lifecycle defines when a protected resource is transitioned to cold
/// storage and when it expires. AWS Backup transitions and expires backups
/// automatically according to the lifecycle that you define.
///
/// Backups transitioned to cold storage must be stored in cold storage for a
/// minimum of 90 days. Therefore, the “expire after days” setting must be 90
/// days greater than the “transition to cold after days” setting. The
/// “transition to cold after days” setting cannot be changed after a backup has
/// been transitioned to cold.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CalculatedLifecycle {
  /// A timestamp that specifies when to delete a recovery point.
  @_s.JsonKey(
      name: 'DeleteAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime deleteAt;

  /// A timestamp that specifies when to transition a recovery point to cold
  /// storage.
  @_s.JsonKey(
      name: 'MoveToColdStorageAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime moveToColdStorageAt;

  CalculatedLifecycle({
    this.deleteAt,
    this.moveToColdStorageAt,
  });
  factory CalculatedLifecycle.fromJson(Map<String, dynamic> json) =>
      _$CalculatedLifecycleFromJson(json);
}

/// Contains an array of triplets made up of a condition type (such as
/// <code>STRINGEQUALS</code>), a key, and a value. Conditions are used to
/// filter resources in a selection that is assigned to a backup plan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Condition {
  /// The key in a key-value pair. For example, in
  /// <code>"ec2:ResourceTag/Department": "accounting"</code>,
  /// <code>"ec2:ResourceTag/Department"</code> is the key.
  @_s.JsonKey(name: 'ConditionKey')
  final String conditionKey;

  /// An operation, such as <code>STRINGEQUALS</code>, that is applied to a
  /// key-value pair used to filter resources in a selection.
  @_s.JsonKey(name: 'ConditionType')
  final ConditionType conditionType;

  /// The value in a key-value pair. For example, in
  /// <code>"ec2:ResourceTag/Department": "accounting"</code>,
  /// <code>"accounting"</code> is the value.
  @_s.JsonKey(name: 'ConditionValue')
  final String conditionValue;

  Condition({
    @_s.required this.conditionKey,
    @_s.required this.conditionType,
    @_s.required this.conditionValue,
  });
  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

enum ConditionType {
  @_s.JsonValue('STRINGEQUALS')
  stringequals,
}

/// The details of the copy operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CopyAction {
  /// An Amazon Resource Name (ARN) that uniquely identifies the destination
  /// backup vault for the copied backup. For example,
  /// arn:aws:backup:us-east-1:123456789012:vault:aBackupVault.
  @_s.JsonKey(name: 'DestinationBackupVaultArn')
  final String destinationBackupVaultArn;
  @_s.JsonKey(name: 'Lifecycle')
  final Lifecycle lifecycle;

  CopyAction({
    @_s.required this.destinationBackupVaultArn,
    this.lifecycle,
  });
  factory CopyAction.fromJson(Map<String, dynamic> json) =>
      _$CopyActionFromJson(json);

  Map<String, dynamic> toJson() => _$CopyActionToJson(this);
}

/// Contains detailed information about a copy job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CopyJob {
  /// The size, in bytes, of a copy job.
  @_s.JsonKey(name: 'BackupSizeInBytes')
  final int backupSizeInBytes;

  /// The date and time a job to create a copy job is completed, in Unix format
  /// and Coordinated Universal Time (UTC). The value of CompletionDate is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CompletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completionDate;

  /// Uniquely identifies a request to AWS Backup to copy a resource.
  @_s.JsonKey(name: 'CopyJobId')
  final String copyJobId;
  @_s.JsonKey(name: 'CreatedBy')
  final RecoveryPointCreator createdBy;

  /// The date and time a copy job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of CreationDate is accurate to milliseconds.
  /// For example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// An Amazon Resource Name (ARN) that uniquely identifies a destination copy
  /// vault; for example,
  /// arn:aws:backup:us-east-1:123456789012:vault:aBackupVault.
  @_s.JsonKey(name: 'DestinationBackupVaultArn')
  final String destinationBackupVaultArn;

  /// An ARN that uniquely identifies a destination recovery point; for example,
  /// arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45.
  @_s.JsonKey(name: 'DestinationRecoveryPointArn')
  final String destinationRecoveryPointArn;

  /// Specifies the IAM role ARN used to copy the target recovery point; for
  /// example, arn:aws:iam::123456789012:role/S3Access.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// The type of AWS resource to be copied; for example, an Amazon Elastic Block
  /// Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon
  /// RDS) database.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The type of AWS resource to be copied; for example, an Amazon Elastic Block
  /// Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon
  /// RDS) database.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// An Amazon Resource Name (ARN) that uniquely identifies a source copy vault;
  /// for example, arn:aws:backup:us-east-1:123456789012:vault:aBackupVault.
  @_s.JsonKey(name: 'SourceBackupVaultArn')
  final String sourceBackupVaultArn;

  /// An ARN that uniquely identifies a source recovery point; for example,
  /// arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45.
  @_s.JsonKey(name: 'SourceRecoveryPointArn')
  final String sourceRecoveryPointArn;

  /// The current state of a resource recovery point.
  @_s.JsonKey(name: 'State')
  final CopyJobState state;

  /// A detailed message explaining the status of the job that to copy a resource.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  CopyJob({
    this.backupSizeInBytes,
    this.completionDate,
    this.copyJobId,
    this.createdBy,
    this.creationDate,
    this.destinationBackupVaultArn,
    this.destinationRecoveryPointArn,
    this.iamRoleArn,
    this.resourceArn,
    this.resourceType,
    this.sourceBackupVaultArn,
    this.sourceRecoveryPointArn,
    this.state,
    this.statusMessage,
  });
  factory CopyJob.fromJson(Map<String, dynamic> json) =>
      _$CopyJobFromJson(json);
}

enum CopyJobState {
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBackupPlanOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  @_s.JsonKey(name: 'BackupPlanArn')
  final String backupPlanArn;

  /// Uniquely identifies a backup plan.
  @_s.JsonKey(name: 'BackupPlanId')
  final String backupPlanId;

  /// The date and time that a backup plan is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1024 bytes long. They cannot be edited.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  CreateBackupPlanOutput({
    this.backupPlanArn,
    this.backupPlanId,
    this.creationDate,
    this.versionId,
  });
  factory CreateBackupPlanOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateBackupPlanOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBackupSelectionOutput {
  /// Uniquely identifies a backup plan.
  @_s.JsonKey(name: 'BackupPlanId')
  final String backupPlanId;

  /// The date and time a backup selection is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// Uniquely identifies the body of a request to assign a set of resources to a
  /// backup plan.
  @_s.JsonKey(name: 'SelectionId')
  final String selectionId;

  CreateBackupSelectionOutput({
    this.backupPlanId,
    this.creationDate,
    this.selectionId,
  });
  factory CreateBackupSelectionOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateBackupSelectionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBackupVaultOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  @_s.JsonKey(name: 'BackupVaultArn')
  final String backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'BackupVaultName')
  final String backupVaultName;

  /// The date and time a backup vault is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  CreateBackupVaultOutput({
    this.backupVaultArn,
    this.backupVaultName,
    this.creationDate,
  });
  factory CreateBackupVaultOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateBackupVaultOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBackupPlanOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  @_s.JsonKey(name: 'BackupPlanArn')
  final String backupPlanArn;

  /// Uniquely identifies a backup plan.
  @_s.JsonKey(name: 'BackupPlanId')
  final String backupPlanId;

  /// The date and time a backup plan is deleted, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'DeletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime deletionDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1,024 bytes long. Version Ids cannot be edited.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  DeleteBackupPlanOutput({
    this.backupPlanArn,
    this.backupPlanId,
    this.deletionDate,
    this.versionId,
  });
  factory DeleteBackupPlanOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteBackupPlanOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBackupJobOutput {
  /// Uniquely identifies a request to AWS Backup to back up a resource.
  @_s.JsonKey(name: 'BackupJobId')
  final String backupJobId;

  /// The size, in bytes, of a backup.
  @_s.JsonKey(name: 'BackupSizeInBytes')
  final int backupSizeInBytes;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  @_s.JsonKey(name: 'BackupVaultArn')
  final String backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'BackupVaultName')
  final String backupVaultName;

  /// The size in bytes transferred to a backup vault at the time that the job
  /// status was queried.
  @_s.JsonKey(name: 'BytesTransferred')
  final int bytesTransferred;

  /// The date and time that a job to create a backup job is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of
  /// <code>CreationDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CompletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completionDate;

  /// Contains identifying information about the creation of a backup job,
  /// including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>,
  /// <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup
  /// plan that is used to create it.
  @_s.JsonKey(name: 'CreatedBy')
  final RecoveryPointCreator createdBy;

  /// The date and time that a backup job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// The date and time that a job to back up resources is expected to be
  /// completed, in Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>ExpectedCompletionDate</code> is accurate to milliseconds. For
  /// example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'ExpectedCompletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime expectedCompletionDate;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// Contains an estimated percentage that is complete of a job at the time the
  /// job status was queried.
  @_s.JsonKey(name: 'PercentDone')
  final String percentDone;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  @_s.JsonKey(name: 'RecoveryPointArn')
  final String recoveryPointArn;

  /// An ARN that uniquely identifies a saved resource. The format of the ARN
  /// depends on the resource type.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The type of AWS resource to be backed-up; for example, an Amazon Elastic
  /// Block Store (Amazon EBS) volume or an Amazon Relational Database Service
  /// (Amazon RDS) database.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// Specifies the time in Unix format and Coordinated Universal Time (UTC) when
  /// a backup job must be started before it is canceled. The value is calculated
  /// by adding the start window to the scheduled time. So if the scheduled time
  /// were 6:00 PM and the start window is 2 hours, the <code>StartBy</code> time
  /// would be 8:00 PM on the date specified. The value of <code>StartBy</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'StartBy',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startBy;

  /// The current state of a resource recovery point.
  @_s.JsonKey(name: 'State')
  final BackupJobState state;

  /// A detailed message explaining the status of the job to back up a resource.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  DescribeBackupJobOutput({
    this.backupJobId,
    this.backupSizeInBytes,
    this.backupVaultArn,
    this.backupVaultName,
    this.bytesTransferred,
    this.completionDate,
    this.createdBy,
    this.creationDate,
    this.expectedCompletionDate,
    this.iamRoleArn,
    this.percentDone,
    this.recoveryPointArn,
    this.resourceArn,
    this.resourceType,
    this.startBy,
    this.state,
    this.statusMessage,
  });
  factory DescribeBackupJobOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeBackupJobOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBackupVaultOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  @_s.JsonKey(name: 'BackupVaultArn')
  final String backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'BackupVaultName')
  final String backupVaultName;

  /// The date and time that a backup vault is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of executing the operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  @_s.JsonKey(name: 'EncryptionKeyArn')
  final String encryptionKeyArn;

  /// The number of recovery points that are stored in a backup vault.
  @_s.JsonKey(name: 'NumberOfRecoveryPoints')
  final int numberOfRecoveryPoints;

  DescribeBackupVaultOutput({
    this.backupVaultArn,
    this.backupVaultName,
    this.creationDate,
    this.creatorRequestId,
    this.encryptionKeyArn,
    this.numberOfRecoveryPoints,
  });
  factory DescribeBackupVaultOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeBackupVaultOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCopyJobOutput {
  /// Contains detailed information about a copy job.
  @_s.JsonKey(name: 'CopyJob')
  final CopyJob copyJob;

  DescribeCopyJobOutput({
    this.copyJob,
  });
  factory DescribeCopyJobOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeCopyJobOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProtectedResourceOutput {
  /// The date and time that a resource was last backed up, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>LastBackupTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'LastBackupTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastBackupTime;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The type of AWS resource saved as a recovery point; for example, an EBS
  /// volume or an Amazon RDS database.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  DescribeProtectedResourceOutput({
    this.lastBackupTime,
    this.resourceArn,
    this.resourceType,
  });
  factory DescribeProtectedResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeProtectedResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRecoveryPointOutput {
  /// The size, in bytes, of a backup.
  @_s.JsonKey(name: 'BackupSizeInBytes')
  final int backupSizeInBytes;

  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  @_s.JsonKey(name: 'BackupVaultArn')
  final String backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'BackupVaultName')
  final String backupVaultName;

  /// A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code>
  /// and <code>MoveToColdStorageAt</code> timestamps.
  @_s.JsonKey(name: 'CalculatedLifecycle')
  final CalculatedLifecycle calculatedLifecycle;

  /// The date and time that a job to create a recovery point is completed, in
  /// Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CompletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completionDate;

  /// Contains identifying information about the creation of a recovery point,
  /// including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>,
  /// <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup
  /// plan used to create it.
  @_s.JsonKey(name: 'CreatedBy')
  final RecoveryPointCreator createdBy;

  /// The date and time that a recovery point is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// The server-side encryption key used to protect your backups; for example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  @_s.JsonKey(name: 'EncryptionKeyArn')
  final String encryptionKeyArn;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// A Boolean value that is returned as <code>TRUE</code> if the specified
  /// recovery point is encrypted, or <code>FALSE</code> if the recovery point is
  /// not encrypted.
  @_s.JsonKey(name: 'IsEncrypted')
  final bool isEncrypted;

  /// The date and time that a recovery point was last restored, in Unix format
  /// and Coordinated Universal Time (UTC). The value of
  /// <code>LastRestoreTime</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'LastRestoreTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastRestoreTime;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups that are transitioned to cold storage must be stored in cold storage
  /// for a minimum of 90 days. Therefore, the “expire after days” setting must be
  /// 90 days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup has
  /// been transitioned to cold.
  @_s.JsonKey(name: 'Lifecycle')
  final Lifecycle lifecycle;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  @_s.JsonKey(name: 'RecoveryPointArn')
  final String recoveryPointArn;

  /// An ARN that uniquely identifies a saved resource. The format of the ARN
  /// depends on the resource type.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The type of AWS resource to save as a recovery point; for example, an Amazon
  /// Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database
  /// Service (Amazon RDS) database.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// A status code specifying the state of the recovery point.
  /// <note>
  /// A partial status indicates that the recovery point was not successfully
  /// re-created and must be retried.
  /// </note>
  @_s.JsonKey(name: 'Status')
  final RecoveryPointStatus status;

  /// Specifies the storage class of the recovery point. Valid values are
  /// <code>WARM</code> or <code>COLD</code>.
  @_s.JsonKey(name: 'StorageClass')
  final StorageClass storageClass;

  DescribeRecoveryPointOutput({
    this.backupSizeInBytes,
    this.backupVaultArn,
    this.backupVaultName,
    this.calculatedLifecycle,
    this.completionDate,
    this.createdBy,
    this.creationDate,
    this.encryptionKeyArn,
    this.iamRoleArn,
    this.isEncrypted,
    this.lastRestoreTime,
    this.lifecycle,
    this.recoveryPointArn,
    this.resourceArn,
    this.resourceType,
    this.status,
    this.storageClass,
  });
  factory DescribeRecoveryPointOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeRecoveryPointOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRestoreJobOutput {
  /// The size, in bytes, of the restored resource.
  @_s.JsonKey(name: 'BackupSizeInBytes')
  final int backupSizeInBytes;

  /// The date and time that a job to restore a recovery point is completed, in
  /// Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CompletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completionDate;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource whose
  /// recovery point is being restored. The format of the ARN depends on the
  /// resource type of the backed-up resource.
  @_s.JsonKey(name: 'CreatedResourceArn')
  final String createdResourceArn;

  /// The date and time that a restore job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// The amount of time in minutes that a job restoring a recovery point is
  /// expected to take.
  @_s.JsonKey(name: 'ExpectedCompletionTimeMinutes')
  final int expectedCompletionTimeMinutes;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// Contains an estimated percentage that is complete of a job at the time the
  /// job status was queried.
  @_s.JsonKey(name: 'PercentDone')
  final String percentDone;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  @_s.JsonKey(name: 'RecoveryPointArn')
  final String recoveryPointArn;

  /// Uniquely identifies the job that restores a recovery point.
  @_s.JsonKey(name: 'RestoreJobId')
  final String restoreJobId;

  /// Status code specifying the state of the job that is initiated by AWS Backup
  /// to restore a recovery point.
  @_s.JsonKey(name: 'Status')
  final RestoreJobStatus status;

  /// A detailed message explaining the status of a job to restore a recovery
  /// point.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  DescribeRestoreJobOutput({
    this.backupSizeInBytes,
    this.completionDate,
    this.createdResourceArn,
    this.creationDate,
    this.expectedCompletionTimeMinutes,
    this.iamRoleArn,
    this.percentDone,
    this.recoveryPointArn,
    this.restoreJobId,
    this.status,
    this.statusMessage,
  });
  factory DescribeRestoreJobOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeRestoreJobOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportBackupPlanTemplateOutput {
  /// The body of a backup plan template in JSON format.
  /// <note>
  /// This is a signed JSON document that cannot be modified before being passed
  /// to <code>GetBackupPlanFromJSON.</code>
  /// </note>
  @_s.JsonKey(name: 'BackupPlanTemplateJson')
  final String backupPlanTemplateJson;

  ExportBackupPlanTemplateOutput({
    this.backupPlanTemplateJson,
  });
  factory ExportBackupPlanTemplateOutput.fromJson(Map<String, dynamic> json) =>
      _$ExportBackupPlanTemplateOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackupPlanFromJSONOutput {
  /// Specifies the body of a backup plan. Includes a <code>BackupPlanName</code>
  /// and one or more sets of <code>Rules</code>.
  @_s.JsonKey(name: 'BackupPlan')
  final BackupPlan backupPlan;

  GetBackupPlanFromJSONOutput({
    this.backupPlan,
  });
  factory GetBackupPlanFromJSONOutput.fromJson(Map<String, dynamic> json) =>
      _$GetBackupPlanFromJSONOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackupPlanFromTemplateOutput {
  /// Returns the body of a backup plan based on the target template, including
  /// the name, rules, and backup vault of the plan.
  @_s.JsonKey(name: 'BackupPlanDocument')
  final BackupPlan backupPlanDocument;

  GetBackupPlanFromTemplateOutput({
    this.backupPlanDocument,
  });
  factory GetBackupPlanFromTemplateOutput.fromJson(Map<String, dynamic> json) =>
      _$GetBackupPlanFromTemplateOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackupPlanOutput {
  /// Specifies the body of a backup plan. Includes a <code>BackupPlanName</code>
  /// and one or more sets of <code>Rules</code>.
  @_s.JsonKey(name: 'BackupPlan')
  final BackupPlan backupPlan;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  @_s.JsonKey(name: 'BackupPlanArn')
  final String backupPlanArn;

  /// Uniquely identifies a backup plan.
  @_s.JsonKey(name: 'BackupPlanId')
  final String backupPlanId;

  /// The date and time that a backup plan is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of executing the operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// The date and time that a backup plan is deleted, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'DeletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime deletionDate;

  /// The last time a job to back up resources was executed with this backup plan.
  /// A date and time, in Unix format and Coordinated Universal Time (UTC). The
  /// value of <code>LastExecutionDate</code> is accurate to milliseconds. For
  /// example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'LastExecutionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastExecutionDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1,024 bytes long. Version IDs cannot be edited.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  GetBackupPlanOutput({
    this.backupPlan,
    this.backupPlanArn,
    this.backupPlanId,
    this.creationDate,
    this.creatorRequestId,
    this.deletionDate,
    this.lastExecutionDate,
    this.versionId,
  });
  factory GetBackupPlanOutput.fromJson(Map<String, dynamic> json) =>
      _$GetBackupPlanOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackupSelectionOutput {
  /// Uniquely identifies a backup plan.
  @_s.JsonKey(name: 'BackupPlanId')
  final String backupPlanId;

  /// Specifies the body of a request to assign a set of resources to a backup
  /// plan.
  @_s.JsonKey(name: 'BackupSelection')
  final BackupSelection backupSelection;

  /// The date and time a backup selection is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of executing the operation twice.
  @_s.JsonKey(name: 'CreatorRequestId')
  final String creatorRequestId;

  /// Uniquely identifies the body of a request to assign a set of resources to a
  /// backup plan.
  @_s.JsonKey(name: 'SelectionId')
  final String selectionId;

  GetBackupSelectionOutput({
    this.backupPlanId,
    this.backupSelection,
    this.creationDate,
    this.creatorRequestId,
    this.selectionId,
  });
  factory GetBackupSelectionOutput.fromJson(Map<String, dynamic> json) =>
      _$GetBackupSelectionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackupVaultAccessPolicyOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  @_s.JsonKey(name: 'BackupVaultArn')
  final String backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'BackupVaultName')
  final String backupVaultName;

  /// The backup vault access policy document in JSON format.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  GetBackupVaultAccessPolicyOutput({
    this.backupVaultArn,
    this.backupVaultName,
    this.policy,
  });
  factory GetBackupVaultAccessPolicyOutput.fromJson(
          Map<String, dynamic> json) =>
      _$GetBackupVaultAccessPolicyOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackupVaultNotificationsOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  @_s.JsonKey(name: 'BackupVaultArn')
  final String backupVaultArn;

  /// An array of events that indicate the status of jobs to back up resources to
  /// the backup vault.
  @_s.JsonKey(name: 'BackupVaultEvents')
  final List<String> backupVaultEvents;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'BackupVaultName')
  final String backupVaultName;

  /// An ARN that uniquely identifies an Amazon Simple Notification Service
  /// (Amazon SNS) topic; for example,
  /// <code>arn:aws:sns:us-west-2:111122223333:MyTopic</code>.
  @_s.JsonKey(name: 'SNSTopicArn')
  final String sNSTopicArn;

  GetBackupVaultNotificationsOutput({
    this.backupVaultArn,
    this.backupVaultEvents,
    this.backupVaultName,
    this.sNSTopicArn,
  });
  factory GetBackupVaultNotificationsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$GetBackupVaultNotificationsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRecoveryPointRestoreMetadataOutput {
  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  @_s.JsonKey(name: 'BackupVaultArn')
  final String backupVaultArn;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  @_s.JsonKey(name: 'RecoveryPointArn')
  final String recoveryPointArn;

  /// The set of metadata key-value pairs that describes the original
  /// configuration of the backed-up resource. These values vary depending on the
  /// service that is being restored.
  @_s.JsonKey(name: 'RestoreMetadata')
  final Map<String, String> restoreMetadata;

  GetRecoveryPointRestoreMetadataOutput({
    this.backupVaultArn,
    this.recoveryPointArn,
    this.restoreMetadata,
  });
  factory GetRecoveryPointRestoreMetadataOutput.fromJson(
          Map<String, dynamic> json) =>
      _$GetRecoveryPointRestoreMetadataOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSupportedResourceTypesOutput {
  /// Contains a string with the supported AWS resource types:
  ///
  /// <ul>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for AWS Storage Gateway
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>DDB</code> for Amazon DynamoDB
  /// </li>
  /// <li>
  /// <code>EFS</code> for Amazon Elastic File System
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ResourceTypes')
  final List<String> resourceTypes;

  GetSupportedResourceTypesOutput({
    this.resourceTypes,
  });
  factory GetSupportedResourceTypesOutput.fromJson(Map<String, dynamic> json) =>
      _$GetSupportedResourceTypesOutputFromJson(json);
}

/// Contains an array of <code>Transition</code> objects specifying how long in
/// days before a recovery point transitions to cold storage or is deleted.
///
/// Backups transitioned to cold storage must be stored in cold storage for a
/// minimum of 90 days. Therefore, on the console, the “expire after days”
/// setting must be 90 days greater than the “transition to cold after days”
/// setting. The “transition to cold after days” setting cannot be changed after
/// a backup has been transitioned to cold.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Lifecycle {
  /// Specifies the number of days after creation that a recovery point is
  /// deleted. Must be greater than 90 days plus
  /// <code>MoveToColdStorageAfterDays</code>.
  @_s.JsonKey(name: 'DeleteAfterDays')
  final int deleteAfterDays;

  /// Specifies the number of days after creation that a recovery point is moved
  /// to cold storage.
  @_s.JsonKey(name: 'MoveToColdStorageAfterDays')
  final int moveToColdStorageAfterDays;

  Lifecycle({
    this.deleteAfterDays,
    this.moveToColdStorageAfterDays,
  });
  factory Lifecycle.fromJson(Map<String, dynamic> json) =>
      _$LifecycleFromJson(json);

  Map<String, dynamic> toJson() => _$LifecycleToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBackupJobsOutput {
  /// An array of structures containing metadata about your backup jobs returned
  /// in JSON format.
  @_s.JsonKey(name: 'BackupJobs')
  final List<BackupJob> backupJobs;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListBackupJobsOutput({
    this.backupJobs,
    this.nextToken,
  });
  factory ListBackupJobsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBackupJobsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBackupPlanTemplatesOutput {
  /// An array of template list items containing metadata about your saved
  /// templates.
  @_s.JsonKey(name: 'BackupPlanTemplatesList')
  final List<BackupPlanTemplatesListMember> backupPlanTemplatesList;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListBackupPlanTemplatesOutput({
    this.backupPlanTemplatesList,
    this.nextToken,
  });
  factory ListBackupPlanTemplatesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBackupPlanTemplatesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBackupPlanVersionsOutput {
  /// An array of version list items containing metadata about your backup plans.
  @_s.JsonKey(name: 'BackupPlanVersionsList')
  final List<BackupPlansListMember> backupPlanVersionsList;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListBackupPlanVersionsOutput({
    this.backupPlanVersionsList,
    this.nextToken,
  });
  factory ListBackupPlanVersionsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBackupPlanVersionsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBackupPlansOutput {
  /// An array of backup plan list items containing metadata about your saved
  /// backup plans.
  @_s.JsonKey(name: 'BackupPlansList')
  final List<BackupPlansListMember> backupPlansList;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListBackupPlansOutput({
    this.backupPlansList,
    this.nextToken,
  });
  factory ListBackupPlansOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBackupPlansOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBackupSelectionsOutput {
  /// An array of backup selection list items containing metadata about each
  /// resource in the list.
  @_s.JsonKey(name: 'BackupSelectionsList')
  final List<BackupSelectionsListMember> backupSelectionsList;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListBackupSelectionsOutput({
    this.backupSelectionsList,
    this.nextToken,
  });
  factory ListBackupSelectionsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBackupSelectionsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBackupVaultsOutput {
  /// An array of backup vault list members containing vault metadata, including
  /// Amazon Resource Name (ARN), display name, creation date, number of saved
  /// recovery points, and encryption information if the resources saved in the
  /// backup vault are encrypted.
  @_s.JsonKey(name: 'BackupVaultList')
  final List<BackupVaultListMember> backupVaultList;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListBackupVaultsOutput({
    this.backupVaultList,
    this.nextToken,
  });
  factory ListBackupVaultsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBackupVaultsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCopyJobsOutput {
  /// An array of structures containing metadata about your copy jobs returned in
  /// JSON format.
  @_s.JsonKey(name: 'CopyJobs')
  final List<CopyJob> copyJobs;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return maxResults number of items, NextToken allows you
  /// to return more items in your list starting at the location pointed to by the
  /// next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCopyJobsOutput({
    this.copyJobs,
    this.nextToken,
  });
  factory ListCopyJobsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListCopyJobsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProtectedResourcesOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of resources successfully backed up by AWS Backup including the
  /// time the resource was saved, an Amazon Resource Name (ARN) of the resource,
  /// and a resource type.
  @_s.JsonKey(name: 'Results')
  final List<ProtectedResource> results;

  ListProtectedResourcesOutput({
    this.nextToken,
    this.results,
  });
  factory ListProtectedResourcesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListProtectedResourcesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRecoveryPointsByBackupVaultOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of objects that contain detailed information about recovery points
  /// saved in a backup vault.
  @_s.JsonKey(name: 'RecoveryPoints')
  final List<RecoveryPointByBackupVault> recoveryPoints;

  ListRecoveryPointsByBackupVaultOutput({
    this.nextToken,
    this.recoveryPoints,
  });
  factory ListRecoveryPointsByBackupVaultOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListRecoveryPointsByBackupVaultOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRecoveryPointsByResourceOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of objects that contain detailed information about recovery points
  /// of the specified resource type.
  @_s.JsonKey(name: 'RecoveryPoints')
  final List<RecoveryPointByResource> recoveryPoints;

  ListRecoveryPointsByResourceOutput({
    this.nextToken,
    this.recoveryPoints,
  });
  factory ListRecoveryPointsByResourceOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListRecoveryPointsByResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRestoreJobsOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of objects that contain detailed information about jobs to restore
  /// saved resources.
  @_s.JsonKey(name: 'RestoreJobs')
  final List<RestoreJobsListMember> restoreJobs;

  ListRestoreJobsOutput({
    this.nextToken,
    this.restoreJobs,
  });
  factory ListRestoreJobsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListRestoreJobsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// To help organize your resources, you can assign your own metadata to the
  /// resources you create. Each tag is a key-value pair.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsOutput({
    this.nextToken,
    this.tags,
  });
  factory ListTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsOutputFromJson(json);
}

/// A structure that contains information about a backed-up resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProtectedResource {
  /// The date and time a resource was last backed up, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>LastBackupTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'LastBackupTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastBackupTime;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The type of AWS resource; for example, an Amazon Elastic Block Store (Amazon
  /// EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  ProtectedResource({
    this.lastBackupTime,
    this.resourceArn,
    this.resourceType,
  });
  factory ProtectedResource.fromJson(Map<String, dynamic> json) =>
      _$ProtectedResourceFromJson(json);
}

/// Contains detailed information about the recovery points stored in a backup
/// vault.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecoveryPointByBackupVault {
  /// The size, in bytes, of a backup.
  @_s.JsonKey(name: 'BackupSizeInBytes')
  final int backupSizeInBytes;

  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  @_s.JsonKey(name: 'BackupVaultArn')
  final String backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'BackupVaultName')
  final String backupVaultName;

  /// A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code>
  /// and <code>MoveToColdStorageAt</code> timestamps.
  @_s.JsonKey(name: 'CalculatedLifecycle')
  final CalculatedLifecycle calculatedLifecycle;

  /// The date and time a job to restore a recovery point is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CompletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completionDate;

  /// Contains identifying information about the creation of a recovery point,
  /// including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>,
  /// <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup
  /// plan that is used to create it.
  @_s.JsonKey(name: 'CreatedBy')
  final RecoveryPointCreator createdBy;

  /// The date and time a recovery point is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  @_s.JsonKey(name: 'EncryptionKeyArn')
  final String encryptionKeyArn;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// A Boolean value that is returned as <code>TRUE</code> if the specified
  /// recovery point is encrypted, or <code>FALSE</code> if the recovery point is
  /// not encrypted.
  @_s.JsonKey(name: 'IsEncrypted')
  final bool isEncrypted;

  /// The date and time a recovery point was last restored, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>LastRestoreTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'LastRestoreTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastRestoreTime;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup has
  /// been transitioned to cold.
  @_s.JsonKey(name: 'Lifecycle')
  final Lifecycle lifecycle;

  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  @_s.JsonKey(name: 'RecoveryPointArn')
  final String recoveryPointArn;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The type of AWS resource saved as a recovery point; for example, an Amazon
  /// Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database
  /// Service (Amazon RDS) database.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// A status code specifying the state of the recovery point.
  @_s.JsonKey(name: 'Status')
  final RecoveryPointStatus status;

  RecoveryPointByBackupVault({
    this.backupSizeInBytes,
    this.backupVaultArn,
    this.backupVaultName,
    this.calculatedLifecycle,
    this.completionDate,
    this.createdBy,
    this.creationDate,
    this.encryptionKeyArn,
    this.iamRoleArn,
    this.isEncrypted,
    this.lastRestoreTime,
    this.lifecycle,
    this.recoveryPointArn,
    this.resourceArn,
    this.resourceType,
    this.status,
  });
  factory RecoveryPointByBackupVault.fromJson(Map<String, dynamic> json) =>
      _$RecoveryPointByBackupVaultFromJson(json);
}

/// Contains detailed information about a saved recovery point.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecoveryPointByResource {
  /// The size, in bytes, of a backup.
  @_s.JsonKey(name: 'BackupSizeBytes')
  final int backupSizeBytes;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  @_s.JsonKey(name: 'BackupVaultName')
  final String backupVaultName;

  /// The date and time a recovery point is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  @_s.JsonKey(name: 'EncryptionKeyArn')
  final String encryptionKeyArn;

  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  @_s.JsonKey(name: 'RecoveryPointArn')
  final String recoveryPointArn;

  /// A status code specifying the state of the recovery point.
  @_s.JsonKey(name: 'Status')
  final RecoveryPointStatus status;

  RecoveryPointByResource({
    this.backupSizeBytes,
    this.backupVaultName,
    this.creationDate,
    this.encryptionKeyArn,
    this.recoveryPointArn,
    this.status,
  });
  factory RecoveryPointByResource.fromJson(Map<String, dynamic> json) =>
      _$RecoveryPointByResourceFromJson(json);
}

/// Contains information about the backup plan and rule that AWS Backup used to
/// initiate the recovery point backup.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecoveryPointCreator {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  @_s.JsonKey(name: 'BackupPlanArn')
  final String backupPlanArn;

  /// Uniquely identifies a backup plan.
  @_s.JsonKey(name: 'BackupPlanId')
  final String backupPlanId;

  /// Version IDs are unique, randomly generated, Unicode, UTF-8 encoded strings
  /// that are at most 1,024 bytes long. They cannot be edited.
  @_s.JsonKey(name: 'BackupPlanVersion')
  final String backupPlanVersion;

  /// Uniquely identifies a rule used to schedule the backup of a selection of
  /// resources.
  @_s.JsonKey(name: 'BackupRuleId')
  final String backupRuleId;

  RecoveryPointCreator({
    this.backupPlanArn,
    this.backupPlanId,
    this.backupPlanVersion,
    this.backupRuleId,
  });
  factory RecoveryPointCreator.fromJson(Map<String, dynamic> json) =>
      _$RecoveryPointCreatorFromJson(json);
}

enum RecoveryPointStatus {
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('PARTIAL')
  partial,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('EXPIRED')
  expired,
}

enum RestoreJobStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('ABORTED')
  aborted,
  @_s.JsonValue('FAILED')
  failed,
}

/// Contains metadata about a restore job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestoreJobsListMember {
  /// The size, in bytes, of the restored resource.
  @_s.JsonKey(name: 'BackupSizeInBytes')
  final int backupSizeInBytes;

  /// The date and time a job to restore a recovery point is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CompletionDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completionDate;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  @_s.JsonKey(name: 'CreatedResourceArn')
  final String createdResourceArn;

  /// The date and time a restore job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// The amount of time in minutes that a job restoring a recovery point is
  /// expected to take.
  @_s.JsonKey(name: 'ExpectedCompletionTimeMinutes')
  final int expectedCompletionTimeMinutes;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// Contains an estimated percentage complete of a job at the time the job
  /// status was queried.
  @_s.JsonKey(name: 'PercentDone')
  final String percentDone;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  @_s.JsonKey(name: 'RecoveryPointArn')
  final String recoveryPointArn;

  /// Uniquely identifies the job that restores a recovery point.
  @_s.JsonKey(name: 'RestoreJobId')
  final String restoreJobId;

  /// A status code specifying the state of the job initiated by AWS Backup to
  /// restore a recovery point.
  @_s.JsonKey(name: 'Status')
  final RestoreJobStatus status;

  /// A detailed message explaining the status of the job to restore a recovery
  /// point.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  RestoreJobsListMember({
    this.backupSizeInBytes,
    this.completionDate,
    this.createdResourceArn,
    this.creationDate,
    this.expectedCompletionTimeMinutes,
    this.iamRoleArn,
    this.percentDone,
    this.recoveryPointArn,
    this.restoreJobId,
    this.status,
    this.statusMessage,
  });
  factory RestoreJobsListMember.fromJson(Map<String, dynamic> json) =>
      _$RestoreJobsListMemberFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartBackupJobOutput {
  /// Uniquely identifies a request to AWS Backup to back up a resource.
  @_s.JsonKey(name: 'BackupJobId')
  final String backupJobId;

  /// The date and time that a backup job is started, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  @_s.JsonKey(name: 'RecoveryPointArn')
  final String recoveryPointArn;

  StartBackupJobOutput({
    this.backupJobId,
    this.creationDate,
    this.recoveryPointArn,
  });
  factory StartBackupJobOutput.fromJson(Map<String, dynamic> json) =>
      _$StartBackupJobOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartCopyJobOutput {
  /// Uniquely identifies a request to AWS Backup to copy a resource.
  @_s.JsonKey(name: 'CopyJobId')
  final String copyJobId;

  /// The date and time that a backup job is started, in Unix format and
  /// Coordinated Universal Time (UTC). The value of CreationDate is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM. &gt;
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  StartCopyJobOutput({
    this.copyJobId,
    this.creationDate,
  });
  factory StartCopyJobOutput.fromJson(Map<String, dynamic> json) =>
      _$StartCopyJobOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartRestoreJobOutput {
  /// Uniquely identifies the job that restores a recovery point.
  @_s.JsonKey(name: 'RestoreJobId')
  final String restoreJobId;

  StartRestoreJobOutput({
    this.restoreJobId,
  });
  factory StartRestoreJobOutput.fromJson(Map<String, dynamic> json) =>
      _$StartRestoreJobOutputFromJson(json);
}

enum StorageClass {
  @_s.JsonValue('WARM')
  warm,
  @_s.JsonValue('COLD')
  cold,
  @_s.JsonValue('DELETED')
  deleted,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBackupPlanOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  @_s.JsonKey(name: 'BackupPlanArn')
  final String backupPlanArn;

  /// Uniquely identifies a backup plan.
  @_s.JsonKey(name: 'BackupPlanId')
  final String backupPlanId;

  /// The date and time a backup plan is updated, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  @_s.JsonKey(
      name: 'CreationDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1,024 bytes long. Version Ids cannot be edited.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  UpdateBackupPlanOutput({
    this.backupPlanArn,
    this.backupPlanId,
    this.creationDate,
    this.versionId,
  });
  factory UpdateBackupPlanOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateBackupPlanOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRecoveryPointLifecycleOutput {
  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  @_s.JsonKey(name: 'BackupVaultArn')
  final String backupVaultArn;

  /// A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code>
  /// and <code>MoveToColdStorageAt</code> timestamps.
  @_s.JsonKey(name: 'CalculatedLifecycle')
  final CalculatedLifecycle calculatedLifecycle;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup has
  /// been transitioned to cold.
  @_s.JsonKey(name: 'Lifecycle')
  final Lifecycle lifecycle;

  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  @_s.JsonKey(name: 'RecoveryPointArn')
  final String recoveryPointArn;

  UpdateRecoveryPointLifecycleOutput({
    this.backupVaultArn,
    this.calculatedLifecycle,
    this.lifecycle,
    this.recoveryPointArn,
  });
  factory UpdateRecoveryPointLifecycleOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateRecoveryPointLifecycleOutputFromJson(json);
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String type, String message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class DependencyFailureException extends _s.GenericAwsException {
  DependencyFailureException({String type, String message})
      : super(type: type, code: 'DependencyFailureException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MissingParameterValueException extends _s.GenericAwsException {
  MissingParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'MissingParameterValueException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'DependencyFailureException': (type, message) =>
      DependencyFailureException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MissingParameterValueException': (type, message) =>
      MissingParameterValueException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
};
