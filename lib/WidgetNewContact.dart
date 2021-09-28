import 'package:flutter/material.dart';
import 'model/Contact.dart';
import 'main.dart';

class NewContact extends StatelessWidget {
  const NewContact({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Contact',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const NewContactPage(title: 'New Contact'),
    );
  }
}

class NewContactPage extends StatefulWidget {
  const NewContactPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  Contact contact=Contact("","");
  final contactNameController = TextEditingController();
  final contactEmailController = TextEditingController();
  _NewContactPageState(){
  }

  void openAnotherWidget(){
    Navigator.push( context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  void backToPreviousWidget(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'NEW CONTACT DATA:',
            ),
            TextFormField(
                controller:contactNameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Contact name:',
                )),
            TextFormField(
                controller:contactEmailController, //stepValue,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Contact email:',
                )),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () { },
              child: Text('Create'),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Text('Cancel'),
            )

          ],
        ),

      ),
    );
  }
}
