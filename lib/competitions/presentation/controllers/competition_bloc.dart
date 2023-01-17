import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kora_test_app/competitions/domain/usecases/get_all_competitions.dart';
import 'package:kora_test_app/competitions/domain/usecases/get_competition_seasons.dart';
import 'package:kora_test_app/competitions/presentation/controllers/competition_events.dart';
import 'package:kora_test_app/competitions/presentation/controllers/competition_state.dart';
import 'package:kora_test_app/core/enums/request_status.dart';
import 'package:kora_test_app/core/usecases/abstract_parameters.dart';

class CompetitionBloc extends Bloc<CompetitionEvent, CompetitionState> {
  final GetAllCompetitions getAllCompetitions;
  final GetCompetitionSeasons getCompetitionSeasons;

  CompetitionBloc({
    required this.getAllCompetitions,
    required this.getCompetitionSeasons,
  }) : super(const CompetitionState()) {
    on<GetAllCompetitionsEvent>((event, emit) async {
      final result = await getAllCompetitions(NoParameters());

      result.fold(
        (error) => emit(
          state.copyWith(
            competitionMessage: error.message,
            competitionStatus: RequestStatus.error,
          ),
        ),
        (competitions) => emit(
          state.copyWith(
            competitions: competitions,
            competitionStatus: RequestStatus.loaded,
          ),
        ),
      );
    });

    on<GetCompetitionSeasonsEvent>((event, emit) async {
      final result = await getCompetitionSeasons(
          CompetitionSeasonParameters(competitionId: event.competitionId));

      result.fold(
        (error) => emit(
          state.copyWith(
            competitionSeasonMessage: error.message,
            competitionSeasonStatus: RequestStatus.error,
          ),
        ),
        (result) => emit(
          state.copyWith(
            competitionSeasons: result,
            competitionSeasonStatus: RequestStatus.loaded,
          ),
        ),
      );
    });
  }
}
