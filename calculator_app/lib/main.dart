import 'package:flutter/material.dart';

void main() {
  runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeActivity(),
  )
  );
}
class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);


  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  String output="0";
  String _out="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";

  pressedButton(String val){
    print(val);
    if(val=="C"){
      _out="0";
      num1=0;
      num2=0;
      operand="";
    }
    else if(val=="+"||val=="-"||val=="*"||val=="/"){
      num1=double.parse(output);
      operand=val;
      _out="0";
      output=output+val;
    }else if(val=="."){
     if(_out.contains(".")){
       return;
     }else{
       _out=_out+val;

     }
    }else if(val =="="){
      num2=double.parse(output);
      if(operand=="+"){
        _out=(num1+num2).toString();
      }
      if(operand=="-"){
        _out=(num1-num2).toString();
      }
      if(operand=="*"){
        _out=(num1*num2).toString();
      }
      if(operand=="/"){
        _out=(num1/num2).toString();
      }
      num2=0.0;
      num1=0.0;
    }
    else{
      _out=_out+val;

    }
    setState(() {
      output=double.parse(_out).toStringAsFixed(2);
    });
  }

  Widget calcBtn(String Btnval){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color:Colors.grey,
                offset: Offset(2.0,2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color:Colors.white,
                offset: Offset(-2.0,-2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
            ]
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(16.0),
          child: Text(Btnval,style: TextStyle(
              fontSize: 25.0
          ),),
          onPressed: ()=>pressedButton(Btnval),
        ),

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 50.0),
                  child: Text(output,style: TextStyle(
                    fontSize: 50.0
                  ),),
                ),
                Expanded(
                  child: Divider(),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        calcBtn("+"),
                        calcBtn("C"),
                        calcBtn("<-"),
                        calcBtn("*"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        calcBtn("7"),
                        calcBtn("8"),
                        calcBtn("9"),
                        calcBtn("/"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        calcBtn("4"),
                        calcBtn("5"),
                        calcBtn("6"),
                        calcBtn("+"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        calcBtn("1"),
                        calcBtn("2"),
                        calcBtn("3"),
                        calcBtn("-"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        calcBtn("0"),
                        calcBtn("="),

                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


