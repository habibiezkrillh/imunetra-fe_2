class Event {
  final String id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final String timeRange;
  final String location;
  final String imagePath;

  Event({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.timeRange,
    required this.location,
    required this.imagePath,
  });
}