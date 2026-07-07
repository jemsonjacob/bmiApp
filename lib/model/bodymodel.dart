import 'package:hive_flutter/hive_flutter.dart';
part 'bodymodel.g.dart';

@HiveType(typeId: 0)
class Body extends HiveObject {
  Body({required this.height, required this.weight, required this.date});

  @HiveField(2)
  final DateTime date;

  @HiveField(0)
  final double height;

  @HiveField(1)
  final double weight;
}
