part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.isLoading = false, this.posts = const []});

  final bool isLoading;
  final List<PostDto> posts;

  HomeState copyWith({bool? isLoading, List<PostDto>? posts}) {
    return HomeState(isLoading: isLoading ?? this.isLoading, posts: posts ?? this.posts);
  }

  @override
  List<Object> get props => [isLoading, posts];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super();
}

class SuccessHomeState extends HomeState {
  SuccessHomeState({required HomeState state}) : super(isLoading: state.isLoading, posts: state.posts);

  @override
  List<Object> get props => [...super.props];
}

class FailureHomeState extends HomeState {
  FailureHomeState({required this.error, required HomeState state})
    : super(isLoading: state.isLoading, posts: state.posts);

  final String error;

  @override
  List<Object> get props => [...super.props, error];
}
