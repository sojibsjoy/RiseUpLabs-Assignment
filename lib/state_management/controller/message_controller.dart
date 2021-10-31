import 'package:get/state_manager.dart';
import 'package:mail_tm/state_management/models/message_model.dart';
import 'package:mail_tm/state_management/services/message_service.dart';

class MessageController extends GetxController {
  var isLoading = true.obs;
  var messageList = <HydraMember>[].obs;

  void getMessages(String token) async {
    isLoading(true);
    try {
      var msgList = await MessageService.getMessages(token);
      if (msgList != null) {
        messageList.value = msgList;
      }
    } finally {
      isLoading(false);
    }
  }
}
