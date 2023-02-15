// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addcard_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AddcardApi implements AddcardApi {
  _AddcardApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AddCardResponse> addCardDetails(
    userId,
    kidname,
    deviceId,
    cardNumber,
    addCls,
    age,
    image,
    number1,
    number2,
    number3,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'name',
      kidname,
    ));
    _data.fields.add(MapEntry(
      'device_id',
      deviceId,
    ));
    _data.fields.add(MapEntry(
      'card_number',
      cardNumber,
    ));
    _data.fields.add(MapEntry(
      'class',
      addCls,
    ));
    _data.fields.add(MapEntry(
      'age',
      age,
    ));
    _data.files.add(MapEntry(
      'profile_image',
      MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'number1',
      number1,
    ));
    _data.fields.add(MapEntry(
      'number2',
      number2,
    ));
    _data.fields.add(MapEntry(
      'number3',
      number3,
    ));
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AddCardResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/eagle_netra_api/smartcard/${userId}/insert',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddCardResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FetchProfileDetailsResponse> getUserDetails(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FetchProfileDetailsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/eagle_netra_api/user/${userId}/show',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FetchProfileDetailsResponse.fromJson(_result.data!);
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
