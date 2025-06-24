import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hanh_project/view/movies_screen_page/movies_view_model.dart';

import 'components/popular_stack_image.dart';

class PopularScreen extends ConsumerWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final movies = ref.watch(moviesViewModelProvider).movies;
    return GridView.builder(
      padding: const EdgeInsets.only(
        top: 31,
        left: 16,
        right: 16,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 18.4,
        mainAxisSpacing: 31,
        crossAxisCount: 2,
        mainAxisExtent: 290,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return PopularStackImage(
          nameImage:
              // ignore: prefer_interpolation_to_compose_strings
              'https://image.tmdb.org/t/p/w500' + movies[index].posterPath,
          date: movies[index].releaseDate,
          title: movies[index].title,
        );
      },
    );
  }
}
