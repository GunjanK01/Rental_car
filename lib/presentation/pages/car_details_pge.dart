import 'package:flutter/material.dart';
import 'package:rental_car_app/data/models/car.dart';
import 'package:rental_car_app/presentation/pages/maps_details_page.dart';
import 'package:rental_car_app/presentation/widgets/car_card.dart';
import 'package:rental_car_app/presentation/widgets/more_card.dart';


//Car details page dislaying car info and a map animated button
class CarDetailsPge extends StatefulWidget {
  final Car car;

  const CarDetailsPge({super.key, required this.car});

  @override
  State<CarDetailsPge> createState() => _CarDetailsPgeState();
}

class _CarDetailsPgeState extends State<CarDetailsPge> with SingleTickerProviderStateMixin {

  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this);

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
    ..addListener((){setState(() {
      
    });});

    _controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [Icon(Icons.info_outline),
                  SizedBox(width: 10,),
                Text('Information')],
                )
              ],
            )
          ],
        ),
      ),
       body: SingleChildScrollView(
         child: Column(
          children: [
         
            CarCard(car: Car(model: widget.car.model, distance: widget.car.distance, fuelCapacity: widget.car.fuelCapacity, pricePerHour: widget.car.pricePerHour),),
            const SizedBox(height: 20,),
         
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
         
              child: Row(
                children: [
                  Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ]
                  ),
                  child: const Column(
                    children: [
                      CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/user.png'),),
                      SizedBox(height: 10,),
                      Text('Andrew Garfield', style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('\$4,537', style: TextStyle(color: Colors.grey),),
                    
                    
                    ],
                    
                
                  ),
                  
                ),
                
              ),
              const SizedBox(width: 20,),
         
              Expanded(  
                child: GestureDetector(
                  onTap:  (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MapsDetailsPage(car: widget.car,)));
                        },
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/maps.png'),
                        fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                  
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          )
                        ],
                    ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Transform.scale(
                      scale: _animation!.value,
                      alignment: Alignment.center,
                      child: Image.asset('assets/maps.png', fit: BoxFit.cover,),
                    ),
                  ),
                  ),
                ),
              ),
              
                ],
              ),
            ),
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                MoreCard(car: Car(model: widget.car.model, distance: widget.car.distance+100, fuelCapacity: widget.car.fuelCapacity+5, pricePerHour: widget.car.pricePerHour+7),),
                const SizedBox(height: 10,),
                MoreCard(car:Car(model: widget.car.model, distance: widget.car.distance+330, fuelCapacity: widget.car.fuelCapacity+10, pricePerHour: widget.car.pricePerHour+11),),
                const SizedBox(height: 10,),
                MoreCard(car: Car(model: widget.car.model, distance: widget.car.distance+230, fuelCapacity: widget.car.fuelCapacity, pricePerHour: widget.car.pricePerHour),),
                const SizedBox(height: 10,),
              ],
            ),
          )
          ],
         ),
       ),
       
    );
  }
}