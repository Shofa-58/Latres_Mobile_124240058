import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/detail_controller.dart';
import '../../controller/favorite_controller.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});
  final DetailController controller = Get.find<DetailController>();
  final FavoriteController fav = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        final show = controller.show;
        if (show == null) {
          return Center(child: Text(controller.error));
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (show.image.isNotEmpty)
                Image.network(show.image,
                    width: double.infinity, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(show.name,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        IconButton(
                          onPressed: () => fav.toggle(show),
                          icon: Icon(
                            fav.isFavorite(show.id)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      const Icon(Icons.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(show.rating?.toString() ?? '-'),
                    ]),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: show.genres
                          .map((g) => Chip(label: Text(g)))
                          .toList(),
                    ),
                    const SizedBox(height: 12),
                    const Text('Overview',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(show.summary, textAlign: TextAlign.justify),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}