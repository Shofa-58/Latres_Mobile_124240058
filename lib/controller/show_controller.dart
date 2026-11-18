import 'package:get/get.dart';
import '../model/show.dart';
import '../service/api_service.dart';

class ShowController extends GetxController {
  final ApiService _service = ApiService();

  final RxList<Show> _shows = <Show>[].obs;
  final RxBool _isLoading = false.obs;
  final RxString _error = ''.obs;

  List<Show> get shows => _shows;
  bool get isLoading => _isLoading.value;
  String get error => _error.value;

  @override
  void onInit() {
    fetchShows();
    super.onInit();
  }

  Future<void> fetchShows() async {
    try {
      _isLoading.value = true;
      _error.value = '';
      _shows.assignAll(await _service.fetchShows());
    } catch (e) {
      _error.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }
}