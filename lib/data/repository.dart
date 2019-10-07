import 'package:http/http.dart' as http;
import 'package:marvel_app/models/api_response.dart';
import 'api/characters_marvel.dart';

class Repository {
  http.Client _client;
  
  Repository(this._client);
  
  Future<ServerResponse> requestCharacters(int offset) async {
    return await MarvelApi(limit: 10, offset: offset).fetch(_client);
  }

  Future<ServerResponse> singleRequest(String url) async {
    return await MarvelApi.singleRequest(url).fetch(_client);
  }

}