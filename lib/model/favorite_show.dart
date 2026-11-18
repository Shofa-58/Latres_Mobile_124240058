import 'package:hive/hive.dart';

class FavoriteShow extends HiveObject {
  final int id;
  final String name;
  final double rating;
  final String image;

  FavoriteShow({
    required this.id,
    required this.name,
    required this.rating,
    required this.image,
  });
}

// Adapter manual (tanpa build_runner)
class FavoriteShowAdapter extends TypeAdapter<FavoriteShow> {
  @override
  final int typeId = 1;

  @override
  FavoriteShow read(BinaryReader reader) {
    return FavoriteShow(
      id: reader.readInt(),
      name: reader.readString(),
      rating: reader.readDouble(),
      image: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteShow obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeDouble(obj.rating);
    writer.writeString(obj.image);
  }
}