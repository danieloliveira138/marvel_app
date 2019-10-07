import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:marvel_app/models/api_response.dart';
import 'package:marvel_app/models/marvel_response.dart';
import 'package:marvel_app/data/utils/api_utils.dart';
import 'package:marvel_app/data/utils/constants.dart';

class MarvelApi {
  int limit;
  int offset;
  String id;
  Uri uri;
  Map<String, String> headers;

  MarvelApi({this.limit, this.offset, this.id}) {

    final marvelParams = createMarvelApi(limit: limit, offset: offset);
    String api = id != null ? '$characters_api/$id' : '$characters_api';
    
    headers = marvelParams.hearders;
    uri = Uri.https(base_url, api, marvelParams.params);
    print(uri.toString());
  }

  MarvelApi.singleRequest(String url) {
    String requestUrl = url.replaceAll('http:', '');
    requestUrl = requestUrl.replaceAll('//', '');
    requestUrl = requestUrl.replaceAll(base_url, '');
    print(requestUrl);
    final marvelParams = createMarvelApi();
    headers = marvelParams.hearders;
    uri = Uri.http(base_url,requestUrl ,marvelParams.params);
    print(uri.toString());

  }

  Future<ServerResponse> fetch(http.Client client) async {

    http.Response response;

    try {
      response = await client.get(uri, headers: headers);

      if (response.statusCode == 200) {
        return _makeTheApiResponse(response);
      } else {
        return _createErrorResponse(response);
      }

    } catch (exception) {

      return ServerResponse<HttpException>( false, 400, HttpException(exception.toString()));
      
    }
  }

  ServerResponse _makeTheApiResponse (http.Response httpResponse) {
        return ServerResponse<ApiResponse> (
          true,
          httpResponse.statusCode,
          ApiResponse.fromJson(json.decode(httpResponse.body)),
        );
    }

  _createErrorResponse(http.Response response, {HttpException exception}) {
      return ServerResponse<HttpException>(
        false,
        response.statusCode,
        exception ?? Exception('Server error'),
      );
  }
}