import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../common/common.dart';
import 'post_state.dart';

@injectable
class PostCubit extends Cubit<PostState> {
  final PostsRepository _repository;

  PostCubit(this._repository) : super(const PostState());

  Future<void> loadPost(int id) async {
    emit(state.copyWith(isLoading: true));
    try {
      final post = await _repository.getPost(id);
      emit(SuccessPostState(state: state.copyWith(isLoading: false, post: post)));
    } on ApiException catch (e) {
      emit(FailurePostState(error: e.userMessage, state: state.copyWith(isLoading: false)));
    } catch (e) {
      emit(FailurePostState(error: 'An error occurred: $e', state: state.copyWith(isLoading: false)));
    }
  }
}
