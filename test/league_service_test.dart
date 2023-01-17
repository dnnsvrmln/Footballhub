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
  group("Name of the league should be correct.", () {
    var inputLeagueIdToExpectedLeagueName = {
      39: "Premier League",
      61: "Ligue 1",
      78: "Bundesliga",
      88: "Eredivisie",
      135: "Serie A",
      140: "La Liga",
    };

    inputLeagueIdToExpectedLeagueName
        .forEach((inputLeagueId, expectedLeagueName) {
      test(
          "LeagueId: '$inputLeagueId' should be equal to league name: '$expectedLeagueName'.",
          () async {
        WidgetsFlutterBinding.ensureInitialized();

        var league = await LeagueService.getMockLeague(inputLeagueId);

        expect(league.name, expectedLeagueName);
      });
    });
  });

  group("Amount of teams of the league should be correct.", () {
    var inputLeagueIdToExpectedLeagueTeams = {
      39: 20,
      61: 20,
      78: 18,
      88: 18,
      135: 20,
      140: 20,
    };

    inputLeagueIdToExpectedLeagueTeams
        .forEach((inputLeagueId, expectedLeagueTeams) {
      test(
          "LeagueId: '$inputLeagueId' should be equal to amount of teams: '$expectedLeagueTeams'.",
          () async {
        WidgetsFlutterBinding.ensureInitialized();

        var league = await LeagueService.getMockLeague(inputLeagueId);

        expect(league.standings[0].length, expectedLeagueTeams);
      });
    });
  });

  group("Country of the league should be correct.", () {
    var inputLeagueIdToExpectedLeagueCountry = {
      39: "England",
      61: "France",
      78: "Germany",
      88: "Netherlands",
      135: "Italy",
      140: "Spain",
    };

    inputLeagueIdToExpectedLeagueCountry
        .forEach((inputLeagueId, expectedLeagueCountry) {
      test(
          "LeagueId: '$inputLeagueId' should be equal to country: '$expectedLeagueCountry'.",
          () async {
        WidgetsFlutterBinding.ensureInitialized();

        var league = await LeagueService.getMockLeague(inputLeagueId);

        expect(league.country, expectedLeagueCountry);
      });
    });
  });
}
