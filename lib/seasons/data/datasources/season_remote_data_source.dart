import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kora_test_app/core/api/endpoints.dart';
import 'package:kora_test_app/core/errors/failure.dart';
import 'package:kora_test_app/core/errors/server_exception.dart';
import 'package:kora_test_app/core/network/network_exception.dart';
import 'package:kora_test_app/seasons/data/models/season_team_model.dart';

abstract class SeasonRemoteDataSource{
  Future<List<SeasonTeamModel>> getSeasonTeams(String seasonId);
}


class SeasonRemoteDatasourceImplementation implements SeasonRemoteDataSource{

  @override
  Future<List<SeasonTeamModel>> getSeasonTeams(String seasonId) async{
    final response = await Dio().get(
      Endpoints.competitionSeasonTeamsUrl(seasonId)
    );
    
    if(response.statusCode == 200){
      return List<SeasonTeamModel>.from((response.data['season_competitors'] as List).map((e) => SeasonTeamModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: const ErrorMessageModel(message: "Server Exception In Season Teams", statusCode: 200));
    }
  }

}