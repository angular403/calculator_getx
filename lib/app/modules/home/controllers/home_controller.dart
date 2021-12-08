import 'package:get/get.dart';
import 'package:function_tree/function_tree.dart';

class HomeController extends GetxController {
  var text = "".obs;
  var hasil = "".obs;
  void changeText(String data) {
    try {
      if (data == "CLEAR") {
        hasil.value = "";
        text.value = text.substring(0, text.value.length - 1);
      } else if (data == "ALL CLEAR") {
        hasil.value = "";
        text.value = "";
      } else {
        text.value = text.value + data;
      }
    } catch (e) {}
  }

  void eksekusi() {
    print(text);
    try {
      hasil.value = "${text.value.interpret()}";
    } catch (e) {
      if (text.value.length != 0) {
        hasil.value = "Error";
      }
    }
  }
}
