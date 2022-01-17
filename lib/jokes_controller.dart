import 'package:get/get.dart';
import 'package:jokes/service.dart';

class JokesController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Service s = Service();
    var response = s.all("1");
    print(response);
  }
}
