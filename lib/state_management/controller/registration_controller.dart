import 'package:get/state_manager.dart';

import 'package:mail_tm/state_management/models/user_model.dart';
import 'package:mail_tm/state_management/services/registration_service.dart';

class RegistrationController extends GetxController {
  UserModel userModel;
  var isLoading = true.obs;

  @override
  void onInit() {
    createAcc(userModel);
    super.onInit();
  }

  void createAcc(UserModel item) async {
    isLoading(true);
    try {
      await RegistrationService.createAccount(item);
    } finally {
      isLoading(false);
    }
  }
}
