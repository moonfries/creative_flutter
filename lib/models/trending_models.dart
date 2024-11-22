class Trending {
  final String title;
  final String poster;
  final String cinema;
  final String date;
  final String time;
  final int totalAttend;
  final int totalTarget;
  final String text;
  final String status;
  final String creatorName;
  final String creatorProfile;
  final String? notes;

  Trending({
    required this.title,
    required this.poster,
    required this.cinema,
    required this.date,
    required this.time,
    required this.totalAttend,
    required this.totalTarget,
    required this.text,
    required this.status,
    required this.creatorName,
    required this.creatorProfile,
    this.notes,
  });

  factory Trending.fromJson(Map<String, dynamic> json) {
    return Trending(
      title: json['title'],
      poster: json['poster'],
      cinema: json['cinema'],
      date: json['date'],
      time: json['time'],
      totalAttend: json['screening_detail']['total_attend'],
      totalTarget: json['screening_detail']['total_target'],
      text: json['screening_detail']['text'],
      status: json['screening_detail']['status'],
      creatorName: json['creator_detail']['name'],
      creatorProfile: json['creator_detail']['profile'],
      notes: json['notes'],
    );
  }
}
