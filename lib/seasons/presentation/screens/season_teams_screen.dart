import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kora_test_app/core/enums/request_status.dart';
import 'package:kora_test_app/seasons/presentation/controllers/season_bloc.dart';
import 'package:kora_test_app/seasons/presentation/controllers/season_states.dart';

class SeasonTeamScreen extends StatelessWidget {
  const SeasonTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Season"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          child: BlocBuilder<SeasonBloc, SeasonState>(
            builder: (context, state) {
              switch (state.seasonStatus) {
                case RequestStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case RequestStatus.loaded:
                  return ListView.builder(
                    itemCount: state.teams.length,
                    itemBuilder: (context, index) {
                      final team = state.teams[index];
                      return ListTile(
                        title: Text(team.fullName),
                        subtitle: Text("${team.shortName} ( ${team.abbreviation} )"),
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
