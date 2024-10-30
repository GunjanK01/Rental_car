import 'package:rental_car_app/data/models/car.dart';
import 'package:rental_car_app/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async{
    return await repository.fetchCars();
  }
}