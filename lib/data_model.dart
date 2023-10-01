import 'package:hive/hive.dart';

// part '';

@HiveType(typeId: 0)
class Blog extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String imageUrl;

  Blog({required this.title, required this.imageUrl});
}
