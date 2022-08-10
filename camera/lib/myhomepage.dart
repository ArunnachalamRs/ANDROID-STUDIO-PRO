import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  File ? imageFile;

  void _getFromCamera() async{
    XFile? pickedFile =await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight:1080,
      maxWidth:1080,
    );
    setState(() {
      imageFile=File(pickedFile!.path);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 50,),
          imageFile !=null ?
              Container(
                child: Image.file(imageFile!),
              ):

              Container(
                child: Icon(
                  Icons.camera_enhance_rounded,
                  color: Colors.purple,
                  size: MediaQuery.of(context).size.width *.6,
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              child: Text('Capture Image'),
              onPressed: (){
                _getFromCamera();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))
              ),
            ),
          ),
        ],
      ),
    );
  }
}
