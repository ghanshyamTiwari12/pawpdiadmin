
class City {
  final String cityName;
  final String countryName;

  City({
    required this.cityName,
    required this.countryName,
  });

  factory City.fromCsvList(List<String> row) {
    return City(
      cityName: row[0],
      countryName: '${row[2]}, ${row[1]}',
    );
  }

  @override
  String toString() {
    return '$cityName, $countryName';
  }
}
