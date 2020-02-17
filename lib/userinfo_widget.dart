import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'user_bean.dart';

class UserinfoInheritedWidget extends InheritedWidget {

  final UserinfoWidgetState data;

  UserinfoInheritedWidget({Key key, Widget child, this.data}):
  super(key:key, child:child);


  //是否重建widget取决于数据是否相同
  @override
  bool updateShouldNotify(UserinfoInheritedWidget oldWidget) {

     return true;
  }
}

class UserinfoWidget extends StatefulWidget {

  final Widget child;

  UserinfoWidget({Key key, this.child}):
  super(key:key);


  static UserinfoWidgetState of([BuildContext context, bool rebuild = true]) {
    // return context.inheritFromWidgetOfExactType(UserinfoInheritedWidget);

    return (rebuild ? (context.inheritFromWidgetOfExactType(UserinfoInheritedWidget) as UserinfoInheritedWidget).data
                    : (context.ancestorWidgetOfExactType(UserinfoInheritedWidget) as UserinfoInheritedWidget).data);
  }


  @override
  UserinfoWidgetState createState() => UserinfoWidgetState();
}

class UserinfoWidgetState extends State<UserinfoWidget> {
  //  共享的数据
  UserBean _userBean = UserBean(name:'Flutter', address: 'China');

  String name() {
    return _userBean.name ?? 'Default name';
  }

  String address() {
    return _userBean.address ?? 'Defalut Address';
  }

  void update(String name, String address) {
    this._userBean = UserBean(name: name, address: address);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return UserinfoInheritedWidget(
      child: widget.child,
      data: this,
    );
  }
}
