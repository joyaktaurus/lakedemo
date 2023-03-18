import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lakeshore/screens/mytrialone/mytrial_view.dart';
import '../../utils/my_utils.dart';
import '../mytrialone/mytrial_controller.dart';
import 'mytrialt_controller.dart';

class MyTwoController extends GetxController {}

class MyTrialTwo extends GetView<MyListController> {
  final MyOneController controllerr = Get.put(MyOneController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.red,
          body: Obx(
                  () => ListView.builder(
                itemCount: Get.find<MyListController>().myList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green[200],
                      ),
                      width: 400,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("My Designs"),
                          Column(
                            children: [
                              Text(controllerr.controllerr.myList[index].newItem),
                              Text(controllerr.controllerr.myList[index].newItemMsg),
                              Text(controllerr.controllerr.myList[index].newItemAdrs),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              controllerr.controllerr.removeFromList(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => MyTrialOne(),
              );
            },
          ),
        ));
  }
}