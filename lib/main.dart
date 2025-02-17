import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ffsd'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = '';

  var bgColor = Colors.indigo.shade300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('BMI APP'),
      ),
      body: Container(
          color: bgColor,
          child:  Center(
      child : Container(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BMI', style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700
            ),),

            SizedBox(height: 21,),

           TextField(
             controller: wtController,
             decoration: InputDecoration(
               label: Text('Enter Your Weight(In Kg)'),
               prefixIcon: Icon(Icons.line_weight)
             ),
             keyboardType:  TextInputType.number,
           ),

            SizedBox(height: 11,),

           TextField(
             controller: ftController,
             decoration: InputDecoration(
               label: Text('Enter Your Height(In Kg)'),
               prefixIcon: Icon(Icons.height)
             ),
             keyboardType: TextInputType.number,
           ),

            SizedBox(height: 11,),

            TextField(
              controller: inController,
              decoration: InputDecoration(
                label: Text('Enter Your Height(In Inch)'),
                prefixIcon: Icon(Icons.height)
              ),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 16,),

          ElevatedButton(onPressed: (){
            var wt = wtController.text.toString();
            var ft = ftController.text.toString();
            var inch = inController.text.toString();

            if(wt != '' && ft != '' && inch != ''){

            var iWt = int.parse(wt);
            var iFt = int.parse(ft);
            var Iinch = int.parse(inch);

            var tInch = (iFt * 12) + Iinch;
            var tCm = tInch * 2.54;
            var tM = tCm/100;

            var bmi = iWt/(tM * tM);
            var msg = '';

            if(bmi > 25){
              msg = 'You are overWeight!!!!';
              bgColor = Colors.red.shade400;
            }else if(bmi < 18){
              msg = 'You are underWeight!!!';
              bgColor = Colors.orange.shade900;
            }else{
               msg = 'You are healtyWeight';
              bgColor = Colors.green.shade800;
            }
            setState(() {
              result = '$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}';
            });
            }
            else{

              setState(() {
                result = 'Please fill all the required blanks!!';
              });
            }
          }, child:Text('Calculate')),

            SizedBox(height: 20,),
            
            Text(result , style: TextStyle(fontSize: 26),
            ),

          ],
        ),
      )
      )
      )
    );
  }
}
