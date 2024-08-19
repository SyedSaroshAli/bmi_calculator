

import 'package:bmi_calculator/bmi_screen.dart';
import 'package:bmi_calculator/widgets/neubox.dart';
import 'package:bmi_calculator/widgets/neubox2.dart';
import 'package:bmi_calculator/widgets/neubox_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double? BMI ;
  double height = 170;
  bool male = false;
  bool female = false;
  
  

   

   void errorMessage(String content){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (value){
      return AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: Row(
          children: [
            Icon(Icons.error_outline,color: Colors.red,),
            Text(' Error',
            style: TextStyle(
              color: Colors.red,
            ),)
          ],
        ),
        content: Text(content,
        style: TextStyle(
              color: Colors.white
            )),

        actions: [
           InkWell(
            onTap: (){
              Navigator.pop(context);
            },
             child: Text('OK',
             style: TextStyle(
               color: Colors.blue
             ),),
           )
        ],
      );
    });
  }

  void calculateBMI(){
    
     double weight = double.parse(weightController.text);
     
     double denominator = height/100;
     BMI = weight/(denominator*denominator);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:  Colors.grey.shade900,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

               Stack(
                children: [
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('BMI CALCULATOR',
                   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   ),),                 
                 ],
               ),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu,color: Colors.white,),
                      GestureDetector(
                        onTap: (){
                          print('1');
                          setState(() {
                            weightController.text='';
                            ageController.text='';
                            male= false;
                            female = false; 
                            height = 170;
                          });
                         
                         ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Refreshed')),
                          snackBarAnimationStyle: AnimationStyle(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.elasticInOut));
                        },
                        child: Icon(Icons.refresh_rounded,color: Colors.white,))
                    ],
                   )       
                ]
               ),
                       
               SizedBox(height: MediaQuery.of(context).size.height/30,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text('Select your gender',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 18,
                     fontWeight: FontWeight.w500
                   ),),
                 ],
               ),
                                
                SizedBox(height: MediaQuery.of(context).size.height/35,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  GestureDetector(
                   onTap: (){
                     setState(() {
                         male = true;
                         female = false;
                     });
                  
                   },
                    child: NeuBoxGender(
                     color: male? Colors.blue : Colors.grey.shade900 ,
                     child: Container(
                       padding: EdgeInsets.all(20),
                     
                       child: Column(
                         children: [
                           Icon(Icons.male_rounded,
                           size: 40,
                           color:male? Colors.white: Colors.blue,),
                           Text('  MALE  ',
                           style: TextStyle(
                             color: male? Colors.white: Colors.blue,
                             fontSize: 16,
                           ),)
                         ],
                       ),
                     )),
                  ),
                    
                    GestureDetector(
                      onTap: (){
                       setState(() {
                         female = true;
                         male = false;
                       });
                      },
                      child: NeuBoxGender(
                      color: female? Colors.pink : Colors.grey.shade900, 
                                        child: Container(
                       padding: EdgeInsets.all(20),
                       child: Column(
                         children: [
                           Icon(Icons.female_rounded,
                           size: 40,
                           color: female?Colors.white: Colors.pink,),
                           Text('FEMALE',
                           style: TextStyle(
                             color:female? Colors.white: Colors.pink,
                             fontSize: 16
                           ),)
                         ],
                       ),
                                        )),
                    )  
                 ],
               ),
               
               SizedBox(height: MediaQuery.of(context).size.height/30,),
               NeuBox(
                 child: Column(
                   children: [
                     Text('Height',
                     style: TextStyle(
                       fontWeight: FontWeight.w500,
                       color: Colors.white,
                       fontSize: 18
                     ),),
                     
                     SizedBox(height: 5,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(height.toString(),
                         style: TextStyle(
                           fontSize: 30,
                           color: Colors.white,
                           fontWeight: FontWeight.bold
                         ),),
                         
                         SizedBox(width: 5,),
                         Text('cm',
                         style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                         ),)
                       ],
                     ),
                     Slider(
                       min:100,
                       max: 220,
                       value: height,
                       divisions: 120, 
                       onChanged: (value){
                         setState(() {
                           height= value;
                         });
                       } )
                   ],
                 )),
                 
                 SizedBox(height: MediaQuery.of(context).size.height/28,),
                 Row(
                   children: [
                     Expanded(
                       child: NeuBox(
                         child: Container(
                           padding: EdgeInsets.all(20),
                           child: Column(
                             children: [
                                Text('Age',
                                  style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                 color: Colors.white,
                                fontSize: 18
                                               ),),
                                         
                               TextField(
                                 controller: ageController,
                                 textAlign: TextAlign.center,
                                 keyboardType: TextInputType.number,
                                 style: TextStyle(
                                   color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                   fontSize: 17
                                 ),
                                 decoration: InputDecoration(),
                               )
                             ],),
                         )),
                     ),
                     
                     SizedBox(width: 15,),
                                
                      Expanded(
                        child: NeuBox(
                         child: Container(
                           padding: EdgeInsets.symmetric(vertical: 20,),
                           child: Column(
                             children: [
                                 Text('Weight in kgs',
                                               style: TextStyle(
                                                 fontWeight: FontWeight.w500,
                                                 color: Colors.white,
                                                 fontSize: 18
                                               ),),
                                          
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                   controller: weightController,
                                   textAlign: TextAlign.center,
                                   keyboardType: TextInputType.number,
                                   style: TextStyle(
                                     color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                     fontSize: 17
                                   ),
                                   decoration: InputDecoration(),
                                                                ),
                                )
                             ],),
                         )),
                      )    
                   ],
                 ),
               
               SizedBox(height: MediaQuery.of(context).size.height/25,),
               
               GestureDetector(
                 onTap: (){
                                
                  
                   if(male==false && female == false && weightController.text=='' &&ageController.text==''){
                     errorMessage('Please enter your weight,age and select gender');
                   }

                   else if(weightController.text==''&&ageController.text==''){
                    errorMessage('Please enter your age and weight');
                   }
                   else if (male==false && female==false){
                     errorMessage('Please select gender');
                   }
                   
                                
                   else if(weightController.text==''){
                     errorMessage('Please enter the weight');
                   }
                    
                  else if(ageController.text==''){
                    errorMessage('Please enter your age');
                  }
                 
                  else if(male==true || female ==true &&weightController.text!='' &&ageController.text!=''){
                         calculateBMI();
                   setState(() {
                     
                   });
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiCalculateScreen(BMI: BMI!,age: ageController.text,)));
                   }
                   
                                
                  
                 },
                 child: NeuBox2(
                   child: Container(
                   padding: EdgeInsets.symmetric(vertical: 20),
                   width: double.infinity,
                   
                   decoration: BoxDecoration(
                     color: Colors.deepPurple,
                     borderRadius: BorderRadius.circular(10)
                   ),
                     child: Center(child: Text('Calculate',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                       fontSize:  16,
                     
                     ),)),
                   ),
                 ),
               ),
               
               SizedBox(height: MediaQuery.of(context).size.height/50,),
               Text('Designed By Syed Sarosh Ali',
               style: TextStyle(
                 color: Colors.white
               ),),
             ],
           ),
         ),
      ),
    );
  }
}