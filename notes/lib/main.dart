import 'package:flutter/material.dart';

void main()=> runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff2b2d2d),
        scaffoldBackgroundColor: Color(0xff2b2d2d)
      ),
    );
  }

}

class Home extends StatefulWidget{
  @override
  _HomeState createState()=> _HomeState();
}
class _HomeState extends State<Home>{
  String input="";
  List addt =[];
  @override
  void initState(){
    addt.add("movies");
    super.initState();
  }
  Widget build(BuildContext context){
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text("NOTES APP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              letterSpacing: 4
            ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(Icons.add,color:Colors.red[500],size:35,),
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("ADD NOTES"),
                      content: TextField(
                        decoration: InputDecoration(
                          hintText: "ADD NOTES "
                        ),
                        onChanged: (String value){
                          input=value;
                        },
                      ),
                      actions: [
                        FlatButton(onPressed: (){
                         setState(() {
                           addt.add(input);
                         });
                         Navigator.of(context).pop();
                        },
                            child: Text ("ADD",style: TextStyle(color: Colors.black),))
                      ],
                    );
                  }
              );
            },

          ),
          body: Padding(
            padding: EdgeInsets.all(5),
            child: ListView.builder(
              itemCount: addt.length,
              itemBuilder: (BuildContext context,int index){
                return Dismissible(
                    key: Key(addt[index]),
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                     child: ListTile(
                       title: Text(addt[index],
                       style: TextStyle(
                         color: Colors.black,
                       ),
                     ),
                trailing: IconButton(
                icon: Icon(Icons.delete_forever_rounded,color:Colors.red,),
                onPressed: (){
                  setState(() {
                    addt.removeAt(index);
                  });
                },
                ),
                    ),
    )
    );
              }
            ),
          ),
        ),
    );
  }
}