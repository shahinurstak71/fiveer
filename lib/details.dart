import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:fiveer/edit.dart';
import 'package:fiveer/helpers/database_helper.dart';
import 'package:fiveer/main.dart';
import 'package:fiveer/models/contact.dart';


// ignore: must_be_immutable
class ContactDetailsPage extends StatefulWidget {
  Contact contact;
  ContactDetailsPage({Key key, this.contact}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _ContactDetailsPageState();
  }
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(' Contact Details'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(widget.contact.name),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  'Phone',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(widget.contact.phone),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(widget.contact.email),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  'Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(widget.contact.address),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(widget.contact.description),
                Padding(padding: EdgeInsets.all(5)),
                Row(
                  children: [
                    Expanded(
                        child: RaisedButton(
                            child: Text('Edit'), onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditPage(
                                    contact: widget.contact,
                                  )));
                        })),
                    Padding(padding: EdgeInsets.only(left: 5, right: 5)),
                    Expanded(
                        child: RaisedButton(
                            child: Text('Delete'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return new AlertDialog(
                                      title: Text('Confirm'),
                                      content: Text('Are you sure?'),
                                      actions: [
                                        FlatButton(
                                          onPressed: () async {
                                            var db = DatabaseHelper();
                                            await db.delete(widget.contact.id);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyApp()));
                                          },
                                          child: Text('Ok'),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel'),
                                        ),
                                      ],
                                    );
                                  });
                            })),
                    Padding(padding: EdgeInsets.only(left: 5, right: 5)),
                    Expanded(
                        child: RaisedButton(
                            child: Text('cancel'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
                            })),
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
