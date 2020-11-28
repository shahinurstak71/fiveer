import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:fiveer/helpers/database_helper.dart';
import 'package:fiveer/main.dart';
import 'package:fiveer/models/contact.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var textEditingControllerName = new TextEditingController();
  var textEditingControllerPhone = new TextEditingController();
  var textEditingControllerEmail = new TextEditingController();
  var textEditingControllerAddress = new TextEditingController();
  var textEditingControllerDescription = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Contact'),

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
                            var contact = new Contact(
                              name: textEditingControllerName.text,
                              phone: textEditingControllerPhone.text,
                              email: textEditingControllerEmail.text,
                              address: textEditingControllerAddress.text,
                              description: textEditingControllerDescription.text,
                            );
                            var db = DatabaseHelper();
                            await db.create(contact);
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
