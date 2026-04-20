import 'package:injectable/injectable.dart';

import '../network/api/posts_api.dart';
import '../network/dto/posts_dto.dart';

@singleton
class PostsRepository {
  final PostsApi _api;

  PostsRepository(this._api);

  Future<List<PostDto>> getPosts() => _api.getPosts();

  Future<PostDto> getPost(int id) => _api.getPost(id);
}
