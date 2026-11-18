import 'package:get/get.dart';
import '../model/show.dart';
import '../service/api_service.dart';

class DetailController extends GetxController {
  final ApiService _service = ApiService();

  final Rxn<Show> _show = Rxn<Show>();
  final RxBool _isLoading = true.obs;
  final RxString _error = ''.obs;

  Show? get show => _show.value;
  bool get isLoading => _isLoading.value;
  String get error => _error.value;

  @override
  void onInit() {
    fetchDetail(Get.arguments as int);
    super.onInit();
  }

  Future<void> fetchDetail(int id) async {
    try {
      _isLoading.value = true;
      _show.value = await _service.fetchShowDetail(id);
    } catch (e) {
      _error.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }
}