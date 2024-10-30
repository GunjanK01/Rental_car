import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_car_app/presentation/bloc/car_bloc.dart';
import 'package:rental_car_app/presentation/bloc/car_state.dart';
import 'package:rental_car_app/presentation/widgets/car_card.dart';


//Screen to display a list of cars for users to choose from. 
class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,

      // BlocBuilder listens to CarBloc's states and rebuilds the UI based on the state.
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state){
          // Show loading spinner while cars are being loaded
          if(state is CarsLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          // Show a list of cars once the data has been loaded successfully
          else if(state is CarsLoaded){
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index){
              return CarCard(car: state.cars[index]);
            });
          }
          // Basically shows error msg if there was an issue loading the data
          else if (state is CarsError){
            return Center(child: Text('error: ${state.message}'),);
          }
          // Return an empty container if the state is unhandled
          return Container();
        },
      )
      
    );
  }
}