import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_car_app/domain/usecases/get_cars.dart';
import 'package:rental_car_app/presentation/bloc/car_event.dart';
import 'package:rental_car_app/presentation/bloc/car_state.dart';


// Bloc class responsible for handling car-related events and managing
class CarBloc extends Bloc<CarEvent, CarState>{
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarsLoading()) {
    on<LoadCars>((event,emit) async{
      emit(CarsLoading());
      try{
        final cars = await getCars.call();
        emit(CarsLoaded(cars));
      }catch(e){
        emit(CarsError(e.toString()));
      }
    });
  }
}