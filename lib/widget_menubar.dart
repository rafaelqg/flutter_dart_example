import 'package:flutter/material.dart';
import 'package:flutter_app/WidgetDialogAndToast.dart';
import 'package:flutter_app/http_request_fetch.dart';
import 'package:flutter_app/presenting_lists_dynamic_elements.dart';
import 'package:flutter_app/setStateExample.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Messages Demo'),
            onTap: () => {Navigator.push( context, MaterialPageRoute(builder: (context) => MessagesExample()))},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Example setState()'),
            onTap: () => {Navigator.push( context, MaterialPageRoute(builder: (context) => SetStateExample()))},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Dynamic Elements'),
            onTap: () =>  {Navigator.push( context, MaterialPageRoute(builder: (context) => DynamicElements()))},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Http Request example'),
            onTap: () => {Navigator.push( context, MaterialPageRoute(builder: (context) => HttpRequestExample()))},
          ),

        ],
      ),
    );
  }
}