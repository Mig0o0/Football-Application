class TeamPlayerEntity {
  final String id;
  final String name;
  final String type;
  final String dateOfBirth;
  final String nationality;
  final String countryCode;
  final int? height;
  final int? weight;
  final int jerseyNumber;
  final String? preferredFoot;
  final String? placeOfBirth;
  final String gender;

  TeamPlayerEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.dateOfBirth,
    required this.nationality,
    required this.countryCode,
    required this.height,
    required this.weight,
    required this.jerseyNumber,
    required this.preferredFoot,
    required this.placeOfBirth,
    required this.gender,
  });
}
