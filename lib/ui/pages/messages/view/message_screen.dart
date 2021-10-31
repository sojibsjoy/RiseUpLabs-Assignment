import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mail_tm/constants/constants.dart';
import 'package:mail_tm/state_management/controller/message_controller.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var token = Get.arguments;
  final MessageController msgController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    msgController.getMessages(token);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: Constants.appColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (msgController.isLoading.value) {
                  return Center(
                    child: SpinKitDualRing(
                      color: Constants.appColor,
                      size: 40.0,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: msgController.messageList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.mail,
                          color: Constants.appColor,
                          size: 50.0,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Subject: ${msgController.messageList[index].subject}",
                              style: TextStyle(
                                color: Colors.amber[900],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              msgController.messageList[index].intro,
                              style: TextStyle(
                                color: Constants.appColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
