class Product {
  late double bmi ;
  late String condition;
  late double water;


  static const tableName = 'products';
  static const colBMI = 'bmi';
  static const colCondition = 'condition';
  static const colWater = 'water';


  Product({
    required this.bmi,
    required this.condition,
    required this.water,
  });

  Map<String, dynamic> toMap() {
    var mapData = <String, dynamic>{
      colBMI: bmi,
      colCondition: condition,
      colWater: water,
    };
    return mapData;
  }
}