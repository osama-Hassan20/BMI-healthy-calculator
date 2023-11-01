import 'dart:math';
import 'package:flutter/material.dart';
import '../bmi_result/bmi_result_Screen.dart';

class MBIScreen extends StatefulWidget {

  @override
  State<MBIScreen> createState() => _MBIScreenState();
}

class _MBIScreenState extends State<MBIScreen> {
  bool isMale = true;
  double height = 160;

  int weight = 70;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF43658b),
        title: const Text(
          'BMI healthy calculator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body:
      Column(
        children: [
          Expanded  (
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color: isMale? Colors.orange : Colors.grey[400],
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male,
                              size: 80,
                              ),

                              Text(
                                'MALE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color: isMale? Colors.grey[400] : Colors.orange,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female,
                                size: 80,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                child: Container(
                  decoration: BoxDecoration(

                    borderRadius:BorderRadius.circular(10),
                    color: Colors.grey[400],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                            ),
                          ),
                          const Text(
                            'cm',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: height,
                          max: 220,
                          min: 80,
                          onChanged: (value){
                            setState(() {
                              height = value;
                            });
                          },
                      )
                    ],
                  ),

                ),
              ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                              Text(
                              '$weight',
                                style: const TextStyle(
                                 fontWeight: FontWeight.w900,
                                fontSize: 40
                                ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        weight--;
                                      });

                                    },
                                  heroTag: 'weight-',
                                  mini: true,
                                  child: const Icon(
                                    Icons.remove,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight ++;
                                    });
                                  },
                                  heroTag: 'weight+',
                                  mini: true,
                                  child: const Icon(
                                    Icons.add,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'AGE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              '$age',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 40
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  heroTag: 'age-',
                                  mini: true,
                                  child: const Icon(
                                    Icons.remove,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age ++;
                                    });
                                  },
                                  heroTag: 'age+',
                                  mini: true,
                                  child:  Icon(
                                    Icons.add,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              color: Color(0xFF43658b),
              onPressed: ()
              {
               var Result = weight / pow(height / 100, 2);
               print(Result.round());
               
               Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (context) => BMIResultScreen(
                         age: age,
                         isMale: isMale,
                         Result: Result.round(),
                       ),
                   ),
               );
             },
              height: 50,
            child: const Text(
              'CALCULATE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
          ),
        ],
      )
      ,
    );
  }

}
