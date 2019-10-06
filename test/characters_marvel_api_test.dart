import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/models/api_response.dart';
import 'package:marvel_app/data/api/characters_marvel.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

main() {
  group('Fetch characters', () {
    test('Test successfully request', () async {
      final mockApi = MockClient();
      final apiMarvel = MarvelApi();
      print(apiMarvel.uri);
      when(mockApi.get(apiMarvel.uri, headers: apiMarvel.headers))
        .thenAnswer((_) async => http.Response(response, 200));    

      expect(await apiMarvel.fetch(mockApi), TypeMatcher<ServerResponse>());
  
    });

  });
}

const String response = '{\"code\": 200, \"status\": \"Ok\", \"copyright\": \"data\", \"attributionText\": \"data\", attributionHTML: \"data\", \"etag\": \"data\", \"data\":{}}';