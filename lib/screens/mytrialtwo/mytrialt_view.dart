import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/my_utils.dart';
import 'mytrialt_controller.dart';

class MyTrialTwo extends GetView<MyTwoController> {
  const MyTrialTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyTwoController controller = Get.put(MyTwoController());
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            body: Stack(children: [
              Expanded(
                child: Obx(() => Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ListView.builder(
                      itemCount: controller.ccontroller.persons.length,
                      itemBuilder: (context, index) {
                        final person = controller.ccontroller.persons[index];
                        return Column(
                          children: [
                           Text(person.name),
                           Text(person.address),
                            Text(person.drop),
                            Text(person.toggles),

                       ] );
                      }),
                )),
              ),
            ])));
  }
}