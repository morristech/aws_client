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

part 'savingsplans-2019-06-28.g.dart';

/// Savings Plans are a pricing model that offer significant savings on AWS
/// usage (for example, on Amazon EC2 instances). You commit to a consistent
/// amount of usage, in USD per hour, for a term of 1 or 3 years, and receive a
/// lower price for that usage. For more information, see the <a
/// href="https://docs.aws.amazon.com/savingsplans/latest/userguide/">AWS
/// Savings Plans User Guide</a>.
class SavingsPlans {
  final _s.RestJsonProtocol _protocol;
  SavingsPlans({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'savingsplans',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a Savings Plan.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [commitment] :
  /// The hourly commitment, in USD. This is a value between 0.001 and 1
  /// million. You cannot specify more than three digits after the decimal
  /// point.
  ///
  /// Parameter [savingsPlanOfferingId] :
  /// The ID of the offering.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  ///
  /// Parameter [upfrontPaymentAmount] :
  /// The up-front payment amount. This is a whole number between 50 and 99
  /// percent of the total value of the Savings Plan. This parameter is
  /// supported only if the payment option is <code>Partial Upfront</code>.
  Future<CreateSavingsPlanResponse> createSavingsPlan({
    @_s.required String commitment,
    @_s.required String savingsPlanOfferingId,
    String clientToken,
    Map<String, String> tags,
    String upfrontPaymentAmount,
  }) async {
    ArgumentError.checkNotNull(commitment, 'commitment');
    ArgumentError.checkNotNull(savingsPlanOfferingId, 'savingsPlanOfferingId');
    final $payload = <String, dynamic>{
      'commitment': commitment,
      'savingsPlanOfferingId': savingsPlanOfferingId,
      'clientToken': clientToken,
      'tags': tags,
      'upfrontPaymentAmount': upfrontPaymentAmount,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateSavingsPlan',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSavingsPlanResponse.fromJson(response);
  }

  /// Describes the specified Savings Plans rates.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [savingsPlanId] :
  /// The ID of the Savings Plan.
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// additional results, make another call with the returned token value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<DescribeSavingsPlanRatesResponse> describeSavingsPlanRates({
    @_s.required String savingsPlanId,
    List<SavingsPlanRateFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(savingsPlanId, 'savingsPlanId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9/=\+]+$''',
    );
    final $payload = <String, dynamic>{
      'savingsPlanId': savingsPlanId,
      'filters': filters,
      'maxResults': maxResults,
      'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeSavingsPlanRates',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSavingsPlanRatesResponse.fromJson(response);
  }

  /// Describes the specified Savings Plans.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// additional results, make another call with the returned token value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [savingsPlanArns] :
  /// The Amazon Resource Names (ARN) of the Savings Plans.
  ///
  /// Parameter [savingsPlanIds] :
  /// The IDs of the Savings Plans.
  ///
  /// Parameter [states] :
  /// The states.
  Future<DescribeSavingsPlansResponse> describeSavingsPlans({
    List<SavingsPlanFilter> filters,
    int maxResults,
    String nextToken,
    List<String> savingsPlanArns,
    List<String> savingsPlanIds,
    List<String> states,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9/=\+]+$''',
    );
    final $payload = <String, dynamic>{
      'filters': filters,
      'maxResults': maxResults,
      'nextToken': nextToken,
      'savingsPlanArns': savingsPlanArns,
      'savingsPlanIds': savingsPlanIds,
      'states': states,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeSavingsPlans',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSavingsPlansResponse.fromJson(response);
  }

  /// Describes the specified Savings Plans offering rates.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// additional results, make another call with the returned token value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [operations] :
  /// The specific AWS operation for the line item in the billing report.
  ///
  /// Parameter [products] :
  /// The AWS products.
  ///
  /// Parameter [savingsPlanOfferingIds] :
  /// The IDs of the offerings.
  ///
  /// Parameter [savingsPlanPaymentOptions] :
  /// The payment options.
  ///
  /// Parameter [savingsPlanTypes] :
  /// The plan types.
  ///
  /// Parameter [serviceCodes] :
  /// The services.
  ///
  /// Parameter [usageTypes] :
  /// The usage details of the line item in the billing report.
  Future<DescribeSavingsPlansOfferingRatesResponse>
      describeSavingsPlansOfferingRates({
    List<SavingsPlanOfferingRateFilterElement> filters,
    int maxResults,
    String nextToken,
    List<String> operations,
    List<String> products,
    List<String> savingsPlanOfferingIds,
    List<String> savingsPlanPaymentOptions,
    List<String> savingsPlanTypes,
    List<String> serviceCodes,
    List<String> usageTypes,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9/=\+]+$''',
    );
    final $payload = <String, dynamic>{
      'filters': filters,
      'maxResults': maxResults,
      'nextToken': nextToken,
      'operations': operations,
      'products': products,
      'savingsPlanOfferingIds': savingsPlanOfferingIds,
      'savingsPlanPaymentOptions': savingsPlanPaymentOptions,
      'savingsPlanTypes': savingsPlanTypes,
      'serviceCodes': serviceCodes,
      'usageTypes': usageTypes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeSavingsPlansOfferingRates',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSavingsPlansOfferingRatesResponse.fromJson(response);
  }

  /// Describes the specified Savings Plans offerings.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [currencies] :
  /// The currencies.
  ///
  /// Parameter [descriptions] :
  /// The descriptions.
  ///
  /// Parameter [durations] :
  /// The durations, in seconds.
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// additional results, make another call with the returned token value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [offeringIds] :
  /// The IDs of the offerings.
  ///
  /// Parameter [operations] :
  /// The specific AWS operation for the line item in the billing report.
  ///
  /// Parameter [paymentOptions] :
  /// The payment options.
  ///
  /// Parameter [planTypes] :
  /// The plan type.
  ///
  /// Parameter [productType] :
  /// The product type.
  ///
  /// Parameter [serviceCodes] :
  /// The services.
  ///
  /// Parameter [usageTypes] :
  /// The usage details of the line item in the billing report.
  Future<DescribeSavingsPlansOfferingsResponse> describeSavingsPlansOfferings({
    List<String> currencies,
    List<String> descriptions,
    List<int> durations,
    List<SavingsPlanOfferingFilterElement> filters,
    int maxResults,
    String nextToken,
    List<String> offeringIds,
    List<String> operations,
    List<String> paymentOptions,
    List<String> planTypes,
    SavingsPlanProductType productType,
    List<String> serviceCodes,
    List<String> usageTypes,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9/=\+]+$''',
    );
    final $payload = <String, dynamic>{
      'currencies': currencies,
      'descriptions': descriptions,
      'durations': durations,
      'filters': filters,
      'maxResults': maxResults,
      'nextToken': nextToken,
      'offeringIds': offeringIds,
      'operations': operations,
      'paymentOptions': paymentOptions,
      'planTypes': planTypes,
      'productType': productType?.toValue(),
      'serviceCodes': serviceCodes,
      'usageTypes': usageTypes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeSavingsPlansOfferings',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSavingsPlansOfferingsResponse.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:[a-z]+:([a-z]{2}-[a-z]+-\d{1}|):(\d{12}):savingsplan\/([0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12})$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTagsForResource',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Adds the specified tags to the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// One or more tags. For example, { "tags": {"key1":"value1",
  /// "key2":"value2"} }.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:[a-z]+:([a-z]{2}-[a-z]+-\d{1}|):(\d{12}):savingsplan\/([0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TagResource',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Removes the specified tags from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:[a-z]+:([a-z]{2}-[a-z]+-\d{1}|):(\d{12}):savingsplan\/([0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UntagResource',
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSavingsPlanResponse {
  /// The ID of the Savings Plan.
  @_s.JsonKey(name: 'savingsPlanId')
  final String savingsPlanId;

  CreateSavingsPlanResponse({
    this.savingsPlanId,
  });
  factory CreateSavingsPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSavingsPlanResponseFromJson(json);
}

enum CurrencyCode {
  @_s.JsonValue('CNY')
  cny,
  @_s.JsonValue('USD')
  usd,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSavingsPlanRatesResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The ID of the Savings Plan.
  @_s.JsonKey(name: 'savingsPlanId')
  final String savingsPlanId;

  /// Information about the Savings Plans rates.
  @_s.JsonKey(name: 'searchResults')
  final List<SavingsPlanRate> searchResults;

  DescribeSavingsPlanRatesResponse({
    this.nextToken,
    this.savingsPlanId,
    this.searchResults,
  });
  factory DescribeSavingsPlanRatesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeSavingsPlanRatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSavingsPlansOfferingRatesResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the Savings Plans offering rates.
  @_s.JsonKey(name: 'searchResults')
  final List<SavingsPlanOfferingRate> searchResults;

  DescribeSavingsPlansOfferingRatesResponse({
    this.nextToken,
    this.searchResults,
  });
  factory DescribeSavingsPlansOfferingRatesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeSavingsPlansOfferingRatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSavingsPlansOfferingsResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the Savings Plans offerings.
  @_s.JsonKey(name: 'searchResults')
  final List<SavingsPlanOffering> searchResults;

  DescribeSavingsPlansOfferingsResponse({
    this.nextToken,
    this.searchResults,
  });
  factory DescribeSavingsPlansOfferingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeSavingsPlansOfferingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSavingsPlansResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the Savings Plans.
  @_s.JsonKey(name: 'savingsPlans')
  final List<SavingsPlan> savingsPlans;

  DescribeSavingsPlansResponse({
    this.nextToken,
    this.savingsPlans,
  });
  factory DescribeSavingsPlansResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSavingsPlansResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// Information about the tags.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Information about a Savings Plan offering.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ParentSavingsPlanOffering {
  /// The currency.
  @_s.JsonKey(name: 'currency')
  final CurrencyCode currency;

  /// The duration, in seconds.
  @_s.JsonKey(name: 'durationSeconds')
  final int durationSeconds;

  /// The ID of the offering.
  @_s.JsonKey(name: 'offeringId')
  final String offeringId;

  /// The payment option.
  @_s.JsonKey(name: 'paymentOption')
  final SavingsPlanPaymentOption paymentOption;

  /// The description.
  @_s.JsonKey(name: 'planDescription')
  final String planDescription;

  /// The plan type.
  @_s.JsonKey(name: 'planType')
  final SavingsPlanType planType;

  ParentSavingsPlanOffering({
    this.currency,
    this.durationSeconds,
    this.offeringId,
    this.paymentOption,
    this.planDescription,
    this.planType,
  });
  factory ParentSavingsPlanOffering.fromJson(Map<String, dynamic> json) =>
      _$ParentSavingsPlanOfferingFromJson(json);
}

/// Information about a Savings Plan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlan {
  /// The hourly commitment, in USD.
  @_s.JsonKey(name: 'commitment')
  final String commitment;

  /// The currency.
  @_s.JsonKey(name: 'currency')
  final CurrencyCode currency;

  /// The description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The EC2 instance family.
  @_s.JsonKey(name: 'ec2InstanceFamily')
  final String ec2InstanceFamily;

  /// The end time.
  @_s.JsonKey(name: 'end')
  final String end;

  /// The ID of the offering.
  @_s.JsonKey(name: 'offeringId')
  final String offeringId;

  /// The payment option.
  @_s.JsonKey(name: 'paymentOption')
  final SavingsPlanPaymentOption paymentOption;

  /// The product types.
  @_s.JsonKey(name: 'productTypes')
  final List<String> productTypes;

  /// The recurring payment amount.
  @_s.JsonKey(name: 'recurringPaymentAmount')
  final String recurringPaymentAmount;

  /// The AWS Region.
  @_s.JsonKey(name: 'region')
  final String region;

  /// The Amazon Resource Name (ARN) of the Savings Plan.
  @_s.JsonKey(name: 'savingsPlanArn')
  final String savingsPlanArn;

  /// The ID of the Savings Plan.
  @_s.JsonKey(name: 'savingsPlanId')
  final String savingsPlanId;

  /// The plan type.
  @_s.JsonKey(name: 'savingsPlanType')
  final SavingsPlanType savingsPlanType;

  /// The start time.
  @_s.JsonKey(name: 'start')
  final String start;

  /// The state.
  @_s.JsonKey(name: 'state')
  final SavingsPlanState state;

  /// One or more tags.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The duration of the term, in seconds.
  @_s.JsonKey(name: 'termDurationInSeconds')
  final int termDurationInSeconds;

  /// The up-front payment amount.
  @_s.JsonKey(name: 'upfrontPaymentAmount')
  final String upfrontPaymentAmount;

  SavingsPlan({
    this.commitment,
    this.currency,
    this.description,
    this.ec2InstanceFamily,
    this.end,
    this.offeringId,
    this.paymentOption,
    this.productTypes,
    this.recurringPaymentAmount,
    this.region,
    this.savingsPlanArn,
    this.savingsPlanId,
    this.savingsPlanType,
    this.start,
    this.state,
    this.tags,
    this.termDurationInSeconds,
    this.upfrontPaymentAmount,
  });
  factory SavingsPlan.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlanFromJson(json);
}

/// Information about a filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SavingsPlanFilter {
  /// The filter name.
  @_s.JsonKey(name: 'name')
  final SavingsPlansFilterName name;

  /// The filter value.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  SavingsPlanFilter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$SavingsPlanFilterToJson(this);
}

/// Information about a Savings Plan offering.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlanOffering {
  /// The currency.
  @_s.JsonKey(name: 'currency')
  final CurrencyCode currency;

  /// The description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The duration, in seconds.
  @_s.JsonKey(name: 'durationSeconds')
  final int durationSeconds;

  /// The ID of the offering.
  @_s.JsonKey(name: 'offeringId')
  final String offeringId;

  /// The specific AWS operation for the line item in the billing report.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The payment option.
  @_s.JsonKey(name: 'paymentOption')
  final SavingsPlanPaymentOption paymentOption;

  /// The plan type.
  @_s.JsonKey(name: 'planType')
  final SavingsPlanType planType;

  /// The product type.
  @_s.JsonKey(name: 'productTypes')
  final List<String> productTypes;

  /// The properties.
  @_s.JsonKey(name: 'properties')
  final List<SavingsPlanOfferingProperty> properties;

  /// The service.
  @_s.JsonKey(name: 'serviceCode')
  final String serviceCode;

  /// The usage details of the line item in the billing report.
  @_s.JsonKey(name: 'usageType')
  final String usageType;

  SavingsPlanOffering({
    this.currency,
    this.description,
    this.durationSeconds,
    this.offeringId,
    this.operation,
    this.paymentOption,
    this.planType,
    this.productTypes,
    this.properties,
    this.serviceCode,
    this.usageType,
  });
  factory SavingsPlanOffering.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlanOfferingFromJson(json);
}

enum SavingsPlanOfferingFilterAttribute {
  @_s.JsonValue('region')
  region,
  @_s.JsonValue('instanceFamily')
  instanceFamily,
}

/// Information about a filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SavingsPlanOfferingFilterElement {
  /// The filter name.
  @_s.JsonKey(name: 'name')
  final SavingsPlanOfferingFilterAttribute name;

  /// The filter values.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  SavingsPlanOfferingFilterElement({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() =>
      _$SavingsPlanOfferingFilterElementToJson(this);
}

/// Information about a property.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlanOfferingProperty {
  /// The property name.
  @_s.JsonKey(name: 'name')
  final SavingsPlanOfferingPropertyKey name;

  /// The property value.
  @_s.JsonKey(name: 'value')
  final String value;

  SavingsPlanOfferingProperty({
    this.name,
    this.value,
  });
  factory SavingsPlanOfferingProperty.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlanOfferingPropertyFromJson(json);
}

enum SavingsPlanOfferingPropertyKey {
  @_s.JsonValue('region')
  region,
  @_s.JsonValue('instanceFamily')
  instanceFamily,
}

/// Information about a Savings Plan offering rate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlanOfferingRate {
  /// The specific AWS operation for the line item in the billing report.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The product type.
  @_s.JsonKey(name: 'productType')
  final SavingsPlanProductType productType;

  /// The properties.
  @_s.JsonKey(name: 'properties')
  final List<SavingsPlanOfferingRateProperty> properties;

  /// The Savings Plan rate.
  @_s.JsonKey(name: 'rate')
  final String rate;

  /// The Savings Plan offering.
  @_s.JsonKey(name: 'savingsPlanOffering')
  final ParentSavingsPlanOffering savingsPlanOffering;

  /// The service.
  @_s.JsonKey(name: 'serviceCode')
  final SavingsPlanRateServiceCode serviceCode;

  /// The unit.
  @_s.JsonKey(name: 'unit')
  final SavingsPlanRateUnit unit;

  /// The usage details of the line item in the billing report.
  @_s.JsonKey(name: 'usageType')
  final String usageType;

  SavingsPlanOfferingRate({
    this.operation,
    this.productType,
    this.properties,
    this.rate,
    this.savingsPlanOffering,
    this.serviceCode,
    this.unit,
    this.usageType,
  });
  factory SavingsPlanOfferingRate.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlanOfferingRateFromJson(json);
}

/// Information about a filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SavingsPlanOfferingRateFilterElement {
  /// The filter name.
  @_s.JsonKey(name: 'name')
  final SavingsPlanRateFilterAttribute name;

  /// The filter values.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  SavingsPlanOfferingRateFilterElement({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() =>
      _$SavingsPlanOfferingRateFilterElementToJson(this);
}

/// Information about a property.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlanOfferingRateProperty {
  /// The property name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The property value.
  @_s.JsonKey(name: 'value')
  final String value;

  SavingsPlanOfferingRateProperty({
    this.name,
    this.value,
  });
  factory SavingsPlanOfferingRateProperty.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlanOfferingRatePropertyFromJson(json);
}

enum SavingsPlanPaymentOption {
  @_s.JsonValue('All Upfront')
  allUpfront,
  @_s.JsonValue('Partial Upfront')
  partialUpfront,
  @_s.JsonValue('No Upfront')
  noUpfront,
}

enum SavingsPlanProductType {
  @_s.JsonValue('EC2')
  ec2,
  @_s.JsonValue('Fargate')
  fargate,
  @_s.JsonValue('Lambda')
  lambda,
}

extension on SavingsPlanProductType {
  String toValue() {
    switch (this) {
      case SavingsPlanProductType.ec2:
        return 'EC2';
      case SavingsPlanProductType.fargate:
        return 'Fargate';
      case SavingsPlanProductType.lambda:
        return 'Lambda';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a Savings Plan rate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlanRate {
  /// The currency.
  @_s.JsonKey(name: 'currency')
  final CurrencyCode currency;

  /// The specific AWS operation for the line item in the billing report.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The product type.
  @_s.JsonKey(name: 'productType')
  final SavingsPlanProductType productType;

  /// The properties.
  @_s.JsonKey(name: 'properties')
  final List<SavingsPlanRateProperty> properties;

  /// The rate.
  @_s.JsonKey(name: 'rate')
  final String rate;

  /// The service.
  @_s.JsonKey(name: 'serviceCode')
  final SavingsPlanRateServiceCode serviceCode;

  /// The unit.
  @_s.JsonKey(name: 'unit')
  final SavingsPlanRateUnit unit;

  /// The usage details of the line item in the billing report.
  @_s.JsonKey(name: 'usageType')
  final String usageType;

  SavingsPlanRate({
    this.currency,
    this.operation,
    this.productType,
    this.properties,
    this.rate,
    this.serviceCode,
    this.unit,
    this.usageType,
  });
  factory SavingsPlanRate.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlanRateFromJson(json);
}

/// Information about a filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SavingsPlanRateFilter {
  /// The filter name.
  @_s.JsonKey(name: 'name')
  final SavingsPlanRateFilterName name;

  /// The filter values.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  SavingsPlanRateFilter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$SavingsPlanRateFilterToJson(this);
}

enum SavingsPlanRateFilterAttribute {
  @_s.JsonValue('region')
  region,
  @_s.JsonValue('instanceFamily')
  instanceFamily,
  @_s.JsonValue('instanceType')
  instanceType,
  @_s.JsonValue('productDescription')
  productDescription,
  @_s.JsonValue('tenancy')
  tenancy,
  @_s.JsonValue('productId')
  productId,
}

enum SavingsPlanRateFilterName {
  @_s.JsonValue('region')
  region,
  @_s.JsonValue('instanceType')
  instanceType,
  @_s.JsonValue('productDescription')
  productDescription,
  @_s.JsonValue('tenancy')
  tenancy,
  @_s.JsonValue('productType')
  productType,
  @_s.JsonValue('serviceCode')
  serviceCode,
  @_s.JsonValue('usageType')
  usageType,
  @_s.JsonValue('operation')
  operation,
}

/// Information about a property.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlanRateProperty {
  /// The property name.
  @_s.JsonKey(name: 'name')
  final SavingsPlanRatePropertyKey name;

  /// The property value.
  @_s.JsonKey(name: 'value')
  final String value;

  SavingsPlanRateProperty({
    this.name,
    this.value,
  });
  factory SavingsPlanRateProperty.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlanRatePropertyFromJson(json);
}

enum SavingsPlanRatePropertyKey {
  @_s.JsonValue('region')
  region,
  @_s.JsonValue('instanceType')
  instanceType,
  @_s.JsonValue('instanceFamily')
  instanceFamily,
  @_s.JsonValue('productDescription')
  productDescription,
  @_s.JsonValue('tenancy')
  tenancy,
}

enum SavingsPlanRateServiceCode {
  @_s.JsonValue('AmazonEC2')
  amazonEC2,
  @_s.JsonValue('AmazonECS')
  amazonECS,
  @_s.JsonValue('AWSLambda')
  awsLambda,
}

enum SavingsPlanRateUnit {
  @_s.JsonValue('Hrs')
  hrs,
  @_s.JsonValue('Lambda-GB-Second')
  lambdaGbSecond,
  @_s.JsonValue('Request')
  request,
}

enum SavingsPlanState {
  @_s.JsonValue('payment-pending')
  paymentPending,
  @_s.JsonValue('payment-failed')
  paymentFailed,
  @_s.JsonValue('active')
  active,
  @_s.JsonValue('retired')
  retired,
}

enum SavingsPlanType {
  @_s.JsonValue('Compute')
  compute,
  @_s.JsonValue('EC2Instance')
  eC2Instance,
}

enum SavingsPlansFilterName {
  @_s.JsonValue('region')
  region,
  @_s.JsonValue('ec2-instance-family')
  ec2InstanceFamily,
  @_s.JsonValue('commitment')
  commitment,
  @_s.JsonValue('upfront')
  upfront,
  @_s.JsonValue('term')
  term,
  @_s.JsonValue('savings-plan-type')
  savingsPlanType,
  @_s.JsonValue('payment-option')
  paymentOption,
  @_s.JsonValue('start')
  start,
  @_s.JsonValue('end')
  end,
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

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
