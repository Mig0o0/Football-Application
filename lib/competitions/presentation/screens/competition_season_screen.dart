import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kora_test_app/competitions/presentation/controllers/competition_bloc.dart';
import 'package:kora_test_app/competitions/presentation/controllers/competition_state.dart';
import 'package:kora_test_app/core/enums/request_status.dart';
import 'package:kora_test_app/seasons/presentation/controllers/season_bloc.dart';
import 'package:kora_test_app/seasons/presentation/controllers/season_events.dart';
import 'package:kora_test_app/seasons/presentation/screens/season_teams_screen.dart';

class CompetitionSeasonScreen extends StatelessWidget {
  final String competitionName;
  const CompetitionSeasonScreen({required this.competitionName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(competitionName),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          child: BlocBuilder<CompetitionBloc, CompetitionState>(
            builder: (context, state) {
              switch (state.competitionSeasonStatus) {
                case RequestStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case RequestStatus.loaded:
                  return ListView.builder(
                    itemCount: state.competitionSeasons.length,
                    itemBuilder: (context, index) {
                      final season = state.competitionSeasons[index];
                      return ListTile(
                        title: Text(season.name),
                        subtitle: Text("${season.startDate} to ${season.endDate}"),
                        onTap: (){
                          BlocProvider.of<SeasonBloc>(context).add(GetSeasonTeamsEvent(seasonId: season.id));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SeasonTeamScreen(),),);
                        },
                      );
                    },
                  );
                case RequestStatus.error:
                  return const Center(
                    child: Text("Error"),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
