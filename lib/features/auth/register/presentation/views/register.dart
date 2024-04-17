import 'package:ghhg/features/auth/register/presentation/views/widgets/registerbody.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  String? name;
  bool pass = true;

  @override
  Widget build(BuildContext context) {
    return registerbody();
  }
}
