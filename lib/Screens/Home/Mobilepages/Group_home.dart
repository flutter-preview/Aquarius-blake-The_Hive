import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forum3/Services/Upload.dart';
import 'package:image_picker/image_picker.dart';


class Ghome extends StatefulWidget {
  final snap;
  Ghome({Key? key,this.snap}) : super(key: key);

  @override
  State<Ghome> createState() => _GhomeState();
}

class _GhomeState extends State<Ghome> {
dynamic image;
  final Upload Selection=Upload();


_selectimage(BuildContext context)async{
    return showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title: const Text("Set Group Profile Picture"),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(15.0),
                child: const Text("Take a Photo"),
                onPressed: ()async{
                  Navigator.of(context).pop();
                  dynamic file=await Selection.uploadpic(ImageSource.camera);
                  setState(() {
                    image=file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(15.0),
                child: const Text("Choose from gallery"),
                onPressed: ()async{
                  Navigator.of(context).pop();
                  dynamic file=await Selection.uploadpic(ImageSource.gallery);
                  setState(() {
                    image=file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(15.0),
                child: const Text("Cancel"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white
          ),
          title: Text(
            "${widget.snap['Group Name']}",
            style:const TextStyle(
              color:Colors.white
            ),
            ),
            actions: [
              IconButton(
                onPressed: (){},
                icon: const FaIcon(FontAwesomeIcons.message),
                ),
            ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.3,
                  child: widget.snap['Header']!=""? Image.network(
                    "${widget.snap['Header']}",
                    fit: BoxFit.cover,
                    ):Container(
                      color: Colors.grey,
                      ),
                    ),
                    Positioned(
                      bottom: 90,
                      left: 150,
                      child: IconButton(
                        onPressed: ()async{
                          _selectimage(context);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.camera,
                          size: 50,
                          color: Colors.white,
                          ),
                        ),
                    )
              ],
            )
          ],
        ),
      ),
    );
  }
}