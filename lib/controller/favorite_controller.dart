import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../model/favorite_show.dart';
import '../model/show.dart';

class FavoriteController extends GetxController {
  final Box<FavoriteShow> _box = Hive.box<FavoriteShow>('favorites');
  final RxList<FavoriteShow> _favorites = <FavoriteShow>[].obs;

  List<FavoriteShow> get favorites => _favorites;

  @override
  void onInit() {
    _favorites.assignAll(_box.values);
    super.onInit();
  }

  bool isFavorite(int id) => _favorites.any((f) => f.id == id);

  Future<void> toggle(Show show) async {
    if (isFavorite(show.id)) {
      await remove(show.id);
      Get.snackbar('Favorit', '${show.name} dihapus dari favorit');
    } else {
      final fav = FavoriteShow(
        id: show.id,
        name: show.name,
        rating: show.rating ?? 0,
        image: show.image,
      );
      await _box.put(show.id, fav);
      _favorites.add(fav);
      Get.snackbar('Favorit', '${show.name} ditambahkan ke favorit');
    }
  }

  Future<void> remove(int id) async {
    await _box.delete(id);
    _favorites.removeWhere((f) => f.id == id);
  }
}