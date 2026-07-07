import 'package:hive_flutter/hive_flutter.dart';
part 'bmimodel.g.dart';

@HiveType(typeId: 0)
class Bmi extends HiveObject {
  Bmi({required this.height, required this.weight, required this.date});

  @HiveField(0)
  final double height;
  @HiveField(1)
  final double weight;
  @HiveField(2)
  final DateTime date;
}
