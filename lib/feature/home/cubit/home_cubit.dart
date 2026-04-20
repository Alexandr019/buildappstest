import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../common/common.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final PostsRepository _repository;

  HomeCubit(this._repository) : super(const HomeState());

  Future<void> loadPosts() async {
    emit(state.copyWith(isLoading: true));
    try {
      final posts = await _repository.getPosts();
      emit(SuccessHomeState(state: state.copyWith(isLoading: false, posts: posts)));
    } on ApiException catch (e) {
      emit(FailureHomeState(error: e.userMessage, state: state.copyWith(isLoading: false)));
    } catch (e) {
      emit(FailureHomeState(error: 'An error occurred: $e', state: state.copyWith(isLoading: false)));
    }
  }
}
