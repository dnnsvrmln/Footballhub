import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/resources/constants.dart';
import 'package:football_app/services/league_service.dart';
import 'package:football_app/views/overview/overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Football app",
      themeMode: ThemeMode.system,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => LeagueService(),
          ),
        ],
        child: const OverviewPage(),
      ),
    );
  }
}
