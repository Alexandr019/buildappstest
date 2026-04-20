import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/home_cubit.dart';

import '../../../common/common.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..loadPosts(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text('Explore Feed', style: h1),
          actions: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return PostsCount(title: '${state.posts.length} POSTS');
              },
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator(color: darkBgColor));
              }
          
              if (state is FailureHomeState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.error}', style: h2w500, textAlign: TextAlign.center),
                      const SizedBox(height: 16),
                      RetryButton(onPressed: () => context.read<HomeCubit>().loadPosts()),
                    ],
                  ),
                );
              }
          
              if (state is SuccessHomeState) {
                final posts = state.posts;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return PostsItem(
                        title: post.title,
                        body: post.body,
                        onTap: () {
                          PostRoute(id: post.id).go(context);
                        },
                      );
                    },
                  ),
                );
              }
          
              return const Center(child: Text('No data', style: h2w500));
            },
          ),
        ),
      ),
    );
  }
}
