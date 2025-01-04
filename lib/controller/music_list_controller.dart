import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicListController extends GetxController {
  final RxList<SongModel> songs = RxList();
  final OnAudioQuery _audioQuery = OnAudioQuery();
  RxList<SongModel> foundSongs = RxList<SongModel>([]);
  Rxn<SongModel> currentSong = Rxn<SongModel>();

  void onInit() {
    fetchMusic();
    super.onInit();
  }

  Future<void> fetchMusic() async {
    await _getMusicFiles();
    print('aaa **songs.length **** ${songs.length}*** ');
  }

  Future<void> _getMusicFiles() async {
    List<SongModel> fetchedSong = await _audioQuery.querySongs();
    songs.value = fetchedSong;
    print('aaa ******* ${fetchedSong.length} * ${songs.length} * ');
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
    print("****************");
    print('aaa **** query ***** ${query}');
    print('aaa **** foundSongs.length ***** ${foundSongs.length}');
    print('aaa **** songs.length ***** ${songs.length}');
    print("****************");
    foundSongs.refresh();
  }

  // ========================
  // Player Methods

  void changeSong({required SongModel song}) {
    // currentSong
    currentSong.value = song;
  }

  void prevSong() {
    int currentSongIndex = songs.indexWhere(
      (element) => currentSong.value == element,
    );
    currentSong.value = songs.elementAt(currentSongIndex - 1);
  }

  void nextSong() {
    int currentSongIndex = songs.indexWhere(
      (element) => currentSong.value == element,
    );
    currentSong.value = songs.elementAt(currentSongIndex + 1);
  }
}
