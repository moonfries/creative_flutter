class Screenings {
  final String title;
  final String poster;
  final String date;
  final String time;
  final String cinemaDetailName;
  final String cinemaDetailProfile;

  Screenings({
    required this.title,
    required this.poster,
    required this.date,
    required this.time,
    required this.cinemaDetailName,
    required this.cinemaDetailProfile,
  });

  factory Screenings.fromJson(Map<String, dynamic> json) {
    return Screenings(
      title: json['title'],
      poster: json['poster'],
      date: json['date'],
      time: json['time'],
      cinemaDetailName: json['cinema_detail']['name'],
      cinemaDetailProfile: json['cinema_detail']['profile'],
    );
  }
}
