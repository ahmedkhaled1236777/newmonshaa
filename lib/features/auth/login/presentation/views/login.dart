import 'package:ghhg/features/auth/login/presentation/views/widgets/loginbody.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  void initState() {
    //   BlocProvider.of<logincuibt>(context).getdevicetoken();
  }
  @override
  Widget build(BuildContext context) {
    return loginbody();
  }
}
