import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../home/components/home_body.dart';
import '../../resources/constants.dart';
import '../../services/league_service.dart';
import '../../models/league.dart';

class HomePage extends StatefulWidget {
  final String leagueId;
  final String seasonYear;

  const HomePage({
    super.key,
    required this.leagueId,
    required this.seasonYear,
  });

  @override
  State<HomePage> createState() => _HomePageState();

  String leagueLogoString() {
    switch (leagueId) {
      case "39":
        return "lib/assets/images/premier-league-logo.png";
      case "88":
        return "lib/assets/images/eredivisie-brand-stamp-full.png";
      case "140":
        return "lib/assets/images/LaLiga_Santander_logo_(stacked).png";
      case "61":
        return "lib/assets/images/Ligue1.png";
      case "135":
        return "lib/assets/images/Serie_A_logo_2022.png";
      default:
        return "lib/assets/images/Bundesliga_logo_(2017).png";
    }
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? appBackgroundColor
          : appBackgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: appBackgroundColor,
            expandedHeight: 108,
            elevation: 0,
            iconTheme: const IconThemeData(color: appTextColor),
            flexibleSpace: FlexibleSpaceBar(
              title: Image.asset(
                widget.leagueLogoString(),
                height: 60,
                fit: BoxFit.contain,
              ),
              titlePadding: const EdgeInsets.only(top: 48, bottom: 12),
            ),
            pinned: true,
          ),
        ],
        body: FutureBuilder(
          future: LeagueService().getLeague(widget.leagueId, widget.seasonYear),
          // future: LeagueService().getLeague(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Oops, an error occured!'),
              );
            } else {
              return HomeBody(league: snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
