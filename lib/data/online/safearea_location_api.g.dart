// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safearea_location_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SafeAreaLocationApi implements SafeAreaLocationApi {
  _SafeAreaLocationApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<FetchAddressResponse> pointSafearea(
    latitude,
    longitude,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lat': latitude,
      r'long': longitude,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FetchAddressResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/eagle_netra_api/location/address',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FetchAddressResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddSafeAreaDetailsResponse> setSafeAreaDetails(
    userId,
    smartCardId,
    locationName,
    longitude,
    latitude,
    valuefirst,
    valuesecond,
    radius,
    locationAddress,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'safe_area_name': locationName,
      'longitude': longitude,
      'latitude': latitude,
      'alert_on_entry': valuefirst,
      'alert_on_exit': valuesecond,
      'safe_area_radius': radius,
      'address': locationAddress,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddSafeAreaDetailsResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/eagle_netra_api/user/${userId}/${smartCardId}/safearea/insert',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddSafeAreaDetailsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AreaDetailsResponse> editSafearea(
    smartCardId,
    safeAreaId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'smartCardId': smartCardId,
      r'safeAreaId': safeAreaId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AreaDetailsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/eagle_netra_api/eagle/getSafeAreaDetails',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AreaDetailsResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
