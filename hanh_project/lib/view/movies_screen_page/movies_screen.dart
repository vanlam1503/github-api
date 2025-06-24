import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hanh_project/view/movies_screen_page/movies_view_model.dart';
import 'package:hanh_project/view/popular_screen_page/popular_screen.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen({super.key});

  @override
  ConsumerState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesScreen>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    ref.read(moviesViewModelProvider.notifier).initSate();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(moviesViewModelProvider);
    if (state.movies.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              tabs: const [
                Tab(
                  text: "Popular",
                ),
                Tab(
                  text: "Nowplaying",
                ),
              ],
              controller: controller,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: const [
                  PopularScreen(),
                  Text("Nowplaying"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
