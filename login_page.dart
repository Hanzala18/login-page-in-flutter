import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  late String _name;
  late String _password;
  late String _email;

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  void validate() {
    if (_loginKey.currentState!.validate()) {
      print("Processing");
    } else {
      print("Not Processing");
    }
  }

  String? validatePass(value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.length < 8) {
      return "8 characters required";
    } else if (value.length > 15) {
      return "Not more than 15 characters";
    } else {
      return null;
    }
  }

  Widget _buildName() {
    return TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: "Name"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "name is required";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: "Password"),
        validator: validatePass
        //validator: MinLengthValidator(8, errorText: "8 characters required"),
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return "Password is required";
        //   } else {
        //     return null;
        //   }
        // },
        );
  }

  Widget _buildemail() {
    return TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: "Email"),
      validator: MultiValidator([
        RequiredValidator(errorText: "Required"),
        EmailValidator(errorText: "Not a valid Email"),
      ]),
      // validator: EmailValidator(errorText: "Not a valid Email"),
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return "name is required";
      //   } else {
      //     return null;
      //   }
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          autovalidate: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              _buildPassword(),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              _buildemail(),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: validate,
              )
            ],
          ),
        ),
      ),
    );
  }
}
