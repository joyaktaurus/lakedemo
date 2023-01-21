
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class DashboardController extends GetxController {
  //final ScrollController _scrollController = ScrollController();
  List<bool> randomPhotoName = <bool>[true, false].obs;
  RxInt departmentType = 'sellerId'.obs as RxInt;
  RxString fromPage = 'sellerId'.obs as RxString;
  RxInt photoOrderDetailsId = 'sellerId'.obs as RxInt;
  RxList<XFile> imagesList = (List<XFile>.of([])).obs;

  imageFromCamera() async {
    XFile? result = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (result != null) {
      imagesList.add(result);
    }
  }
  //final bool randomPhotoName;
  // final int sellerId;
  // String fromPage;
  // final int photoOrderDetailsId;
}