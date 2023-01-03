// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_app/services/league_service.dart';

void main() {
  var leagueService = LeagueService();

  test('Name of league is Premier League', () async {
    WidgetsFlutterBinding.ensureInitialized();

    var league = await leagueService.getMockLeague();

    expect(league.name, "Premier League");
  });

  test('Amount of Premier League clubs is 20', () async {
    WidgetsFlutterBinding.ensureInitialized();

    var league = await leagueService.getMockLeague();

    expect(league.standings[0].length, 20);
  });
}
