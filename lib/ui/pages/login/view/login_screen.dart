import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mail_tm/constants/constants.dart';
import 'package:mail_tm/state_management/controller/login_controller.dart';
import 'package:mail_tm/state_management/models/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = LoginController();
  bool _isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.appColor,
        title: const Text('Login'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: double.infinity,
              child: Form(
                child: _isLoading
                    ? Center(
                        child: SpinKitDualRing(
                          color: Constants.appColor,
                          size: 40.0,
                        ),
                      )
                    : Column(
                        children: [
                          Image.asset('assets/images/logo.png'),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Welcome to RiseUpLabs",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.amber[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Email",
                              prefixIcon: const Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: passController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(
                                width: double.infinity),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.amber[900]),
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(14),
                                ),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                setState(
                                  () {
                                    _isLoading = true;
                                  },
                                );
                                UserModel newUser = UserModel(
                                  address: emailController.text,
                                  password: passController.text,
                                );
                                String token =
                                    await loginController.getToken(newUser);
                                setState(() {
                                  _isLoading = false;
                                  Get.toNamed("/message", arguments: token);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
