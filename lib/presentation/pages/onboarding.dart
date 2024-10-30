import 'package:flutter/material.dart';
import 'package:rental_car_app/presentation/pages/car_list_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    // Main body of the onboarding screen as a column layout
      backgroundColor: Colors.black26,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/steer.jpg'),
                  fit: BoxFit.cover)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Premium cars \nEnjoy the luxury',
                  style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
            
                  const Text('Premium and prestige car dailyrental. \nExperience the thrill at a lower price',
                  style: TextStyle(color: Colors.grey, fontSize: 16),),
                  const SizedBox(height: 20,),
            
                  SizedBox(
                    height: 54,
                    width: 320,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context)=> CarListScreen()),
                           (route)=> false);
                      },
                      
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white
                      ),
                      child: const Text('Let\'s Go', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}