import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:marvel_app/models/marvel_params.dart';
import 'package:marvel_app/data/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/data/utils/api_utils.dart';

void main() {
  group('Api utils', () {
    test('Expect return null if limit is null and offset is null', () {
      var api = createMarvelApi(limit: 20);
      expect(api, null);
    });
    test('Expect return null if offset valid and limit null', () {
      var api = createMarvelApi(offset: 20);
      expect(api, null);
    });
    test('Create params for paginated request', () {

      MarvelParams apiParams = createMarvelApi(limit: 20, offset: 0);
      String tsKey = apiParams.params['ts'];
      var bytes = utf8.encode('$tsKey$private_key$public_key');
      String md5Hash = md5.convert(bytes).toString();
      
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader : 'application/json'
      };
      Map<String, String> params = getPaginatedParams(apiParams.params['ts'], md5Hash, 20, 0);

      MarvelParams apiMarvelParams = MarvelParams(hearders: headers, params: params);

      expect(apiParams.params, apiMarvelParams.params);

    });

    test('Create params for request', () {

      MarvelParams apiParams = createMarvelApi();
      String tsKey = apiParams.params['ts'];
      var bytes = utf8.encode('$tsKey$private_key$public_key');
      String md5Hash = md5.convert(bytes).toString();
      
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader : 'application/json'
      };
      Map<String, String> params = getParams(apiParams.params['ts'], md5Hash);

      MarvelParams apiMarvelParams = MarvelParams(hearders: headers, params: params);

      expect(apiParams.params, apiMarvelParams.params);

    });
  });
}