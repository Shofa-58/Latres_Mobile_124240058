import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/show_controller.dart';
import '../../routes/app_routes.dart';
import '../widgets/show_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ShowController controller = Get.find<ShowController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skuy Nonton!')),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.error, textAlign: TextAlign.center),
                const SizedBox(height: 12),
                ElevatedButton(
                    onPressed: controller.fetchShows,
                    child: const Text('Coba lagi')),
              ],
            ),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.shows.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.66,
          ),
          itemBuilder: (context, i) {
            final s = controller.shows[i];
            return ShowCard(
              title: s.name,
              rating: s.rating,
              image: s.image,
              onTap: () => Get.toNamed(AppRoutes.detail, arguments: s.id),
            );
          },
        );
      }),
    );
  }
}