import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:path/path.dart' as p;
import 'package:redux_strucuture/utils/config/config.dart';


import 'policy.dart';

class AwsPage {
  Future<String> upload(File file) async {
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    String imageExt = p.extension(file.path).toString();
    const _awsUserPoolId = 'us-east-1_TFY3tJ0lM';
    const _awsClientId = '2og4v1gen58kp5vd8k0u7o9usp';

    const _identityPoolId = 'us-east-1:e0a202eb-70a9-46b6-96d4-e701ddee9c35';
    final _userPool = CognitoUserPool(_awsUserPoolId, _awsClientId);


    final _credentials = CognitoCredentials(_identityPoolId, _userPool);
    const _region = 'us-east-2';
    const s3Endpoint = 'https://myswimbuddy.s3.us-east-2.amazonaws.com/';


    final stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
    final length = await file.length();

    final uri = Uri.parse(s3Endpoint);
    final req = http.MultipartRequest("POST", uri);
    final multipartFile = http.MultipartFile('file', stream, length,
        filename: path.basename(file.path));

    final policy = Policy.fromS3PreSignedPost(
        '$imageName$imageExt',
        AWSConstants.getBucketName(),  //"myswimbuddy"
        15,
        _credentials.accessKeyId,
        length,
        _credentials.sessionToken,
        region: _region);

    req.files.add(multipartFile);
    req.fields['key'] = policy.key;
    req.fields['acl'] = 'public-read';

    print("file ${file.path}");

    try {
      final res = await req.send();
      await for (var value in res.stream.transform(utf8.decoder)) {
        print(value);
//        return value;
      }
      print(s3Endpoint + policy.key);
    } catch (e) {
      print(" catch $e");
    }
    return '${s3Endpoint + policy.key}';
  }
}