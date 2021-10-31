import 'package:get/state_manager.dart';
import 'package:mail_tm/state_management/models/user_model.dart';
import 'package:mail_tm/state_management/services/login_service.dart';

class LoginController extends GetxController {
  UserModel userModel;
  var isLoading = true.obs;

  @override
  void onInit() {
    getToken(userModel);
    super.onInit();
  }

  Future<String> getToken(UserModel item) async {
    isLoading(true);
    try {
      var token = await LoginService.login(item);
      return token;
    } finally {
      isLoading(false);
    }
  }
}
