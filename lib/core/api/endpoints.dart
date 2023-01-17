class Endpoints{
  static const String baseUrl = "https://api.sportradar.us/soccer/trial/v4/en";
  static const String _apiKey = "<YOUR_API_KEY>";


  static const String allCompetitions = "$baseUrl/competitions.json?api_key=$_apiKey";

  static String competitionSeasonUrl(String competitionId) => "$baseUrl/competitions/$competitionId/seasons.json?api_key=$_apiKey";
  static String competitionSeasonTeamsUrl(String seasonId) => "$baseUrl/seasons/$seasonId/competitors.json?api_key=$_apiKey";
}
