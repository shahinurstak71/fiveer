import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:fiveer/helpers/database_helper.dart';
import 'package:fiveer/main.dart';
import 'package:fiveer/models/contact.dart';


// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  Contact contact;
  EditPage({Key key,  this.contact}) : super(key: key);

  @override
  State <StatefulWidget>createState() {
    return new EditPageState();
  }
}

class EditPageState extends State<EditPage> {
  var textEditingControllerName = new TextEditingController();
  var textEditingControllerPhone = new TextEditingController();
  var textEditingControllerEmail = new TextEditingController();
  var textEditingControllerAddress = new TextEditingController();
  var textEditingControllerDescription = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    textEditingControllerName.text = widget.contact.name;
    textEditingControllerPhone.text = widget.contact.phone;
    textEditingControllerEmail.text = widget.contact.email;
    textEditingControllerAddress.text = widget.contact.address;
    textEditingControllerDescription.text = widget.contact.description;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit Contact'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Name'
                  ),
                  controller: textEditingControllerName,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Phone'
                  ),
                  controller: textEditingControllerPhone,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Email'
                  ),
                  controller: textEditingControllerEmail,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Address'
                  ),
                  controller: textEditingControllerAddress,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Description'
                  ),
                  controller: textEditingControllerDescription,
                  maxLines: 10,
                ),
                Padding(padding: EdgeInsets.all(5)),
                Row(
                  children: [
                    Expanded(
                        child: RaisedButton(
                            child: Text('save'),
                            onPressed: ()async{
                              widget.contact.name = textEditingControllerName.text;
                              widget.contact.phone = textEditingControllerPhone.text;
                              widget.contact.email = textEditingControllerEmail.text;
                              widget.contact.address = textEditingControllerAddress.text;
                              widget.contact.description = textEditingControllerDescription.text;

                              var db = DatabaseHelper();
                              await db.update(widget.contact);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

                            }
                        )
                    ),
                    Padding(padding: EdgeInsets.only(left: 5,right: 5)),
                    Expanded(
                        child: RaisedButton(
                            child: Text('cancel'),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                            }
                        )
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
