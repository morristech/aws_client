// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workmail-2017-10-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessControlRule _$AccessControlRuleFromJson(Map<String, dynamic> json) {
  return AccessControlRule(
    actions: (json['Actions'] as List)?.map((e) => e as String)?.toList(),
    dateCreated: unixTimestampFromJson(json['DateCreated']),
    dateModified: unixTimestampFromJson(json['DateModified']),
    description: json['Description'] as String,
    effect:
        _$enumDecodeNullable(_$AccessControlRuleEffectEnumMap, json['Effect']),
    ipRanges: (json['IpRanges'] as List)?.map((e) => e as String)?.toList(),
    name: json['Name'] as String,
    notActions: (json['NotActions'] as List)?.map((e) => e as String)?.toList(),
    notIpRanges:
        (json['NotIpRanges'] as List)?.map((e) => e as String)?.toList(),
    notUserIds: (json['NotUserIds'] as List)?.map((e) => e as String)?.toList(),
    userIds: (json['UserIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$AccessControlRuleEffectEnumMap = {
  AccessControlRuleEffect.allow: 'ALLOW',
  AccessControlRuleEffect.deny: 'DENY',
};

AssociateDelegateToResourceResponse
    _$AssociateDelegateToResourceResponseFromJson(Map<String, dynamic> json) {
  return AssociateDelegateToResourceResponse();
}

AssociateMemberToGroupResponse _$AssociateMemberToGroupResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateMemberToGroupResponse();
}

BookingOptions _$BookingOptionsFromJson(Map<String, dynamic> json) {
  return BookingOptions(
    autoAcceptRequests: json['AutoAcceptRequests'] as bool,
    autoDeclineConflictingRequests:
        json['AutoDeclineConflictingRequests'] as bool,
    autoDeclineRecurringRequests: json['AutoDeclineRecurringRequests'] as bool,
  );
}

Map<String, dynamic> _$BookingOptionsToJson(BookingOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AutoAcceptRequests', instance.autoAcceptRequests);
  writeNotNull('AutoDeclineConflictingRequests',
      instance.autoDeclineConflictingRequests);
  writeNotNull(
      'AutoDeclineRecurringRequests', instance.autoDeclineRecurringRequests);
  return val;
}

CreateAliasResponse _$CreateAliasResponseFromJson(Map<String, dynamic> json) {
  return CreateAliasResponse();
}

CreateGroupResponse _$CreateGroupResponseFromJson(Map<String, dynamic> json) {
  return CreateGroupResponse(
    groupId: json['GroupId'] as String,
  );
}

CreateResourceResponse _$CreateResourceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateResourceResponse(
    resourceId: json['ResourceId'] as String,
  );
}

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse(
    userId: json['UserId'] as String,
  );
}

Delegate _$DelegateFromJson(Map<String, dynamic> json) {
  return Delegate(
    id: json['Id'] as String,
    type: _$enumDecodeNullable(_$MemberTypeEnumMap, json['Type']),
  );
}

const _$MemberTypeEnumMap = {
  MemberType.group: 'GROUP',
  MemberType.user: 'USER',
};

DeleteAccessControlRuleResponse _$DeleteAccessControlRuleResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAccessControlRuleResponse();
}

DeleteAliasResponse _$DeleteAliasResponseFromJson(Map<String, dynamic> json) {
  return DeleteAliasResponse();
}

DeleteGroupResponse _$DeleteGroupResponseFromJson(Map<String, dynamic> json) {
  return DeleteGroupResponse();
}

DeleteMailboxPermissionsResponse _$DeleteMailboxPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteMailboxPermissionsResponse();
}

DeleteResourceResponse _$DeleteResourceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResourceResponse();
}

DeleteUserResponse _$DeleteUserResponseFromJson(Map<String, dynamic> json) {
  return DeleteUserResponse();
}

DeregisterFromWorkMailResponse _$DeregisterFromWorkMailResponseFromJson(
    Map<String, dynamic> json) {
  return DeregisterFromWorkMailResponse();
}

DescribeGroupResponse _$DescribeGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeGroupResponse(
    disabledDate: unixTimestampFromJson(json['DisabledDate']),
    email: json['Email'] as String,
    enabledDate: unixTimestampFromJson(json['EnabledDate']),
    groupId: json['GroupId'] as String,
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$EntityStateEnumMap, json['State']),
  );
}

const _$EntityStateEnumMap = {
  EntityState.enabled: 'ENABLED',
  EntityState.disabled: 'DISABLED',
  EntityState.deleted: 'DELETED',
};

DescribeOrganizationResponse _$DescribeOrganizationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeOrganizationResponse(
    arn: json['ARN'] as String,
    alias: json['Alias'] as String,
    completedDate: unixTimestampFromJson(json['CompletedDate']),
    defaultMailDomain: json['DefaultMailDomain'] as String,
    directoryId: json['DirectoryId'] as String,
    directoryType: json['DirectoryType'] as String,
    errorMessage: json['ErrorMessage'] as String,
    organizationId: json['OrganizationId'] as String,
    state: json['State'] as String,
  );
}

DescribeResourceResponse _$DescribeResourceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeResourceResponse(
    bookingOptions: json['BookingOptions'] == null
        ? null
        : BookingOptions.fromJson(
            json['BookingOptions'] as Map<String, dynamic>),
    disabledDate: unixTimestampFromJson(json['DisabledDate']),
    email: json['Email'] as String,
    enabledDate: unixTimestampFromJson(json['EnabledDate']),
    name: json['Name'] as String,
    resourceId: json['ResourceId'] as String,
    state: _$enumDecodeNullable(_$EntityStateEnumMap, json['State']),
    type: _$enumDecodeNullable(_$ResourceTypeEnumMap, json['Type']),
  );
}

const _$ResourceTypeEnumMap = {
  ResourceType.room: 'ROOM',
  ResourceType.equipment: 'EQUIPMENT',
};

DescribeUserResponse _$DescribeUserResponseFromJson(Map<String, dynamic> json) {
  return DescribeUserResponse(
    disabledDate: unixTimestampFromJson(json['DisabledDate']),
    displayName: json['DisplayName'] as String,
    email: json['Email'] as String,
    enabledDate: unixTimestampFromJson(json['EnabledDate']),
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$EntityStateEnumMap, json['State']),
    userId: json['UserId'] as String,
    userRole: _$enumDecodeNullable(_$UserRoleEnumMap, json['UserRole']),
  );
}

const _$UserRoleEnumMap = {
  UserRole.user: 'USER',
  UserRole.resource: 'RESOURCE',
  UserRole.systemUser: 'SYSTEM_USER',
};

DisassociateDelegateFromResourceResponse
    _$DisassociateDelegateFromResourceResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateDelegateFromResourceResponse();
}

DisassociateMemberFromGroupResponse
    _$DisassociateMemberFromGroupResponseFromJson(Map<String, dynamic> json) {
  return DisassociateMemberFromGroupResponse();
}

GetAccessControlEffectResponse _$GetAccessControlEffectResponseFromJson(
    Map<String, dynamic> json) {
  return GetAccessControlEffectResponse(
    effect:
        _$enumDecodeNullable(_$AccessControlRuleEffectEnumMap, json['Effect']),
    matchedRules:
        (json['MatchedRules'] as List)?.map((e) => e as String)?.toList(),
  );
}

GetMailboxDetailsResponse _$GetMailboxDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return GetMailboxDetailsResponse(
    mailboxQuota: json['MailboxQuota'] as int,
    mailboxSize: (json['MailboxSize'] as num)?.toDouble(),
  );
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    disabledDate: unixTimestampFromJson(json['DisabledDate']),
    email: json['Email'] as String,
    enabledDate: unixTimestampFromJson(json['EnabledDate']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$EntityStateEnumMap, json['State']),
  );
}

ListAccessControlRulesResponse _$ListAccessControlRulesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAccessControlRulesResponse(
    rules: (json['Rules'] as List)
        ?.map((e) => e == null
            ? null
            : AccessControlRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListAliasesResponse _$ListAliasesResponseFromJson(Map<String, dynamic> json) {
  return ListAliasesResponse(
    aliases: (json['Aliases'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListGroupMembersResponse _$ListGroupMembersResponseFromJson(
    Map<String, dynamic> json) {
  return ListGroupMembersResponse(
    members: (json['Members'] as List)
        ?.map((e) =>
            e == null ? null : Member.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListGroupsResponse _$ListGroupsResponseFromJson(Map<String, dynamic> json) {
  return ListGroupsResponse(
    groups: (json['Groups'] as List)
        ?.map(
            (e) => e == null ? null : Group.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMailboxPermissionsResponse _$ListMailboxPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListMailboxPermissionsResponse(
    nextToken: json['NextToken'] as String,
    permissions: (json['Permissions'] as List)
        ?.map((e) =>
            e == null ? null : Permission.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListOrganizationsResponse _$ListOrganizationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListOrganizationsResponse(
    nextToken: json['NextToken'] as String,
    organizationSummaries: (json['OrganizationSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : OrganizationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListResourceDelegatesResponse _$ListResourceDelegatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListResourceDelegatesResponse(
    delegates: (json['Delegates'] as List)
        ?.map((e) =>
            e == null ? null : Delegate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListResourcesResponse _$ListResourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListResourcesResponse(
    nextToken: json['NextToken'] as String,
    resources: (json['Resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListUsersResponse _$ListUsersResponseFromJson(Map<String, dynamic> json) {
  return ListUsersResponse(
    nextToken: json['NextToken'] as String,
    users: (json['Users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    disabledDate: unixTimestampFromJson(json['DisabledDate']),
    enabledDate: unixTimestampFromJson(json['EnabledDate']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$EntityStateEnumMap, json['State']),
    type: _$enumDecodeNullable(_$MemberTypeEnumMap, json['Type']),
  );
}

OrganizationSummary _$OrganizationSummaryFromJson(Map<String, dynamic> json) {
  return OrganizationSummary(
    alias: json['Alias'] as String,
    errorMessage: json['ErrorMessage'] as String,
    organizationId: json['OrganizationId'] as String,
    state: json['State'] as String,
  );
}

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return Permission(
    granteeId: json['GranteeId'] as String,
    granteeType: _$enumDecodeNullable(_$MemberTypeEnumMap, json['GranteeType']),
    permissionValues:
        (json['PermissionValues'] as List)?.map((e) => e as String)?.toList(),
  );
}

PutAccessControlRuleResponse _$PutAccessControlRuleResponseFromJson(
    Map<String, dynamic> json) {
  return PutAccessControlRuleResponse();
}

PutMailboxPermissionsResponse _$PutMailboxPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return PutMailboxPermissionsResponse();
}

RegisterToWorkMailResponse _$RegisterToWorkMailResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterToWorkMailResponse();
}

ResetPasswordResponse _$ResetPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return ResetPasswordResponse();
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    disabledDate: unixTimestampFromJson(json['DisabledDate']),
    email: json['Email'] as String,
    enabledDate: unixTimestampFromJson(json['EnabledDate']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$EntityStateEnumMap, json['State']),
    type: _$enumDecodeNullable(_$ResourceTypeEnumMap, json['Type']),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateMailboxQuotaResponse _$UpdateMailboxQuotaResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateMailboxQuotaResponse();
}

UpdatePrimaryEmailAddressResponse _$UpdatePrimaryEmailAddressResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePrimaryEmailAddressResponse();
}

UpdateResourceResponse _$UpdateResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResourceResponse();
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    disabledDate: unixTimestampFromJson(json['DisabledDate']),
    displayName: json['DisplayName'] as String,
    email: json['Email'] as String,
    enabledDate: unixTimestampFromJson(json['EnabledDate']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$EntityStateEnumMap, json['State']),
    userRole: _$enumDecodeNullable(_$UserRoleEnumMap, json['UserRole']),
  );
}
