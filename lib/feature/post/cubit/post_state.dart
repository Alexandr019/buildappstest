import 'package:equatable/equatable.dart';

import '../../../common/common.dart';

class PostState extends Equatable {
  const PostState({this.isLoading = false, this.post});

  final bool isLoading;
  final PostDto? post;

  PostState copyWith({bool? isLoading, PostDto? post}) {
    return PostState(isLoading: isLoading ?? this.isLoading, post: post ?? this.post);
  }

  @override
  List<Object?> get props => [isLoading, post];
}

class SuccessPostState extends PostState {
  SuccessPostState({required PostState state}) : super(isLoading: state.isLoading, post: state.post);

  @override
  List<Object?> get props => [...super.props];
}

class FailurePostState extends PostState {
  FailurePostState({required this.error, required PostState state})
    : super(isLoading: state.isLoading, post: state.post);

  final String error;

  @override
  List<Object?> get props => [...super.props, error];
}
