import 'package:get/state_manager.dart';
import 'package:mail_tm/state_management/models/domain_model.dart';
import 'package:mail_tm/state_management/services/domain_service.dart';

class DomainController extends GetxController {
  var isLoading = true.obs;
  var domainList = <HydraMember>[].obs;

  @override
  void onInit() {
    getDomainNames();
    super.onInit();
  }

  void getDomainNames() async {
    isLoading(true);
    try {
      var domains = await DomainService.getDomains();
      if (domains != null) {
        domainList.value = domains;        
      }
    } finally {
      isLoading(false);
    }
  }
}
