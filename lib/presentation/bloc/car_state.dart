import 'package:rental_car_app/data/models/car.dart';

// Base class for all possible states related to car data.
// This is an abstract class that specific states extend.

abstract class CarState {}

class CarsLoading extends CarState{}

// State representing a successful loading of car data.
class CarsLoaded extends CarState{
  final List<Car> cars;
  CarsLoaded(this.cars);
}

// State to represent an error that occurred while loading car data.
class CarsError extends CarState{
  final String message;
  CarsError(this.message);
}
