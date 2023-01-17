class VenueEntity {
  final String id;
  final String name;
  final String cityName;
  final String countryName;
  final String mapCoordinates;
  final String countryCode;
  final String timezone;

  VenueEntity({
    required this.id,
    required this.name,
    required this.cityName,
    required this.countryName,
    required this.mapCoordinates,
    required this.countryCode,
    required this.timezone,
  });
}
