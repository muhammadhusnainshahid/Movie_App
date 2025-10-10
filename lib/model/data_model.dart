class MovieData{
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final String originalLanguage;
  final bool adult;
  final bool video;
  final String name;
  final int voteCount;
  final String originalName;
  final double voteAverage;
  final String releaseDate;
  bool isWatched;
  MovieData({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalName,
    required this.adult,
    required this.video,
    required this.name,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    this.isWatched = false,
    });

    factory MovieData.fromJson(Map<String,dynamic> json){
      return MovieData(
        id: json['id'] ?? 0, 
        title: json['title'] ?? json['name'], 
        overview: json['overview'] ?? 'No overview', 
        backdropPath: json['backdrop_path'] ?? 'No back drop image', 
        posterPath: json['poster_path'] ?? 'No path', 
        originalLanguage: json['original_language']?? '', 
        originalName: json['original_name'] ?? '',
        adult: json['adult']?? false, 
        name: json['name'] ?? '',
        video: json['video']?? false,
        releaseDate: json['release_date']?? '', 
        voteAverage: json['vote_average']?? 0.0, 
        voteCount: json['vote_count']?? 0);
    } 
}