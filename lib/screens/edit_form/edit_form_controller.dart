//
// import 'dart:html';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
//
// class EditFormViewController extends GetxController {
//
//   final TextEditingController phoneCtrl = TextEditingController(text: '');
//
//   final TextEditingController userCtrl = TextEditingController(text: '');
//
//   final FocusNode userCtrlfocusNode = FocusNode();
//
//   final FocusNode phoneCtrlfocusNode = FocusNode();
//
//   // RxBool Upload=false.obs;
//   // Rx<File> files =File('').obs;
//   // Future Filepick()async {
//   //   FilePickerResult? result =await FilePicker.platform.pickFiles();
//   //
//   //   if (result != null) {
//   //     File file = File(result.files.single.path.toString() as List<Object>);
//   //     Upload.value=true;
//   //   } else {
//   //     Upload.value=false;
//   //     // User canceled the picker
//   //   };
//   // }
//   // final count = 0.obs;
//
//
//   RxString maritalStatus = 'Marital Status '.obs as RxString;
//   List<String> mstatus = [
//     'Marital Status ',
//     'Single ',
//     'Married',
//   ].obs;
//
// }