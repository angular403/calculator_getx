import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final ThemeData dark = ThemeData(
    backgroundColor: const  Color(0xff243441),
    primaryColor: const Color(0xffEB8034),
    accentColor: Colors.white60,
    brightness: Brightness.dark,
  );

  final ThemeData light = ThemeData(
    backgroundColor: Color(0xffEBEBEB),
    primaryColor: Color(0xffEB8034),
    accentColor: Colors.black38,
    brightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    final heightApp = Get.height -
        context.mediaQueryPadding.top -
        context.mediaQueryPadding.bottom;
    final widthApp = Get.width;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: widthApp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Obx(() => Text(
                              "${controller.hasil}",
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            )),
                      ),
                      Obx(() => Text(
                            "${controller.text}",
                            style: TextStyle(
                                fontSize: 25, color: context.theme.accentColor),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: widthApp,
                height: heightApp * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Row Pertama
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemButtonCustom(
                          text: "^",
                          value: "^",
                        ),
                        itemButtonCustom(
                          text: "C",
                          value: "CLEAR",
                        ),
                        itemButtonCustom(
                          text: "AC",
                          value: "ALL CLEAR",
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(50),
                          color: context.theme.primaryColor,
                          elevation: 10,
                          child: InkWell(
                            onTap: () => Get.changeTheme(
                              Get.isDarkMode ? light : dark,
                            ),
                            child: Container(
                              width: Get.width * 0.15,
                              height: Get.width * 0.15,
                              child: Center(
                                child: Icon(
                                  Icons.color_lens_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Row Kedua
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemButtonCustom(
                          text: "(",
                          value: "(",
                        ),
                        itemButtonCustom(
                          text: ")",
                          value: ")",
                        ),
                        itemButtonCustom(
                          text: "%",
                          value: "%",
                        ),
                        itemButtonCustom(
                          text: ":",
                          value: "/",
                        ),
                      ],
                    ),
                    //Row Ketiga
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemButtonCustom(
                          text: "7",
                          value: "7",
                        ),
                        itemButtonCustom(
                          text: "8",
                          value: "8",
                        ),
                        itemButtonCustom(
                          text: "9",
                          value: "9",
                        ),
                        itemButtonCustom(
                          text: "X",
                          value: "*",
                        ),
                      ],
                    ),
                    //Row Keempat
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemButtonCustom(
                          text: "6",
                          value: "6",
                        ),
                        itemButtonCustom(
                          text: "5",
                          value: "5",
                        ),
                        itemButtonCustom(
                          text: "4",
                          value: "4",
                        ),
                        itemButtonCustom(
                          text: "-",
                          value: "-",
                        ),
                      ],
                    ),
                    //Row Kelima
                    //Row Keempat
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemButtonCustom(
                          text: "1",
                          value: "1",
                        ),
                        itemButtonCustom(
                          text: "2",
                          value: "2",
                        ),
                        itemButtonCustom(
                          text: "3",
                          value: "3",
                        ),
                        itemButtonCustom(
                          text: "+",
                          value: "+",
                        ),
                      ],
                    ),

                    //Row Keenam
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemButtonCustom(
                          text: "0",
                          value: "0",
                        ),
                        itemButtonCustom(
                          text: ".",
                          value: ".",
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          color: context.theme.primaryColor,
                          elevation: 10,
                          child: InkWell(
                            onTap: () => controller.eksekusi(),
                            child: Container(
                              width: Get.width * 0.15 * 2.65,
                              height: Get.width * 0.15,
                              child: Center(
                                child: const Text(
                                  "=",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class itemButtonCustom extends GetView<HomeController> {
  final String text;
  final String value;
  const itemButtonCustom({
    required this.text,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: context.theme.backgroundColor,
      elevation: 10,
      child: InkWell(
        onTap: () {
          controller.changeText(value);
        },
        child: Container(
          width: Get.width * 0.15,
          height: Get.width * 0.15,
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
