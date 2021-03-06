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

part 'workmail-2017-10-01.g.dart';

/// Amazon WorkMail is a secure, managed business email and calendaring service
/// with support for existing desktop and mobile email clients. You can access
/// your email, contacts, and calendars using Microsoft Outlook, your browser,
/// or other native iOS and Android email applications. You can integrate
/// WorkMail with your existing corporate directory and control both the keys
/// that encrypt your data and the location in which your data is stored.
///
/// The WorkMail API is designed for the following scenarios:
///
/// <ul>
/// <li>
/// Listing and describing organizations
/// </li>
/// </ul>
/// <ul>
/// <li>
/// Managing users
/// </li>
/// </ul>
/// <ul>
/// <li>
/// Managing groups
/// </li>
/// </ul>
/// <ul>
/// <li>
/// Managing resources
/// </li>
/// </ul>
/// All WorkMail API operations are Amazon-authenticated and certificate-signed.
/// They not only require the use of the AWS SDK, but also allow for the
/// exclusive use of AWS Identity and Access Management users and roles to help
/// facilitate access, trust, and permission policies. By creating a role and
/// allowing an IAM user to access the WorkMail site, the IAM user gains full
/// administrative visibility into the entire WorkMail organization (or as set
/// in the IAM policy). This includes, but is not limited to, the ability to
/// create, update, and delete users, groups, and resources. This allows
/// developers to perform the scenarios listed above, as well as give users the
/// ability to grant access on a selective basis using the IAM model.
class WorkMail {
  final _s.JsonProtocol _protocol;
  WorkMail({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'workmail',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds a member (user or group) to the resource's set of delegates.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The member (user or group) to associate to the resource.
  ///
  /// Parameter [organizationId] :
  /// The organization under which the resource exists.
  ///
  /// Parameter [resourceId] :
  /// The resource for which members (users or groups) are associated.
  Future<void> associateDelegateToResource({
    @_s.required String entityId,
    @_s.required String organizationId,
    @_s.required String resourceId,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^r-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.AssociateDelegateToResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
      },
    );

    return AssociateDelegateToResourceResponse.fromJson(jsonResponse.body);
  }

  /// Adds a member (user or group) to the group's set.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [groupId] :
  /// The group to which the member (user or group) is associated.
  ///
  /// Parameter [memberId] :
  /// The member (user or group) to associate to the group.
  ///
  /// Parameter [organizationId] :
  /// The organization under which the group exists.
  Future<void> associateMemberToGroup({
    @_s.required String groupId,
    @_s.required String memberId,
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringLength(
      'memberId',
      memberId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.AssociateMemberToGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'MemberId': memberId,
        'OrganizationId': organizationId,
      },
    );

    return AssociateMemberToGroupResponse.fromJson(jsonResponse.body);
  }

  /// Adds an alias to the set of a given member (user or group) of Amazon
  /// WorkMail.
  ///
  /// May throw [EmailAddressInUseException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [MailDomainNotFoundException].
  /// May throw [MailDomainStateException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [alias] :
  /// The alias to add to the member set.
  ///
  /// Parameter [entityId] :
  /// The member (user or group) to which this alias is added.
  ///
  /// Parameter [organizationId] :
  /// The organization under which the member (user or group) exists.
  Future<void> createAlias({
    @_s.required String alias,
    @_s.required String entityId,
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(alias, 'alias');
    _s.validateStringLength(
      'alias',
      alias,
      1,
      254,
      isRequired: true,
    );
    _s.validateStringPattern(
      'alias',
      alias,
      r'''[a-zA-Z0-9._%+-]{1,64}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Alias': alias,
        'EntityId': entityId,
        'OrganizationId': organizationId,
      },
    );

    return CreateAliasResponse.fromJson(jsonResponse.body);
  }

  /// Creates a group that can be used in Amazon WorkMail by calling the
  /// <a>RegisterToWorkMail</a> operation.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [NameAvailabilityException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ReservedNameException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [name] :
  /// The name of the group.
  ///
  /// Parameter [organizationId] :
  /// The organization under which the group is to be created.
  Future<CreateGroupResponse> createGroup({
    @_s.required String name,
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'OrganizationId': organizationId,
      },
    );

    return CreateGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon WorkMail resource.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [NameAvailabilityException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ReservedNameException].
  ///
  /// Parameter [name] :
  /// The name of the new resource.
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization for which the resource is
  /// created.
  ///
  /// Parameter [type] :
  /// The type of the new resource. The available types are
  /// <code>equipment</code> and <code>room</code>.
  Future<CreateResourceResponse> createResource({
    @_s.required String name,
    @_s.required String organizationId,
    @_s.required ResourceType type,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\w\-.]+(@[a-zA-Z0-9.\-]+\.[a-zA-Z0-9]{2,})?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'OrganizationId': organizationId,
        'Type': type?.toValue(),
      },
    );

    return CreateResourceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a user who can be used in Amazon WorkMail by calling the
  /// <a>RegisterToWorkMail</a> operation.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPasswordException].
  /// May throw [NameAvailabilityException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ReservedNameException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [displayName] :
  /// The display name for the new user.
  ///
  /// Parameter [name] :
  /// The name for the new user. Simple AD or AD Connector user names have a
  /// maximum length of 20. All others have a maximum length of 64.
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization for which the user is created.
  ///
  /// Parameter [password] :
  /// The password for the new user.
  Future<CreateUserResponse> createUser({
    @_s.required String displayName,
    @_s.required String name,
    @_s.required String organizationId,
    @_s.required String password,
  }) async {
    ArgumentError.checkNotNull(displayName, 'displayName');
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\w\-.]+(@[a-zA-Z0-9.\-]+\.[a-zA-Z0-9]{2,})?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DisplayName': displayName,
        'Name': name,
        'OrganizationId': organizationId,
        'Password': password,
      },
    );

    return CreateUserResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an access control rule for the specified WorkMail organization.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [name] :
  /// The name of the access control rule.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization.
  Future<void> deleteAccessControlRule({
    @_s.required String name,
    String organizationId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteAccessControlRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'OrganizationId': organizationId,
      },
    );

    return DeleteAccessControlRuleResponse.fromJson(jsonResponse.body);
  }

  /// Remove one or more specified aliases from a set of aliases for a given
  /// user.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [alias] :
  /// The aliases to be removed from the user's set of aliases. Duplicate
  /// entries in the list are collapsed into single entries (the list is
  /// transformed into a set).
  ///
  /// Parameter [entityId] :
  /// The identifier for the member (user or group) from which to have the
  /// aliases removed.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the user exists.
  Future<void> deleteAlias({
    @_s.required String alias,
    @_s.required String entityId,
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(alias, 'alias');
    _s.validateStringLength(
      'alias',
      alias,
      1,
      254,
      isRequired: true,
    );
    _s.validateStringPattern(
      'alias',
      alias,
      r'''[a-zA-Z0-9._%+-]{1,64}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Alias': alias,
        'EntityId': entityId,
        'OrganizationId': organizationId,
      },
    );

    return DeleteAliasResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a group from Amazon WorkMail.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [groupId] :
  /// The identifier of the group to be deleted.
  ///
  /// Parameter [organizationId] :
  /// The organization that contains the group.
  Future<void> deleteGroup({
    @_s.required String groupId,
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'OrganizationId': organizationId,
      },
    );

    return DeleteGroupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes permissions granted to a member (user or group).
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier of the member (user or group)that owns the mailbox.
  ///
  /// Parameter [granteeId] :
  /// The identifier of the member (user or group) for which to delete granted
  /// permissions.
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization under which the member (user or group)
  /// exists.
  Future<void> deleteMailboxPermissions({
    @_s.required String entityId,
    @_s.required String granteeId,
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(granteeId, 'granteeId');
    _s.validateStringLength(
      'granteeId',
      granteeId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteMailboxPermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'GranteeId': granteeId,
        'OrganizationId': organizationId,
      },
    );

    return DeleteMailboxPermissionsResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified resource.
  ///
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization from which the resource is
  /// deleted.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource to be deleted.
  Future<void> deleteResource({
    @_s.required String organizationId,
    @_s.required String resourceId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^r-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
      },
    );

    return DeleteResourceResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a user from Amazon WorkMail and all subsequent systems. Before you
  /// can delete a user, the user state must be <code>DISABLED</code>. Use the
  /// <a>DescribeUser</a> action to confirm the user state.
  ///
  /// Deleting a user is permanent and cannot be undone. WorkMail archives user
  /// mailboxes for 30 days before they are permanently removed.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [organizationId] :
  /// The organization that contains the user to be deleted.
  ///
  /// Parameter [userId] :
  /// The identifier of the user to be deleted.
  Future<void> deleteUser({
    @_s.required String organizationId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );

    return DeleteUserResponse.fromJson(jsonResponse.body);
  }

  /// Mark a user, group, or resource as no longer used in Amazon WorkMail. This
  /// action disassociates the mailbox and schedules it for clean-up. WorkMail
  /// keeps mailboxes for 30 days before they are permanently removed. The
  /// functionality in the console is <i>Disable</i>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier for the member (user or group) to be updated.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the Amazon WorkMail entity
  /// exists.
  Future<void> deregisterFromWorkMail({
    @_s.required String entityId,
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeregisterFromWorkMail'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'OrganizationId': organizationId,
      },
    );

    return DeregisterFromWorkMailResponse.fromJson(jsonResponse.body);
  }

  /// Returns the data available for the group.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [groupId] :
  /// The identifier for the group to be described.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the group exists.
  Future<DescribeGroupResponse> describeGroup({
    @_s.required String groupId,
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'OrganizationId': organizationId,
      },
    );

    return DescribeGroupResponse.fromJson(jsonResponse.body);
  }

  /// Provides more information regarding a given organization based on its
  /// identifier.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization to be described.
  Future<DescribeOrganizationResponse> describeOrganization({
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
      },
    );

    return DescribeOrganizationResponse.fromJson(jsonResponse.body);
  }

  /// Returns the data available for the resource.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization for which the resource is
  /// described.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource to be described.
  Future<DescribeResourceResponse> describeResource({
    @_s.required String organizationId,
    @_s.required String resourceId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^r-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
      },
    );

    return DescribeResourceResponse.fromJson(jsonResponse.body);
  }

  /// Provides information regarding the user.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the user exists.
  ///
  /// Parameter [userId] :
  /// The identifier for the user to be described.
  Future<DescribeUserResponse> describeUser({
    @_s.required String organizationId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );

    return DescribeUserResponse.fromJson(jsonResponse.body);
  }

  /// Removes a member from the resource's set of delegates.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier for the member (user, group) to be removed from the
  /// resource's delegates.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the resource exists.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource from which delegates' set members are
  /// removed.
  Future<void> disassociateDelegateFromResource({
    @_s.required String entityId,
    @_s.required String organizationId,
    @_s.required String resourceId,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^r-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DisassociateDelegateFromResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
      },
    );

    return DisassociateDelegateFromResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes a member from a group.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [groupId] :
  /// The identifier for the group from which members are removed.
  ///
  /// Parameter [memberId] :
  /// The identifier for the member to be removed to the group.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the group exists.
  Future<void> disassociateMemberFromGroup({
    @_s.required String groupId,
    @_s.required String memberId,
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringLength(
      'memberId',
      memberId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DisassociateMemberFromGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'MemberId': memberId,
        'OrganizationId': organizationId,
      },
    );

    return DisassociateMemberFromGroupResponse.fromJson(jsonResponse.body);
  }

  /// Gets the effects of an organization's access control rules as they apply
  /// to a specified IPv4 address, access protocol action, or user ID.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [action] :
  /// The access protocol action. Valid values include <code>ActiveSync</code>,
  /// <code>AutoDiscover</code>, <code>EWS</code>, <code>IMAP</code>,
  /// <code>SMTP</code>, <code>WindowsOutlook</code>, and <code>WebMail</code>.
  ///
  /// Parameter [ipAddress] :
  /// The IPv4 address.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization.
  ///
  /// Parameter [userId] :
  /// The user ID.
  Future<GetAccessControlEffectResponse> getAccessControlEffect({
    @_s.required String action,
    @_s.required String ipAddress,
    @_s.required String organizationId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    _s.validateStringLength(
      'action',
      action,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'action',
      action,
      r'''[a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(ipAddress, 'ipAddress');
    _s.validateStringLength(
      'ipAddress',
      ipAddress,
      1,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ipAddress',
      ipAddress,
      r'''^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.GetAccessControlEffect'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Action': action,
        'IpAddress': ipAddress,
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );

    return GetAccessControlEffectResponse.fromJson(jsonResponse.body);
  }

  /// Requests a user's mailbox details for a specified organization and user.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization that contains the user whose mailbox
  /// details are being requested.
  ///
  /// Parameter [userId] :
  /// The identifier for the user whose mailbox details are being requested.
  Future<GetMailboxDetailsResponse> getMailboxDetails({
    @_s.required String organizationId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.GetMailboxDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );

    return GetMailboxDetailsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the access control rules for the specified organization.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization.
  Future<ListAccessControlRulesResponse> listAccessControlRules({
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListAccessControlRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
      },
    );

    return ListAccessControlRulesResponse.fromJson(jsonResponse.body);
  }

  /// Creates a paginated call to list the aliases associated with a given
  /// entity.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier for the entity for which to list the aliases.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the entity exists.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListAliasesResponse> listAliases({
    @_s.required String entityId,
    @_s.required String organizationId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListAliases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'OrganizationId': organizationId,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListAliasesResponse.fromJson(jsonResponse.body);
  }

  /// Returns an overview of the members of a group. Users and groups can be
  /// members of a group.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [groupId] :
  /// The identifier for the group to which the members (users or groups) are
  /// associated.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the group exists.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListGroupMembersResponse> listGroupMembers({
    @_s.required String groupId,
    @_s.required String organizationId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListGroupMembers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'OrganizationId': organizationId,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListGroupMembersResponse.fromJson(jsonResponse.body);
  }

  /// Returns summaries of the organization's groups.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the groups exist.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListGroupsResponse> listGroups({
    @_s.required String organizationId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the mailbox permissions associated with a user, group, or resource
  /// mailbox.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier of the user, group, or resource for which to list mailbox
  /// permissions.
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization under which the user, group, or
  /// resource exists.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListMailboxPermissionsResponse> listMailboxPermissions({
    @_s.required String entityId,
    @_s.required String organizationId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListMailboxPermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'OrganizationId': organizationId,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListMailboxPermissionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns summaries of the customer's non-deleted organizations.
  ///
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListOrganizationsResponse> listOrganizations({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListOrganizations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListOrganizationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the delegates associated with a resource. Users and groups can be
  /// resource delegates and answer requests on behalf of the resource.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization that contains the resource for which
  /// delegates are listed.
  ///
  /// Parameter [resourceId] :
  /// The identifier for the resource whose delegates are listed.
  ///
  /// Parameter [maxResults] :
  /// The number of maximum results in a page.
  ///
  /// Parameter [nextToken] :
  /// The token used to paginate through the delegates associated with a
  /// resource.
  Future<ListResourceDelegatesResponse> listResourceDelegates({
    @_s.required String organizationId,
    @_s.required String resourceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      12,
      256,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListResourceDelegates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListResourceDelegatesResponse.fromJson(jsonResponse.body);
  }

  /// Returns summaries of the organization's resources.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the resources exist.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListResourcesResponse> listResources({
    @_s.required String organizationId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListResourcesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags applied to an Amazon WorkMail organization resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Returns summaries of the organization's users.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the users exist.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListUsersResponse> listUsers({
    @_s.required String organizationId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListUsers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListUsersResponse.fromJson(jsonResponse.body);
  }

  /// Adds a new access control rule for the specified organization. The rule
  /// allows or denies access to the organization for the specified IPv4
  /// addresses, access protocol actions, and user IDs. Adding a new rule with
  /// the same name as an existing rule replaces the older rule.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [EntityNotFoundException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [description] :
  /// The rule description.
  ///
  /// Parameter [effect] :
  /// The rule effect.
  ///
  /// Parameter [name] :
  /// The rule name.
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization.
  ///
  /// Parameter [actions] :
  /// Access protocol actions to include in the rule. Valid values include
  /// <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>,
  /// <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and
  /// <code>WebMail</code>.
  ///
  /// Parameter [ipRanges] :
  /// IPv4 CIDR ranges to include in the rule.
  ///
  /// Parameter [notActions] :
  /// Access protocol actions to exclude from the rule. Valid values include
  /// <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>,
  /// <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and
  /// <code>WebMail</code>.
  ///
  /// Parameter [notIpRanges] :
  /// IPv4 CIDR ranges to exclude from the rule.
  ///
  /// Parameter [notUserIds] :
  /// User IDs to exclude from the rule.
  ///
  /// Parameter [userIds] :
  /// User IDs to include in the rule.
  Future<void> putAccessControlRule({
    @_s.required String description,
    @_s.required AccessControlRuleEffect effect,
    @_s.required String name,
    @_s.required String organizationId,
    List<String> actions,
    List<String> ipRanges,
    List<String> notActions,
    List<String> notIpRanges,
    List<String> notUserIds,
    List<String> userIds,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      0,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(effect, 'effect');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.PutAccessControlRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Description': description,
        'Effect': effect?.toValue(),
        'Name': name,
        'OrganizationId': organizationId,
        'Actions': actions,
        'IpRanges': ipRanges,
        'NotActions': notActions,
        'NotIpRanges': notIpRanges,
        'NotUserIds': notUserIds,
        'UserIds': userIds,
      },
    );

    return PutAccessControlRuleResponse.fromJson(jsonResponse.body);
  }

  /// Sets permissions for a user, group, or resource. This replaces any
  /// pre-existing permissions.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier of the user, group, or resource for which to update mailbox
  /// permissions.
  ///
  /// Parameter [granteeId] :
  /// The identifier of the user, group, or resource to which to grant the
  /// permissions.
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization under which the user, group, or
  /// resource exists.
  ///
  /// Parameter [permissionValues] :
  /// The permissions granted to the grantee. SEND_AS allows the grantee to send
  /// email as the owner of the mailbox (the grantee is not mentioned on these
  /// emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the
  /// owner of the mailbox (the grantee is not mentioned as the physical sender
  /// of these emails). FULL_ACCESS allows the grantee full access to the
  /// mailbox, irrespective of other folder-level permissions set on the
  /// mailbox.
  Future<void> putMailboxPermissions({
    @_s.required String entityId,
    @_s.required String granteeId,
    @_s.required String organizationId,
    @_s.required List<String> permissionValues,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(granteeId, 'granteeId');
    _s.validateStringLength(
      'granteeId',
      granteeId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionValues, 'permissionValues');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.PutMailboxPermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'GranteeId': granteeId,
        'OrganizationId': organizationId,
        'PermissionValues': permissionValues,
      },
    );

    return PutMailboxPermissionsResponse.fromJson(jsonResponse.body);
  }

  /// Registers an existing and disabled user, group, or resource for Amazon
  /// WorkMail use by associating a mailbox and calendaring capabilities. It
  /// performs no change if the user, group, or resource is enabled and fails if
  /// the user, group, or resource is deleted. This operation results in the
  /// accumulation of costs. For more information, see <a
  /// href="https://aws.amazon.com/workmail/pricing">Pricing</a>. The equivalent
  /// console functionality for this operation is <i>Enable</i>.
  ///
  /// Users can either be created by calling the <a>CreateUser</a> API operation
  /// or they can be synchronized from your directory. For more information, see
  /// <a>DeregisterFromWorkMail</a>.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EmailAddressInUseException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [EntityAlreadyRegisteredException].
  /// May throw [InvalidParameterException].
  /// May throw [MailDomainNotFoundException].
  /// May throw [MailDomainStateException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [email] :
  /// The email for the user, group, or resource to be updated.
  ///
  /// Parameter [entityId] :
  /// The identifier for the user, group, or resource to be updated.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the user, group, or
  /// resource exists.
  Future<void> registerToWorkMail({
    @_s.required String email,
    @_s.required String entityId,
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(email, 'email');
    _s.validateStringLength(
      'email',
      email,
      1,
      254,
      isRequired: true,
    );
    _s.validateStringPattern(
      'email',
      email,
      r'''[a-zA-Z0-9._%+-]{1,64}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.RegisterToWorkMail'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Email': email,
        'EntityId': entityId,
        'OrganizationId': organizationId,
      },
    );

    return RegisterToWorkMailResponse.fromJson(jsonResponse.body);
  }

  /// Allows the administrator to reset the password for a user.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPasswordException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization that contains the user for which the
  /// password is reset.
  ///
  /// Parameter [password] :
  /// The new password for the user.
  ///
  /// Parameter [userId] :
  /// The identifier of the user for whom the password is reset.
  Future<void> resetPassword({
    @_s.required String organizationId,
    @_s.required String password,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ResetPassword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'Password': password,
        'UserId': userId,
      },
    );

    return ResetPasswordResponse.fromJson(jsonResponse.body);
  }

  /// Applies the specified tags to the specified Amazon WorkMail organization
  /// resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  Future<void> tagResource({
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Untags the specified tags from the specified Amazon WorkMail organization
  /// resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  Future<void> untagResource({
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Updates a user's current mailbox quota for a specified organization and
  /// user.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  ///
  /// Parameter [mailboxQuota] :
  /// The updated mailbox quota, in MB, for the specified user.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization that contains the user for whom to
  /// update the mailbox quota.
  ///
  /// Parameter [userId] :
  /// The identifer for the user for whom to update the mailbox quota.
  Future<void> updateMailboxQuota({
    @_s.required int mailboxQuota,
    @_s.required String organizationId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(mailboxQuota, 'mailboxQuota');
    _s.validateNumRange(
      'mailboxQuota',
      mailboxQuota,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdateMailboxQuota'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MailboxQuota': mailboxQuota,
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );

    return UpdateMailboxQuotaResponse.fromJson(jsonResponse.body);
  }

  /// Updates the primary email for a user, group, or resource. The current
  /// email is moved into the list of aliases (or swapped between an existing
  /// alias and the current primary email), and the email provided in the input
  /// is promoted as the primary.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EmailAddressInUseException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [MailDomainNotFoundException].
  /// May throw [MailDomainStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [email] :
  /// The value of the email to be updated as primary.
  ///
  /// Parameter [entityId] :
  /// The user, group, or resource to update.
  ///
  /// Parameter [organizationId] :
  /// The organization that contains the user, group, or resource to update.
  Future<void> updatePrimaryEmailAddress({
    @_s.required String email,
    @_s.required String entityId,
    @_s.required String organizationId,
  }) async {
    ArgumentError.checkNotNull(email, 'email');
    _s.validateStringLength(
      'email',
      email,
      1,
      254,
      isRequired: true,
    );
    _s.validateStringPattern(
      'email',
      email,
      r'''[a-zA-Z0-9._%+-]{1,64}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdatePrimaryEmailAddress'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Email': email,
        'EntityId': entityId,
        'OrganizationId': organizationId,
      },
    );

    return UpdatePrimaryEmailAddressResponse.fromJson(jsonResponse.body);
  }

  /// Updates data for the resource. To have the latest information, it must be
  /// preceded by a <a>DescribeResource</a> call. The dataset in the request
  /// should be the one expected when performing another
  /// <code>DescribeResource</code> call.
  ///
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidConfigurationException].
  /// May throw [EmailAddressInUseException].
  /// May throw [MailDomainNotFoundException].
  /// May throw [MailDomainStateException].
  /// May throw [NameAvailabilityException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization for which the resource is
  /// updated.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource to be updated.
  ///
  /// Parameter [bookingOptions] :
  /// The resource's booking options to be updated.
  ///
  /// Parameter [name] :
  /// The name of the resource to be updated.
  Future<void> updateResource({
    @_s.required String organizationId,
    @_s.required String resourceId,
    BookingOptions bookingOptions,
    String name,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''^m-[0-9a-f]{32}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^r-[0-9a-f]{32}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      20,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\w\-.]+(@[a-zA-Z0-9.\-]+\.[a-zA-Z0-9]{2,})?''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdateResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
        'BookingOptions': bookingOptions,
        'Name': name,
      },
    );

    return UpdateResourceResponse.fromJson(jsonResponse.body);
  }
}

/// A rule that controls access to an Amazon WorkMail organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccessControlRule {
  /// Access protocol actions to include in the rule. Valid values include
  /// <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>,
  /// <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and
  /// <code>WebMail</code>.
  @_s.JsonKey(name: 'Actions')
  final List<String> actions;

  /// The date that the rule was created.
  @_s.JsonKey(
      name: 'DateCreated',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime dateCreated;

  /// The date that the rule was modified.
  @_s.JsonKey(
      name: 'DateModified',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime dateModified;

  /// The rule description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The rule effect.
  @_s.JsonKey(name: 'Effect')
  final AccessControlRuleEffect effect;

  /// IPv4 CIDR ranges to include in the rule.
  @_s.JsonKey(name: 'IpRanges')
  final List<String> ipRanges;

  /// The rule name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Access protocol actions to exclude from the rule. Valid values include
  /// <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>,
  /// <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and
  /// <code>WebMail</code>.
  @_s.JsonKey(name: 'NotActions')
  final List<String> notActions;

  /// IPv4 CIDR ranges to exclude from the rule.
  @_s.JsonKey(name: 'NotIpRanges')
  final List<String> notIpRanges;

  /// User IDs to exclude from the rule.
  @_s.JsonKey(name: 'NotUserIds')
  final List<String> notUserIds;

  /// User IDs to include in the rule.
  @_s.JsonKey(name: 'UserIds')
  final List<String> userIds;

  AccessControlRule({
    this.actions,
    this.dateCreated,
    this.dateModified,
    this.description,
    this.effect,
    this.ipRanges,
    this.name,
    this.notActions,
    this.notIpRanges,
    this.notUserIds,
    this.userIds,
  });
  factory AccessControlRule.fromJson(Map<String, dynamic> json) =>
      _$AccessControlRuleFromJson(json);
}

enum AccessControlRuleEffect {
  @_s.JsonValue('ALLOW')
  allow,
  @_s.JsonValue('DENY')
  deny,
}

extension on AccessControlRuleEffect {
  String toValue() {
    switch (this) {
      case AccessControlRuleEffect.allow:
        return 'ALLOW';
      case AccessControlRuleEffect.deny:
        return 'DENY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateDelegateToResourceResponse {
  AssociateDelegateToResourceResponse();
  factory AssociateDelegateToResourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateDelegateToResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateMemberToGroupResponse {
  AssociateMemberToGroupResponse();
  factory AssociateMemberToGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateMemberToGroupResponseFromJson(json);
}

/// At least one delegate must be associated to the resource to disable
/// automatic replies from the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BookingOptions {
  /// The resource's ability to automatically reply to requests. If disabled,
  /// delegates must be associated to the resource.
  @_s.JsonKey(name: 'AutoAcceptRequests')
  final bool autoAcceptRequests;

  /// The resource's ability to automatically decline any conflicting requests.
  @_s.JsonKey(name: 'AutoDeclineConflictingRequests')
  final bool autoDeclineConflictingRequests;

  /// The resource's ability to automatically decline any recurring requests.
  @_s.JsonKey(name: 'AutoDeclineRecurringRequests')
  final bool autoDeclineRecurringRequests;

  BookingOptions({
    this.autoAcceptRequests,
    this.autoDeclineConflictingRequests,
    this.autoDeclineRecurringRequests,
  });
  factory BookingOptions.fromJson(Map<String, dynamic> json) =>
      _$BookingOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$BookingOptionsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAliasResponse {
  CreateAliasResponse();
  factory CreateAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGroupResponse {
  /// The identifier of the group.
  @_s.JsonKey(name: 'GroupId')
  final String groupId;

  CreateGroupResponse({
    this.groupId,
  });
  factory CreateGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateResourceResponse {
  /// The identifier of the new resource.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  CreateResourceResponse({
    this.resourceId,
  });
  factory CreateResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserResponse {
  /// The identifier for the new user.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  CreateUserResponse({
    this.userId,
  });
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}

/// The name of the attribute, which is one of the values defined in the
/// UserAttribute enumeration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Delegate {
  /// The identifier for the user or group associated as the resource's delegate.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The type of the delegate: user or group.
  @_s.JsonKey(name: 'Type')
  final MemberType type;

  Delegate({
    @_s.required this.id,
    @_s.required this.type,
  });
  factory Delegate.fromJson(Map<String, dynamic> json) =>
      _$DelegateFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAccessControlRuleResponse {
  DeleteAccessControlRuleResponse();
  factory DeleteAccessControlRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccessControlRuleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAliasResponse {
  DeleteAliasResponse();
  factory DeleteAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGroupResponse {
  DeleteGroupResponse();
  factory DeleteGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMailboxPermissionsResponse {
  DeleteMailboxPermissionsResponse();
  factory DeleteMailboxPermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteMailboxPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResourceResponse {
  DeleteResourceResponse();
  factory DeleteResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUserResponse {
  DeleteUserResponse();
  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterFromWorkMailResponse {
  DeregisterFromWorkMailResponse();
  factory DeregisterFromWorkMailResponse.fromJson(Map<String, dynamic> json) =>
      _$DeregisterFromWorkMailResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGroupResponse {
  /// The date and time when a user was deregistered from WorkMail, in UNIX epoch
  /// time format.
  @_s.JsonKey(
      name: 'DisabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime disabledDate;

  /// The email of the described group.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The date and time when a user was registered to WorkMail, in UNIX epoch time
  /// format.
  @_s.JsonKey(
      name: 'EnabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime enabledDate;

  /// The identifier of the described group.
  @_s.JsonKey(name: 'GroupId')
  final String groupId;

  /// The name of the described group.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The state of the user: enabled (registered to Amazon WorkMail) or disabled
  /// (deregistered or never registered to WorkMail).
  @_s.JsonKey(name: 'State')
  final EntityState state;

  DescribeGroupResponse({
    this.disabledDate,
    this.email,
    this.enabledDate,
    this.groupId,
    this.name,
    this.state,
  });
  factory DescribeGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOrganizationResponse {
  /// The Amazon Resource Name (ARN) of the organization.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The alias for an organization.
  @_s.JsonKey(name: 'Alias')
  final String alias;

  /// The date at which the organization became usable in the WorkMail context, in
  /// UNIX epoch time format.
  @_s.JsonKey(
      name: 'CompletedDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completedDate;

  /// The default mail domain associated with the organization.
  @_s.JsonKey(name: 'DefaultMailDomain')
  final String defaultMailDomain;

  /// The identifier for the directory associated with an Amazon WorkMail
  /// organization.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The type of directory associated with the WorkMail organization.
  @_s.JsonKey(name: 'DirectoryType')
  final String directoryType;

  /// (Optional) The error message indicating if unexpected behavior was
  /// encountered with regards to the organization.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The identifier of an organization.
  @_s.JsonKey(name: 'OrganizationId')
  final String organizationId;

  /// The state of an organization.
  @_s.JsonKey(name: 'State')
  final String state;

  DescribeOrganizationResponse({
    this.arn,
    this.alias,
    this.completedDate,
    this.defaultMailDomain,
    this.directoryId,
    this.directoryType,
    this.errorMessage,
    this.organizationId,
    this.state,
  });
  factory DescribeOrganizationResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeOrganizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeResourceResponse {
  /// The booking options for the described resource.
  @_s.JsonKey(name: 'BookingOptions')
  final BookingOptions bookingOptions;

  /// The date and time when a resource was disabled from WorkMail, in UNIX epoch
  /// time format.
  @_s.JsonKey(
      name: 'DisabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime disabledDate;

  /// The email of the described resource.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The date and time when a resource was enabled for WorkMail, in UNIX epoch
  /// time format.
  @_s.JsonKey(
      name: 'EnabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime enabledDate;

  /// The name of the described resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The identifier of the described resource.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The state of the resource: enabled (registered to Amazon WorkMail), disabled
  /// (deregistered or never registered to WorkMail), or deleted.
  @_s.JsonKey(name: 'State')
  final EntityState state;

  /// The type of the described resource.
  @_s.JsonKey(name: 'Type')
  final ResourceType type;

  DescribeResourceResponse({
    this.bookingOptions,
    this.disabledDate,
    this.email,
    this.enabledDate,
    this.name,
    this.resourceId,
    this.state,
    this.type,
  });
  factory DescribeResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserResponse {
  /// The date and time at which the user was disabled for Amazon WorkMail usage,
  /// in UNIX epoch time format.
  @_s.JsonKey(
      name: 'DisabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime disabledDate;

  /// The display name of the user.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The email of the user.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The date and time at which the user was enabled for Amazon WorkMail usage,
  /// in UNIX epoch time format.
  @_s.JsonKey(
      name: 'EnabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime enabledDate;

  /// The name for the user.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The state of a user: enabled (registered to Amazon WorkMail) or disabled
  /// (deregistered or never registered to WorkMail).
  @_s.JsonKey(name: 'State')
  final EntityState state;

  /// The identifier for the described user.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  /// In certain cases, other entities are modeled as users. If interoperability
  /// is enabled, resources are imported into Amazon WorkMail as users. Because
  /// different WorkMail organizations rely on different directory types,
  /// administrators can distinguish between an unregistered user (account is
  /// disabled and has a user role) and the directory administrators. The values
  /// are USER, RESOURCE, and SYSTEM_USER.
  @_s.JsonKey(name: 'UserRole')
  final UserRole userRole;

  DescribeUserResponse({
    this.disabledDate,
    this.displayName,
    this.email,
    this.enabledDate,
    this.name,
    this.state,
    this.userId,
    this.userRole,
  });
  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateDelegateFromResourceResponse {
  DisassociateDelegateFromResourceResponse();
  factory DisassociateDelegateFromResourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateDelegateFromResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateMemberFromGroupResponse {
  DisassociateMemberFromGroupResponse();
  factory DisassociateMemberFromGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateMemberFromGroupResponseFromJson(json);
}

enum EntityState {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('DELETED')
  deleted,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAccessControlEffectResponse {
  /// The rule effect.
  @_s.JsonKey(name: 'Effect')
  final AccessControlRuleEffect effect;

  /// The rules that match the given parameters, resulting in an effect.
  @_s.JsonKey(name: 'MatchedRules')
  final List<String> matchedRules;

  GetAccessControlEffectResponse({
    this.effect,
    this.matchedRules,
  });
  factory GetAccessControlEffectResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccessControlEffectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMailboxDetailsResponse {
  /// The maximum allowed mailbox size, in MB, for the specified user.
  @_s.JsonKey(name: 'MailboxQuota')
  final int mailboxQuota;

  /// The current mailbox size, in MB, for the specified user.
  @_s.JsonKey(name: 'MailboxSize')
  final double mailboxSize;

  GetMailboxDetailsResponse({
    this.mailboxQuota,
    this.mailboxSize,
  });
  factory GetMailboxDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMailboxDetailsResponseFromJson(json);
}

/// The representation of an Amazon WorkMail group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Group {
  /// The date indicating when the group was disabled from Amazon WorkMail use.
  @_s.JsonKey(
      name: 'DisabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime disabledDate;

  /// The email of the group.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The date indicating when the group was enabled for Amazon WorkMail use.
  @_s.JsonKey(
      name: 'EnabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime enabledDate;

  /// The identifier of the group.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the group.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The state of the group, which can be ENABLED, DISABLED, or DELETED.
  @_s.JsonKey(name: 'State')
  final EntityState state;

  Group({
    this.disabledDate,
    this.email,
    this.enabledDate,
    this.id,
    this.name,
    this.state,
  });
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccessControlRulesResponse {
  /// The access control rules.
  @_s.JsonKey(name: 'Rules')
  final List<AccessControlRule> rules;

  ListAccessControlRulesResponse({
    this.rules,
  });
  factory ListAccessControlRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAccessControlRulesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAliasesResponse {
  /// The entity's paginated aliases.
  @_s.JsonKey(name: 'Aliases')
  final List<String> aliases;

  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAliasesResponse({
    this.aliases,
    this.nextToken,
  });
  factory ListAliasesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAliasesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupMembersResponse {
  /// The members associated to the group.
  @_s.JsonKey(name: 'Members')
  final List<Member> members;

  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGroupMembersResponse({
    this.members,
    this.nextToken,
  });
  factory ListGroupMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGroupMembersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupsResponse {
  /// The overview of groups for an organization.
  @_s.JsonKey(name: 'Groups')
  final List<Group> groups;

  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGroupsResponse({
    this.groups,
    this.nextToken,
  });
  factory ListGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMailboxPermissionsResponse {
  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// One page of the user, group, or resource mailbox permissions.
  @_s.JsonKey(name: 'Permissions')
  final List<Permission> permissions;

  ListMailboxPermissionsResponse({
    this.nextToken,
    this.permissions,
  });
  factory ListMailboxPermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMailboxPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOrganizationsResponse {
  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The overview of owned organizations presented as a list of organization
  /// summaries.
  @_s.JsonKey(name: 'OrganizationSummaries')
  final List<OrganizationSummary> organizationSummaries;

  ListOrganizationsResponse({
    this.nextToken,
    this.organizationSummaries,
  });
  factory ListOrganizationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOrganizationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourceDelegatesResponse {
  /// One page of the resource's delegates.
  @_s.JsonKey(name: 'Delegates')
  final List<Delegate> delegates;

  /// The token used to paginate through the delegates associated with a resource.
  /// While results are still available, it has an associated value. When the last
  /// page is reached, the token is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListResourceDelegatesResponse({
    this.delegates,
    this.nextToken,
  });
  factory ListResourceDelegatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResourceDelegatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourcesResponse {
  /// The token used to paginate through all the organization's resources. While
  /// results are still available, it has an associated value. When the last page
  /// is reached, the token is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// One page of the organization's resource representation.
  @_s.JsonKey(name: 'Resources')
  final List<Resource> resources;

  ListResourcesResponse({
    this.nextToken,
    this.resources,
  });
  factory ListResourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResourcesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A list of tag key-value pairs.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsersResponse {
  /// The token to use to retrieve the next page of results. This value is `null`
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The overview of users for an organization.
  @_s.JsonKey(name: 'Users')
  final List<User> users;

  ListUsersResponse({
    this.nextToken,
    this.users,
  });
  factory ListUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUsersResponseFromJson(json);
}

/// The representation of a user or group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Member {
  /// The date indicating when the member was disabled from Amazon WorkMail use.
  @_s.JsonKey(
      name: 'DisabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime disabledDate;

  /// The date indicating when the member was enabled for Amazon WorkMail use.
  @_s.JsonKey(
      name: 'EnabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime enabledDate;

  /// The identifier of the member.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the member.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The state of the member, which can be ENABLED, DISABLED, or DELETED.
  @_s.JsonKey(name: 'State')
  final EntityState state;

  /// A member can be a user or group.
  @_s.JsonKey(name: 'Type')
  final MemberType type;

  Member({
    this.disabledDate,
    this.enabledDate,
    this.id,
    this.name,
    this.state,
    this.type,
  });
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

enum MemberType {
  @_s.JsonValue('GROUP')
  group,
  @_s.JsonValue('USER')
  user,
}

/// The representation of an organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationSummary {
  /// The alias associated with the organization.
  @_s.JsonKey(name: 'Alias')
  final String alias;

  /// The error message associated with the organization. It is only present if
  /// unexpected behavior has occurred with regards to the organization. It
  /// provides insight or solutions regarding unexpected behavior.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The identifier associated with the organization.
  @_s.JsonKey(name: 'OrganizationId')
  final String organizationId;

  /// The state associated with the organization.
  @_s.JsonKey(name: 'State')
  final String state;

  OrganizationSummary({
    this.alias,
    this.errorMessage,
    this.organizationId,
    this.state,
  });
  factory OrganizationSummary.fromJson(Map<String, dynamic> json) =>
      _$OrganizationSummaryFromJson(json);
}

/// Permission granted to a user, group, or resource to access a certain aspect
/// of another user, group, or resource mailbox.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Permission {
  /// The identifier of the user, group, or resource to which the permissions are
  /// granted.
  @_s.JsonKey(name: 'GranteeId')
  final String granteeId;

  /// The type of user, group, or resource referred to in GranteeId.
  @_s.JsonKey(name: 'GranteeType')
  final MemberType granteeType;

  /// The permissions granted to the grantee. SEND_AS allows the grantee to send
  /// email as the owner of the mailbox (the grantee is not mentioned on these
  /// emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the
  /// owner of the mailbox (the grantee is not mentioned as the physical sender of
  /// these emails). FULL_ACCESS allows the grantee full access to the mailbox,
  /// irrespective of other folder-level permissions set on the mailbox.
  @_s.JsonKey(name: 'PermissionValues')
  final List<String> permissionValues;

  Permission({
    @_s.required this.granteeId,
    @_s.required this.granteeType,
    @_s.required this.permissionValues,
  });
  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}

enum PermissionType {
  @_s.JsonValue('FULL_ACCESS')
  fullAccess,
  @_s.JsonValue('SEND_AS')
  sendAs,
  @_s.JsonValue('SEND_ON_BEHALF')
  sendOnBehalf,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAccessControlRuleResponse {
  PutAccessControlRuleResponse();
  factory PutAccessControlRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$PutAccessControlRuleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutMailboxPermissionsResponse {
  PutMailboxPermissionsResponse();
  factory PutMailboxPermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutMailboxPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterToWorkMailResponse {
  RegisterToWorkMailResponse();
  factory RegisterToWorkMailResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterToWorkMailResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResetPasswordResponse {
  ResetPasswordResponse();
  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
}

/// The representation of a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Resource {
  /// The date indicating when the resource was disabled from Amazon WorkMail use.
  @_s.JsonKey(
      name: 'DisabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime disabledDate;

  /// The email of the resource.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The date indicating when the resource was enabled for Amazon WorkMail use.
  @_s.JsonKey(
      name: 'EnabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime enabledDate;

  /// The identifier of the resource.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The state of the resource, which can be ENABLED, DISABLED, or DELETED.
  @_s.JsonKey(name: 'State')
  final EntityState state;

  /// The type of the resource: equipment or room.
  @_s.JsonKey(name: 'Type')
  final ResourceType type;

  Resource({
    this.disabledDate,
    this.email,
    this.enabledDate,
    this.id,
    this.name,
    this.state,
    this.type,
  });
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

enum ResourceType {
  @_s.JsonValue('ROOM')
  room,
  @_s.JsonValue('EQUIPMENT')
  equipment,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.room:
        return 'ROOM';
      case ResourceType.equipment:
        return 'EQUIPMENT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a tag applied to a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMailboxQuotaResponse {
  UpdateMailboxQuotaResponse();
  factory UpdateMailboxQuotaResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMailboxQuotaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePrimaryEmailAddressResponse {
  UpdatePrimaryEmailAddressResponse();
  factory UpdatePrimaryEmailAddressResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePrimaryEmailAddressResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateResourceResponse {
  UpdateResourceResponse();
  factory UpdateResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResourceResponseFromJson(json);
}

/// The representation of an Amazon WorkMail user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class User {
  /// The date indicating when the user was disabled from Amazon WorkMail use.
  @_s.JsonKey(
      name: 'DisabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime disabledDate;

  /// The display name of the user.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The email of the user.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The date indicating when the user was enabled for Amazon WorkMail use.
  @_s.JsonKey(
      name: 'EnabledDate',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime enabledDate;

  /// The identifier of the user.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the user.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The state of the user, which can be ENABLED, DISABLED, or DELETED.
  @_s.JsonKey(name: 'State')
  final EntityState state;

  /// The role of the user.
  @_s.JsonKey(name: 'UserRole')
  final UserRole userRole;

  User({
    this.disabledDate,
    this.displayName,
    this.email,
    this.enabledDate,
    this.id,
    this.name,
    this.state,
    this.userRole,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum UserRole {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('RESOURCE')
  resource,
  @_s.JsonValue('SYSTEM_USER')
  systemUser,
}

class DirectoryServiceAuthenticationFailedException
    extends _s.GenericAwsException {
  DirectoryServiceAuthenticationFailedException({String type, String message})
      : super(
            type: type,
            code: 'DirectoryServiceAuthenticationFailedException',
            message: message);
}

class DirectoryUnavailableException extends _s.GenericAwsException {
  DirectoryUnavailableException({String type, String message})
      : super(
            type: type,
            code: 'DirectoryUnavailableException',
            message: message);
}

class EmailAddressInUseException extends _s.GenericAwsException {
  EmailAddressInUseException({String type, String message})
      : super(type: type, code: 'EmailAddressInUseException', message: message);
}

class EntityAlreadyRegisteredException extends _s.GenericAwsException {
  EntityAlreadyRegisteredException({String type, String message})
      : super(
            type: type,
            code: 'EntityAlreadyRegisteredException',
            message: message);
}

class EntityNotFoundException extends _s.GenericAwsException {
  EntityNotFoundException({String type, String message})
      : super(type: type, code: 'EntityNotFoundException', message: message);
}

class EntityStateException extends _s.GenericAwsException {
  EntityStateException({String type, String message})
      : super(type: type, code: 'EntityStateException', message: message);
}

class InvalidConfigurationException extends _s.GenericAwsException {
  InvalidConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidConfigurationException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidPasswordException extends _s.GenericAwsException {
  InvalidPasswordException({String type, String message})
      : super(type: type, code: 'InvalidPasswordException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MailDomainNotFoundException extends _s.GenericAwsException {
  MailDomainNotFoundException({String type, String message})
      : super(
            type: type, code: 'MailDomainNotFoundException', message: message);
}

class MailDomainStateException extends _s.GenericAwsException {
  MailDomainStateException({String type, String message})
      : super(type: type, code: 'MailDomainStateException', message: message);
}

class NameAvailabilityException extends _s.GenericAwsException {
  NameAvailabilityException({String type, String message})
      : super(type: type, code: 'NameAvailabilityException', message: message);
}

class OrganizationNotFoundException extends _s.GenericAwsException {
  OrganizationNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'OrganizationNotFoundException',
            message: message);
}

class OrganizationStateException extends _s.GenericAwsException {
  OrganizationStateException({String type, String message})
      : super(type: type, code: 'OrganizationStateException', message: message);
}

class ReservedNameException extends _s.GenericAwsException {
  ReservedNameException({String type, String message})
      : super(type: type, code: 'ReservedNameException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DirectoryServiceAuthenticationFailedException': (type, message) =>
      DirectoryServiceAuthenticationFailedException(
          type: type, message: message),
  'DirectoryUnavailableException': (type, message) =>
      DirectoryUnavailableException(type: type, message: message),
  'EmailAddressInUseException': (type, message) =>
      EmailAddressInUseException(type: type, message: message),
  'EntityAlreadyRegisteredException': (type, message) =>
      EntityAlreadyRegisteredException(type: type, message: message),
  'EntityNotFoundException': (type, message) =>
      EntityNotFoundException(type: type, message: message),
  'EntityStateException': (type, message) =>
      EntityStateException(type: type, message: message),
  'InvalidConfigurationException': (type, message) =>
      InvalidConfigurationException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidPasswordException': (type, message) =>
      InvalidPasswordException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MailDomainNotFoundException': (type, message) =>
      MailDomainNotFoundException(type: type, message: message),
  'MailDomainStateException': (type, message) =>
      MailDomainStateException(type: type, message: message),
  'NameAvailabilityException': (type, message) =>
      NameAvailabilityException(type: type, message: message),
  'OrganizationNotFoundException': (type, message) =>
      OrganizationNotFoundException(type: type, message: message),
  'OrganizationStateException': (type, message) =>
      OrganizationStateException(type: type, message: message),
  'ReservedNameException': (type, message) =>
      ReservedNameException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
