import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latreske2/routes/app_routes.dart';
import '../../controller/favorite_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final FavoriteController controller = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Favorit')),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return const Center(child: Text('Belum ada favorit'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.favorites.length,
          itemBuilder: (context, i) {
            final f = controller.favorites[i];
            return Card(
              color: Colors.grey[900],
              child: ListTile(
                onTap: () => Get.toNamed(AppRoutes.detail, arguments: f.id),
                leading: f.image.isEmpty
                    ? const Icon(Icons.movie)
                    : Image.network(f.image,
                        width: 40, height: 50, fit: BoxFit.cover),
                title: Text(f.name),
                subtitle: Row(children: [
                  const Icon(Icons.star, size: 14, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('${f.rating}'),
                ]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () => controller.remove(f.id),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}