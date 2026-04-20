import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../constant/config.dart';
import '../dto/posts_dto.dart';

@injectable
class PostsApi {
  final Dio _dio;
  final Config _config;

  PostsApi(this._dio, this._config);

  Future<List<PostDto>> getPosts() async {
    final response = await _dio.get(_config.baseUrl.toString());
    final data = response.data as List;
    return data.map((e) => PostDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<PostDto> getPost(int id) async {
    final response = await _dio.get('${_config.baseUrl.toString()}/$id');
    return PostDto.fromJson(response.data as Map<String, dynamic>);
  }
}
