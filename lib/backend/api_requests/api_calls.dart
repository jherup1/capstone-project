import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetLatLngCall {
  static Future<ApiCallResponse> call({
    String? address = '',
    String? key = 'AIzaSyBD7zoR8IGqcxH7BfVtJ_p5UkT641BQzTY',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLatLng',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$key',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address': address,
        'key': "AIzaSyBD7zoR8IGqcxH7BfVtJ_p5UkT641BQzTY",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
      ));
  static double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
