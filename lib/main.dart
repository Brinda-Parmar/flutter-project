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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = '';
  var bgclr = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        color: bgclr,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('BMI',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),),
              SizedBox(height: 20),
              TextField(
                controller: wtcontroller,
                decoration: InputDecoration(
                  label: Text('Enter Your Weight in KGs.'),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: ftcontroller,
                decoration: InputDecoration(
                  label: Text('Enter Your Height(in Feet).'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: incontroller,
                decoration: InputDecoration(
                  label: Text('Enter Your Height(in Inch).'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              ElevatedButton(onPressed: () {
                 var wt = wtcontroller.text.toString();
                 var ft = ftcontroller.text.toString();
                 var inch = incontroller.text.toString();

                 if(wt!='' && ft!='' && inch != ''){

                   var iwt = int.parse(wt);
                   var ift = int.parse(ft);
                   var iinch = int.parse(inch);

                   var totalinch = (ift*12) + iinch;
                   var totalMtr = (totalinch*2.54)/100;

                   var bmi = iwt/(totalMtr*totalMtr);

                   var msg;

                   if(bmi>25){
                      msg='You are Over Weight';
                      bgclr = Colors.lightBlue;
                   }else if(bmi<18){
                     msg = 'You are Under Weight';
                     bgclr = Colors.brown;
                   }else{
                     msg = 'You are Healthy';
                     bgclr = Colors.lightGreen;
                   }

                   setState(() {
                     result = '$msg \n Your BMI is : ${bmi.toStringAsFixed(4)}';
                   });



                 }else{
                    setState(() {
                      result = 'Please Fill All The Requierd Fielld';
                    });
                 }

              }, child: Text('Calculate')
              )  ,
              SizedBox(height: 20),
                Text(result,
                style: TextStyle(
                  fontSize: 20
                ))
            ],),
          ),
        ),
      )

    );
  }
}
