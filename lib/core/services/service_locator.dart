import 'package:get_it/get_it.dart';
import 'package:kora_test_app/competitions/data/datasources/remote_data_source.dart';
import 'package:kora_test_app/competitions/data/repositories/competition_repository_implementation.dart';
import 'package:kora_test_app/competitions/domain/repositories/base_competition_repository.dart';
import 'package:kora_test_app/competitions/domain/usecases/get_all_competitions.dart';
import 'package:kora_test_app/competitions/domain/usecases/get_competition_seasons.dart';
import 'package:kora_test_app/competitions/presentation/controllers/competition_bloc.dart';
import 'package:kora_test_app/seasons/data/datasources/season_remote_data_source.dart';
import 'package:kora_test_app/seasons/data/repositories/season_repository_implmentation.dart';
import 'package:kora_test_app/seasons/domain/repositories/season_repository_abstraction.dart';
import 'package:kora_test_app/seasons/domain/usecases/get_season_teams.dart';
import 'package:kora_test_app/seasons/presentation/controllers/season_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    // Bloc
    getIt.registerFactory(
      () => CompetitionBloc(
        getAllCompetitions: getIt(),
        getCompetitionSeasons: getIt(),
      ),
    );

    getIt.registerFactory(
      () => SeasonBloc(
        getSeasonTeams: getIt(),
      ),
    );

    // Use Cases
    getIt.registerLazySingleton<GetAllCompetitions>(
      () => GetAllCompetitions(
        repository: getIt(),
      ),
    );

    getIt.registerLazySingleton<GetCompetitionSeasons>(
      () => GetCompetitionSeasons(
        competitionRepository: getIt(),
      ),
    );

    getIt.registerLazySingleton<GetSeasonTeams>(
      () => GetSeasonTeams(
        seasonRepository: getIt(),
      ),
    );

    // Repository
    getIt.registerLazySingleton<BaseCompetitionRepository>(
      () => CompetitionRepository(
        remoteDataSource: getIt(),
      ),
    );

    getIt.registerLazySingleton<SeasonRepositoryAbstraction>(
      () => SeasonRepositoryImplementation(
        remoteDataSource: getIt(),
      ),
    );

    // Data Sources
    getIt.registerLazySingleton<RemoteDataSource>(
      () => CompetitionRemoteDataSource(),
    );

    getIt.registerLazySingleton<SeasonRemoteDataSource>(
      () => SeasonRemoteDatasourceImplementation(),
    );
  }
}
