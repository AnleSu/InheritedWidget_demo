//创建一个model 用于保存用户信息 或者你需要共享的任何数据
class UserBean {
  String name;
  String address;

  UserBean({this.name, this.address});

  @override
  String toString() {
    // TODO: implement toString
    return 'UserBean{name: $name, address:$address}';
  }
}