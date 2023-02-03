



import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/app_photogallery.dart';
import '../../models/api_resp.dart';
import '../../models/upload_resp.dart';
import '../../services/image_upload_service.dart';
import '../../utils/err_m.dart';


class DashboardController extends GetxController {
  Rx<bool> status= false.obs;
  Rx<File?> pickedfile = File('').obs;
  final ImagePicker imagepicked = ImagePicker();
  RxList<XFile> imagesList = (List<XFile>.of([])).obs;

  void removeImages() {
    pickedfile.close();
  }


  uploaImage(BuildContext buildContext) async {
    ApiResp respData =
    await ImageUploadServices.uploadProcess(imagesList[0], buildContext);
    if (respData.ok == false) {
      log("not Uploaded");
    } else {
      ImageUploadResp imageUploadCheck =
      ImageUploadResp.fromJson(respData.rdata);
      if (imageUploadCheck.code?.toString() == '200') {
        showMsg('Image Uploaded successfully', 'Success');
     //   multipartVerification(imageUploadCheck.data);
        log("Uploaded");
      } else {
        log("not Uploaded");
      }
      return true;
    }
  }

  imageFromCamera() async {
    XFile? result = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (result != null) {
      imagesList.add(result);
    }
  }

Future<void> takePhoto(ImageSource source) async {
  final XFile? pickedFile2 = await imagepicked
      .pickImage(source: ImageSource.camera, imageQuality: 100);
  File pickedFile= File(pickedFile2!.path);
  pickedfile.value = pickedFile;
  print(pickedFile2);
}

  Future<void> Photogallery(ImageSource source) async {
   final XFile? pickedFile2 = await imagepicked
        .pickImage(source: ImageSource.gallery, imageQuality: 100);
    File pickedFile= File(pickedFile2!.path);
    pickedfile.value = pickedFile;
    print(pickedFile2);
  }

 //  final userdata= GetStorage();
 //  //final ScrollController _scrollController = ScrollController();
 //  List<bool> randomPhotoName = <bool>[true, false].obs;
 //  RxString departmentType = 'sellerId'.obs as RxString;
 //  RxString fromPage = 'sellerId'.obs as RxString;
 //  RxString photoOrderDetailsId = 'sellerId'.obs as RxString;
 // // RxList<XFile> imagesList = (List<XFile>.of([])).obs;
 //
 //  openImage(BuildContext context, final int index) async {
 //    await Get.to(
 //      GalleryPhotoViewWrapper(
 //        galleryItems: imagesList,
 //        backgroundDecoration: const BoxDecoration(
 //          color: Colors.black,
 //        ),
 //        initialIndex: index,
 //        imageType: 'network',
 //        scrollDirection: Axis.horizontal,
 //      ),
 //    );
 //  }
 //
 //  imageFromCamera() async {
 //    XFile? result = await ImagePicker()
 //        .pickImage(source: ImageSource.camera, imageQuality: 50);
 //
 //    if (result != null) {
 //      imagesList.add(result);
 //    }
 //  }
 //  //final bool randomPhotoName;
 //  // final int sellerId;
 //  // String fromPage;
  // final int photoOrderDetailsId;
}