import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mail_tm/constants/constants.dart';
import 'package:mail_tm/state_management/controller/domain_controller.dart';

class DomainScreen extends StatefulWidget {
  const DomainScreen({key}) : super(key: key);

  @override
  State<DomainScreen> createState() => _DomainScreenState();
}

class _DomainScreenState extends State<DomainScreen> {
  final DomainController domainController = Get.put(DomainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Domains'),
        backgroundColor: Constants.appColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (domainController.isLoading.value) {
                  return Center(
                    child: SpinKitDualRing(
                      color: Constants.appColor,
                      size: 40.0,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: domainController.domainList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.all(15.0),
                        leading: Image.asset(
                          "assets/icons/globe.png",
                          height: 55,
                          width: 55,
                        ),
                        title: Text(
                          domainController.domainList[index].domain,
                          style: TextStyle(
                            color: Constants.appColor,
                            fontSize: 20,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(150, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Constants.appColor)),
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: const Text('Login'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(150, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Constants.appColor)),
                onPressed: () {
                  Get.toNamed('/register');
                },
                child: const Text('Register'),
              ),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
