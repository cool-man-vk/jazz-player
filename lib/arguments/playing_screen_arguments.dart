class PlayingScreenArgs {
  final String songName;
  final String image;
  final String music;
  final bool isFavorite;
  final int index;

  PlayingScreenArgs( {
    required this.songName ,
    required this.image,
    required this.music ,
    required this.isFavorite,
    required this.index
  });
}