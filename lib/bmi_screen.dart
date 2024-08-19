import 'package:bmi_calculator/home_screen.dart';
import 'package:bmi_calculator/widgets/neubox.dart';
import 'package:bmi_calculator/widgets/neubox_gender.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class BmiCalculateScreen extends StatelessWidget {
  final double BMI;
  final age;
  const BmiCalculateScreen({super.key,
  required this.BMI, this.age});

  @override
  Widget build(BuildContext context) {
    
    String healthStatus;
    
    if(BMI<18.5){
      healthStatus = 'UnderWeight';
    }
    else if(BMI>=18.5 && BMI<24.9){
      healthStatus = 'Normal Weight';
    }
    else if(BMI>=25.0 && BMI<29.9){
      healthStatus = 'Overweight';
    }
    else{
      healthStatus ='Obesity';
    }

    return Scaffold(
      backgroundColor:  Colors.grey.shade900,
       body: SafeArea(
         child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

               Padding(
                 padding: const EdgeInsets.only(left:10),
                 child: Row(
                 
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                      },
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 25,),
                    ),
                    
                    const SizedBox(width: 15,),
                    const Text('Your Result',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),)
                  ],
                 ),
               ),
               
               SizedBox(height: MediaQuery.of(context).size.height/7.5,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 30),
                 child: NeuBox(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        if(healthStatus=='UnderWeight')
                    Text(healthStatus,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                             
                    if(healthStatus=='Normal Weight')
                    Text(healthStatus,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                             
                    if(healthStatus=='Overweight')
                    Text(healthStatus,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                             
                    if(healthStatus=='Obesity')
                    Text(healthStatus,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                 
                SizedBox(height: MediaQuery.of(context).size.height/40,),
                 PrettyGauge(
                  startMarkerStyle :const TextStyle(fontSize:13, color: Colors.white),
                  endMarkerStyle : const TextStyle(fontSize: 13, color: Colors.white),
                  gaugeSize: 200,
                  minValue: 0,
                  maxValue: 40,
                  segments: [
                    GaugeSegment('UnderWeight', 18.5, Colors.blue),
                    GaugeSegment('Normal', 6.4, Colors.green),
                    GaugeSegment('OverWeight', 5, Colors.orange),
                    GaugeSegment('Obesity', 10.1, Colors.red),
                  ],
                  currentValue: BMI,
                  needleColor: Colors.grey.shade400,
                  valueWidget: Text(BMI.toStringAsFixed(1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold               
                    ),),
                 ),
               
                 SizedBox(height: MediaQuery.of(context).size.height/90,),
                              
                  
                 
                    
                  if(healthStatus=='UnderWeight')
                    const Text('Are you sure you’re not part-time on a diet? You might blow away in a strong wind! 🍃',
                     textAlign: TextAlign.center,
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                             
                    if(healthStatus=='Normal Weight')
                    const Text('Congratulations! You’re the Goldilocks of BMI—just right! 🥇',
                     textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                             
                    if(healthStatus=='Overweight')
                    const Text('You’ve got some extra baggage—carry-on only! 😁',
                     textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                             
                    if(healthStatus=='Obesity')
                    const Text('Time to hit the gym! Remember, sweat is just fat crying! 💦',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                     
                      ],
                    ),
                  )),
               ),

             
             SizedBox(height: MediaQuery.of(context).size.height/15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Share.share('Your BMI is ${BMI.toStringAsFixed(1)} at the age of $age');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right:30),
                      child: NeuBoxGender(
                        color: Colors.grey.shade800,
                        child: Container(
                         
                          margin: const EdgeInsets.only(  
                          right:15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            
                            ),
                            child: const Row(
                               
                              children: [
                                Text('  Share',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                                ),),
                                SizedBox(width: 10,),
                                Icon(Icons.share,color: Colors.white,)
                              ],
                            ),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
              
            ],
          ),
         ),
       ),
    );
  }
}