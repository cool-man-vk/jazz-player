class FavoriteScreenArgs {
  final String image ;
  final String songName;                  
  final String music;
  final String movieName;
  bool isFavorite;

  FavoriteScreenArgs({
    required this.image ,
    required this.songName,
    required this.music ,
    required this.movieName,
    required this.isFavorite
  });
}