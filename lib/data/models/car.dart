class Car {
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Car({
    required this.model, 
    required this.distance, 
    required this.fuelCapacity, 
    required this.pricePerHour
    });


 factory Car.fromMap(Map<String, dynamic> map) {
  return Car(
    model: map['model'], // Assuming model is always a String
    distance: map['distance'] is String
        ? double.parse(map['distance'])  // If it's a string, convert to double
        : map['distance'].toDouble(),    // If it's already a number, cast to double
    fuelCapacity: map['fuelCapacity'] is String
        ? double.parse(map['fuelCapacity'])
        : map['fuelCapacity'].toDouble(),
    pricePerHour: map['pricePerHour'] is String
        ? double.parse(map['pricePerHour'])
        : map['pricePerHour'].toDouble(),
  );
}


}

