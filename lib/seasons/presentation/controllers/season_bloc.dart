import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kora_test_app/core/enums/request_status.dart';
import 'package:kora_test_app/seasons/domain/usecases/get_season_teams.dart';
import 'package:kora_test_app/seasons/presentation/controllers/season_events.dart';
import 'package:kora_test_app/seasons/presentation/controllers/season_states.dart';

class SeasonBloc extends Bloc<SeasonEvent, SeasonState> {
  final GetSeasonTeams getSeasonTeams;

  SeasonBloc({required this.getSeasonTeams}) : super(const SeasonState()) {
    on<GetSeasonTeamsEvent>((event, emit) async {
      final result =
          await getSeasonTeams(SeasonTeamParameters(seasonId: event.seasonId));

      result.fold(
        (error) => emit(
          state.copyWith(
            seasonStatus: RequestStatus.error,
            seasonMessage: error.message,
          ),
        ),
        (teams) => emit(
          state.copyWith(
            teams: teams,
            seasonStatus: RequestStatus.loaded,
          ),
        ),
      );
    });
  }
}
