import 'package:get/get.dart';
import '../controller/detail_controller.dart';
import '../controller/favorite_controller.dart';
import '../controller/show_controller.dart';
import '../view/pages/detail_page.dart';
import '../view/pages/login_page.dart';
import '../view/pages/root_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(
      name: AppRoutes.root,
      page: () => RootPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ShowController>(() => ShowController());
        Get.lazyPut<FavoriteController>(() => FavoriteController());
      }),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => DetailPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<DetailController>(() => DetailController());
      }),
    ),
  ];
}
