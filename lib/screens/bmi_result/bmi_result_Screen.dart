import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final int Result ;
  final bool isMale;
  final int age ;

  BMIResultScreen({
    required this.Result,
  required this.age,
    required this.isMale
});
  resultPhrase(){
    String resultText = " ";
    if (Result >= 30) {
      resultText = "Obese".toUpperCase();
    } else if (Result > 25 && Result < 30) {
      resultText = "Overweight".toUpperCase();
    } else if (Result >= 18.5 && Result <= 24.9) {
      resultText = "Normal".toUpperCase();
    } else {
      resultText = "Underweight".toUpperCase();
    }
    return resultText;
  }
  resultBio(){
    String resultBioText = "";
    if (Result >= 30) {
      resultBioText = "You have a higher than normal body weight\n\nTry to exercise more more more!";
    } else if (Result > 25 && Result < 30) {
      resultBioText = "You have a higher than normal body weight\n\nTry to exercise more!";
    } else if (Result >= 18.5 && Result <= 24.9) {
      resultBioText = "You have a normal body weight\n\nGood job!";
    } else {
      resultBioText = "You have a lower than normal body weight\n\nTry to eat more";
    }
    return resultBioText;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF43658b),
      appBar: AppBar(
        backgroundColor: Color(0xFF43658b),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'BMI Screen',
          style: TextStyle(
          fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(
            image: NetworkImage('https://www.pnbmetlife.com/content/dam/pnb-metlife/images/icons/bmi-calculator/meter.png'),
            fit: BoxFit.fill,
            height: 200.0,
            width: double.infinity,
          ),
          Text(
            'Your Result',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 32
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF1d1e33).withOpacity(.5),
                ),
                width: double.infinity,


                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultPhrase(),
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        '$Result',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Normal BMI Range:',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          // SizedBox(height: 10,),
                          Text(
                            '18.5 – 25 kg\/m2',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                      Text(
                        resultBio(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
