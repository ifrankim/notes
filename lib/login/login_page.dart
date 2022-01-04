import 'package:flutter/material.dart';
import 'package:notes/login/login_controller.dart';
import 'package:notes/login/login_service.dart';
import 'package:notes/login/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController loginController;

  @override
  void initState() {
    loginController = LoginController(
        onUpdate: () {
          if (loginController.state is LoginStateSuccess) {
            final user = (loginController.state as LoginStateSuccess).user;
            Navigator.pushReplacementNamed(context, "/home", arguments: user);
          } else {
            setState(() {});
          }
        },
        loginService: LoginServiceImplementation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: GestureDetector(
              onTap: () async {
                await loginController.googleSignIn();
              },
              child: Container(
                  // color: Colors.lightBlue,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.fromBorderSide(
                        BorderSide(color: Colors.blueGrey)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.g_translate),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: 1,
                              color: Colors.blueGrey,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              "Login com Google",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }
}
