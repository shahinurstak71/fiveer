import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fiveer/add.dart';
import 'package:fiveer/details.dart';
import 'package:fiveer/models/contact.dart';

import 'helpers/database_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigatorkey = GlobalKey<NavigatorState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorkey,
      home: Scaffold(
        appBar: AppBar(title: Text('MyApp'), actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text('Add'),
              ),
            ],
            onSelected: (int menu) {
              if (menu == 1) {
                navigatorkey.currentState
                    .push(MaterialPageRoute(builder: (context) => AddPage()));
              }
            },
          )
        ]),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var db = new DatabaseHelper();
    return Padding(
      padding: EdgeInsets.all(10),
      child: FutureBuilder<List>(
          future: db.findAll(),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Contact contact = Contact.fromJson(snapshot.data[index]);
                    return Card(
                      child: ListTile(
                        title: Text(contact.name),
                        subtitle: Text(contact.phone),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactDetailsPage(
                                    contact: contact,
                                  )));
                        },
                      ),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
