import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicListController extends GetxController {
  final RxList<SongModel> songs = RxList();
  final OnAudioQuery _audioQuery = OnAudioQuery();
  RxList<SongModel> foundSongs = RxList<SongModel>([]);

  void onInit() {
    fetchMusic();
    super.onInit();
  }

  Future<void> fetchMusic() async {
    await _getMusicFiles();
  }

  Future<void> _getMusicFiles() async {
    List<SongModel> fetchedSong = await _audioQuery.querySongs();
    songs.value = fetchedSong;
  }

  void searchSong({required String query}) {
    List<SongModel> searchResultSong = [];
    if (query.isEmpty) {
      searchResultSong = songs;
    } else {
      searchResultSong = songs
          .where(
            (song) => song.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    foundSongs.value = searchResultSong;
    foundSongs.refresh();
  }
}
