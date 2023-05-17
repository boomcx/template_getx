export 'params.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

/// https://pub.dev/packages/retrofit
@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /// 退出登录
  @DELETE('/user/logout')
  Future<void> logout();

  // @GET('https://api.thecatapi.com/v1/images/search')
  // Future<List<ArticleModel>> getArticle(
  //   @Query('limit') int limit,
  // );
  // Future<List<ArticleModel>> getArticle(@Queries() Map<String, dynamic> query);
}
