import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mail_tm/constants/constants.dart';
import 'package:mail_tm/state_management/controller/registration_controller.dart';
import 'package:mail_tm/state_management/models/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegistrationController regController = RegistrationController();

  bool _isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController passController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.appColor,
        title: const Text('Register'),
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
                            "Welcome to Mail.Tm",
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
                          TextFormField(
                            controller: passController2,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Confirm Password",
                              prefixIcon: const Icon(Icons.lock),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 20,
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
                                "Create an account",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    _isLoading = true;
                                  },
                                );
                                String email = emailController.text;
                                String pass1 = passController.text;
                                String pass2 = passController2.text;
                                if (email.isNotEmpty && pass1 == pass2) {
                                  UserModel newUser = UserModel(
                                    address: emailController.text,
                                    password: passController.text,
                                  );
                                  regController.createAcc(newUser);
                                  Get.toNamed('/login');
                                } else {
                                  showAlertDialog(context);
                                }
                                setState(
                                  () {
                                    _isLoading = false;
                                  },
                                );
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

  void showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Invalid input"),
      content: const Text("Please enter valid information."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
