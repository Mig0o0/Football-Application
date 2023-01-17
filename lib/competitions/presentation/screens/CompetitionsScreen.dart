import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kora_test_app/competitions/presentation/controllers/competition_bloc.dart';
import 'package:kora_test_app/competitions/presentation/controllers/competition_events.dart';
import 'package:kora_test_app/competitions/presentation/controllers/competition_state.dart';
import 'package:kora_test_app/competitions/presentation/screens/competition_season_screen.dart';
import 'package:kora_test_app/core/enums/request_status.dart';

class CompetitionsScreen extends StatelessWidget {
  const CompetitionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Competitions"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          child: BlocBuilder<CompetitionBloc, CompetitionState>(
            builder: (context, state) {
              switch (state.competitionStatus) {
                case RequestStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case RequestStatus.loaded:
                  return ListView.builder(
                    itemCount: state.competitions.length,
                    itemBuilder: (context, index) {
                      final competition = state.competitions[index];
                      return ListTile(
                        title: Text(competition.name),
                        subtitle: Text(competition.category.name),
                        onTap: () {
                          BlocProvider.of<CompetitionBloc>(context).add(
                            GetCompetitionSeasonsEvent(
                              competitionId: competition.id,
                            ),
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CompetitionSeasonScreen(
                                competitionName: competition.name,
                              ),
                            ),
                          );
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
