import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:marvel_app/models/marvel_params.dart';
import 'package:marvel_app/data/utils/constants.dart';

MarvelParams createMarvelApi({int limit, int offset}) {

  if ((limit == null && offset != null) || (limit != null && offset == null)) {
    return null;
  }

  String instantKey = Random().nextInt(1000000).toString();
  String publicKey = public_key;
  String privateKey = private_key;

  var bytes = utf8.encode('$instantKey$privateKey$publicKey');
  
  String md5Hash = md5.convert(bytes).toString();

  Map<String, String> params;

  if(limit != null && offset != null) {
    params = getPaginatedParams(instantKey, md5Hash, limit, offset);
  }

  if(limit == null && offset == null) {
    params = getParams(instantKey, md5Hash);
  }

  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader : 'application/json'
  };

  return MarvelParams(
    hearders: headers,
    params : params
  );

}

Map<String, String> getPaginatedParams(instantKey, md5Hash, limit, offset) {
  return  {
    'ts' : instantKey,
    'apikey' : public_key,
    'hash' : md5Hash,
    'limit' : limit.toString(),
    'offset' : offset.toString()
  };
}

Map<String, String> getParams(instantKey, md5Hash) {
  return {
    'ts' : instantKey,
    'apikey' : public_key,
    'hash' : md5Hash,
  };
}