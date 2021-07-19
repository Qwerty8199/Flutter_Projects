import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String expr = "0";
  String res = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
              'Calculator',
            style: TextStyle(
              color: Colors.amber[500]
            ),
          ),
        ),
      body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.20,

              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,10,10,10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text( expr,
                      style: const TextStyle(fontSize: 20),),
                    const SizedBox(height: 25,),
                    Text( res,
                      style:TextStyle(fontSize: 40, color: Colors.amber[800]))
                  ],
                ),
              ),
            ),

            const Expanded(child: Divider()),

            Table(
              children: [
                TableRow(
                    children: [
                      _calci_button("C",Colors.white,Colors.black),
                      _calci_button("(",Colors.blueGrey,Colors.amber),
                      _calci_button(")",Colors.blueGrey,Colors.amber),
                      _calci_button("DEL",Colors.blueGrey,Colors.amber),
                    ]
                ),
                TableRow(
                    children: [
                      _calci_button("1",Colors.white,Colors.black),
                      _calci_button("2",Colors.white,Colors.black),
                      _calci_button("3",Colors.white,Colors.black),
                      _calci_button("-",Colors.blueGrey,Colors.amber),
                    ]
                ),
                TableRow(
                    children: [
                      _calci_button("4",Colors.white,Colors.black),
                      _calci_button("5",Colors.white,Colors.black),
                      _calci_button("6",Colors.white,Colors.black),
                      _calci_button("*",Colors.blueGrey,Colors.amber),
                    ]
                ),
                TableRow(
                    children: [
                      _calci_button("7",Colors.white,Colors.black),
                      _calci_button("8",Colors.white,Colors.black),
                      _calci_button("9",Colors.white,Colors.black),
                      _calci_button("/",Colors.blueGrey,Colors.amber),
                    ]
                ),

                TableRow(
                  children: [
                    _calci_button("0",Colors.white,Colors.black),
                    _calci_button(".",Colors.white,Colors.black),
                    _calci_button("=",Colors.amber,Colors.white),
                    _calci_button("+",Colors.blueGrey,Colors.amber),
                  ]
                ),

              ],
            ),

      ],
      ),
    );
  }


  Widget _calci_button(String val,Color backcol,Color Textcol){

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      child : ElevatedButton(
        onPressed: () => Calculate(val),
        child: Text(val, style: TextStyle(color: Textcol, fontSize: 20),),
        style: ButtonStyle(
          backgroundColor : MaterialStateProperty.all<Color>(backcol),
        ),
      ),

    );
  }

  Calculate(String v) {
    if(v == "="){
      Parser p = Parser();
      Expression e = p.parse(res);
      double ans = e.evaluate(EvaluationType.REAL, ContextModel());
      expr = res;
      res = ans.toString();
    }
    else if(v == "C"){
      res = "0";
      expr = "0";
    }
    else if( v == "DEL"){
      res = res.substring(0,res.length-1);
      if(res==""){
        res = "0";
      }
    }
    else{
      if(res == "0"){
        res = v;
      }
      else {
        res += v;
      }
    }

    setState(() {});
  }


}


