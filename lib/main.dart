import 'package:flutter/material.dart';
import 'package:inheritedwidget_demo/second_page.dart';
import 'package:inheritedwidget_demo/user_bean.dart';
import 'userinfo_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UserinfoWidget(
//        userBean: UserBean(name: 'flutter', address: 'China'),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[TestWidgetA(), TestWidgetB(), TestWidgetC()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MySecondPage()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TestWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userinfoWidget = UserinfoWidget.of(context);

    print('TestWidgetA build');
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new Text(
        userinfoWidget.name(),
      ),
    );
  }
}

class TestWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userinfoWidget = UserinfoWidget.of(context);

    print('TestWidgetB build');

    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new Text(
        userinfoWidget.address(),
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}

class TestWidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userinfoWidget = UserinfoWidget.of(context,false);

    print('TestWidgetC build');

    return new Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: new RaisedButton(
          textColor: Colors.black,
          child: new Text('update'),
          onPressed: () {
            userinfoWidget.update('update name','update address');
          },
        ));
  }
}
