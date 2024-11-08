abstract class BaseApiServices {
  Future<dynamic> gatGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
