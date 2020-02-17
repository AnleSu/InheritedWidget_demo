import 'package:flutter/material.dart';
import 'userinfo_widget.dart';
class MySecondPage extends StatefulWidget {
  MySecondPage({Key key, this.title}) : super(key: key);

  
  final String title;

  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {

  void _incrementCounter() {
    final userinfoWidget = UserinfoWidget.of(context);
    userinfoWidget.update('new name', 'new address');

  }

  @override
  Widget build(BuildContext context) {
    final userinfoWidget = UserinfoWidget.of(context);

    return Scaffold(
      appBar: AppBar(
        
        title: Text('Second Page'),
      ),
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              userinfoWidget.name(),
            ),
            Text(
              userinfoWidget.address(),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
