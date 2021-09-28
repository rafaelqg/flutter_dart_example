import 'package:flutter/material.dart';
import 'model/Contact.dart';
import 'WidgetNewContact.dart';


void main() {
  runApp(const MyApp());
  var peter = Contact('Peter Parker', 'spiderman@superheros.mv');
  peter.describe();

  Contact logan = Contact('Logan', 'wolverine@superheros.mv');
  logan.describe();

/*
  int c= sum(5,6);
  print("SUM function result: "+c.toString());
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
  };
  print (flybyObjects);
  print (flybyObjects[0]);
  print (year);
  print (image);
  print (image["url"]);

  print ("=== IF /ELSE ====");
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  print ("=== FOREACH ====");
  for (var object in flybyObjects) {
    print(object);
  }
  print ("=== FOR ====");
  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  print ("=== WHILE ====");
  while (year < 2016) {
    year += 1;
    print("While:"+year.toString());
  }
*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo - Adding button event',
      theme: ThemeData(
       // primarySwatch: Colors.blue,
       // primarySwatch: Colors.red,
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Widget title: Contact data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Contact contact=Contact("","");

  final stepValueController = TextEditingController();
  final contactNameController = TextEditingController();
  final contactEmailController = TextEditingController();
  _MyHomePageState(){
    this.contact=Contact('Peter Parker', 'spiderman@superheros.mv');
    this.contactNameController.text=this.contact.name;
    this.contactEmailController.text=this.contact.email;
  }

  void _incrementCounter() {
    final value=stepValueController.text;
    int newCounterValue=_counter+int.parse(value);
    setState(() {
      _counter=newCounterValue;
    });
  }

  void _decrementCounter() {
    final value=stepValueController.text;
    int newCounterValue=_counter-int.parse(value);
    setState(() {
      _counter=newCounterValue;
    });

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content:  Text('AlertDialog description:$value'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void openAnotherWidget(){
    Navigator.push( context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  void backToPreviousWidget(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'YOUR ACCOUNT DATA:',
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
              child: Text('Update'),
            ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () { },
          child: Text('Show state B')
        ),
            /*
            TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () { },
                child: Text('Show state A')
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () { },
              child: Text('Cancel'),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => NewContact()));
              },
              child: Text('Create new contact'),
            )
            */
            /*
            const Text(
              'You have pushed the button this many times:',
            ),

        TextFormField(
          controller:stepValueController, //stepValue,
          //initialValue: '5',
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Enter the step value:',
          )),
            const Text(
              'Hallo Rafael!!',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
*/
          ],
        ),

      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.


      floatingActionButtonMinus: FloatingActionButton(
        onPressed: _decrementCounter,
        tooltip: 'Decrement',
        child: const Icon(Icons.minimize),
      ),

*/

    );
  }
}
