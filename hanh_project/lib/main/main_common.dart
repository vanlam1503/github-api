import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hanh_project/flavors.dart';
import 'package:hanh_project/view/movies_screen_page/movies_screen.dart';

void mainCommon() async {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: Flavor.appFlavor != AppFlavor.prod,
        home: MoviesScreen(),
      ),
    ),
  );
}
