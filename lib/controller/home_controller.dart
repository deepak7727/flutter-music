import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeController extends GetxController {
  final RxList<SongModel> songs = RxList();
  final OnAudioQuery _audioQuery = OnAudioQuery();
  RxList<SongModel> foundSongs = RxList<SongModel>([]);

  @override
  void onInit() {
    fetchMusic();
  }

  @override
  void onReady() {
    fetchMusic();
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
      foundSongs = songs;
    } else {
      searchResultSong = songs
          .where(
            (song) => song.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    foundSongs.value = searchResultSong;
    print(songs.length);
    print('aaa **** foundSongs.value ***** ${foundSongs.length}');
    print('aaa **** searchResultSong ***** ${searchResultSong.length}');
  }
}
