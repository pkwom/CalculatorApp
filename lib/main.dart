import 'package:flutter/material.dart';

String expression = "";

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//stateless widget class to create keypad
class KeyPad extends StatelessWidget{
  const KeyPad({super.key, required this.sendCode});
  final Function() sendCode;

  @override
  Widget build(BuildContext context) {

    return Expanded(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GridView.count(

              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children:
              List.generate(12,(index){
                index += 1;
                if(index == 10 || index == 12){return const Text("");}
                if(index == 11){index = 0;}
                return TextButton(onPressed: () {
                  expression += index.toString();
                  print(expression);
                  if(expression.length >= 6){
                    sendCode();
                    expression = "";
                  }
                  // updateCode();
                }, child: Text("$index", textScaleFactor: 4,));
              }),


            )

        )
      // padding:  const EdgeInsets.symmetric(horizontal: 40),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:

        Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[

      Text(
              "Calculator",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.left,
              textScaleFactor: 2
          ),
          // column headers


      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [KeyPad(sendCode: (){
            print("code $expression is sent");
            setState(() {});
          }),


        ],
      )
      ,]// body
    )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
