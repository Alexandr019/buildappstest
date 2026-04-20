import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'cubit/post_cubit.dart';
import 'cubit/post_state.dart';

import '../../common/common.dart';

class PostPage extends StatelessWidget {
  final int id;

  const PostPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PostCubit>()..loadPost(id),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextButton.icon(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new, color: secondaryVariantColor, size: 20),
                  label: Text('Back to Feed', style: h2w500.copyWith(color: secondaryVariantColor)),
                ),
              ),
              BlocBuilder<PostCubit, PostState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Expanded(child: const Center(child: CircularProgressIndicator(color: darkBgColor)));
                  }

                  if (state is FailurePostState) {
                    return Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Error: ${state.error}', style: h2w500, textAlign: TextAlign.center),
                            const SizedBox(height: 16),
                            RetryButton(onPressed: () => context.read<PostCubit>().loadPost(id)),
                          ],
                        ),
                      ),
                    );
                  }

                  final post = state.post;
                  if (post == null) {
                    return Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Post data is unavailable', style: h2w500, textAlign: TextAlign.center),
                            const SizedBox(height: 16),
                            RetryButton(onPressed: () => context.read<PostCubit>().loadPost(id)),
                          ],
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: PostDetails(postID: post.id, authorID: post.userId, title: post.title, body: post.body),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
