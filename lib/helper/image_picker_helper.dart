// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:provider/provider.dart';
//
// class ImagePickerHelper extends ChangeNotifier {
//    ImagePickerHelper._(this.picker);
//   static final _instance = ImagePickerHelper._(ImagePicker());
//   final ImagePicker picker;
//   factory ImagePickerHelper() => _instance;
//    File? _imageProfile;
//    File? get imageProfile => _imageProfile;
//   bool? _loaderState;
//   bool? get loaderState => _loaderState;
//
//    static Future<CroppedFile?>cropImage(File imageFile) async {
//      CroppedFile? croppedFile = await ImageCropper().cropImage(
//        sourcePath: imageFile.path,
//        compressFormat: ImageCompressFormat.png,
//        aspectRatioPresets: [
//          CropAspectRatioPreset.square,
//        ],
//        uiSettings: [
//          AndroidUiSettings(
//              toolbarTitle: 'Crop Image',
//              toolbarColor: AppColor.orange,
//              toolbarWidgetColor: Colors.black,
//              initAspectRatio: CropAspectRatioPreset.square,
//              lockAspectRatio: false),
//          IOSUiSettings(
//            title: 'Crop Image',
//          ),
//        ],
//      );
//      return croppedFile;
//    }
//
//
//    Future<XFile?> pickImage(
//       {required ImageSource source, int? imageQuality}) async {
//     return picker.pickImage(source: source, imageQuality: imageQuality);
//   }
//
//   Future<List<XFile>> pickMultipleImage({int? imageQuality}) async {
//     return picker.pickMultiImage(imageQuality: imageQuality);
//   }
//
//    Future getImage(bool isprofile, context) async {
//      var img = await ImagePickerHelper().pickImage(source: ImageSource.gallery);
//
//      if (img != null) {
//
//        final image = File(img.path.toString());
//        var croppedImage = await ImagePickerHelper.cropImage(image);
//
//        Provider.of<ImagePickerHelper>(context, listen: false).showHideLoading(true);
//
//        if (isprofile) {
//          _imageProfile = File(croppedImage?.path ?? '');
//                   notifyListeners();
//          Provider.of<ImagePickerHelper>(context, listen: false).showHideLoading(false);
//
//        } else {
//                   Provider.of<ImagePickerHelper>(context, listen: false).showHideLoading(false);
//        }
//      }
//    }
//
//
//    // Future getImage1(bool isprofile, context) async {
//    //   var img = await ImagePickerHelper().pickImage(source: ImageSource.gallery);
//    //
//    //   if (img != null) {
//    //
//    //     final image = File(img.path.toString());
//    //     // var croppedImage = await ImagePickerHelper.cropImage(image);
//    //
//    //     Provider.of<ImagePickerHelper>(context, listen: false).showHideLoading(true);
//    //
//    //     if (isprofile) {
//    //       _imageProfile = File(image.path ?? '');
//    //       notifyListeners();
//    //       Provider.of<ImagePickerHelper>(context, listen: false).showHideLoading(false);
//    //
//    //     } else {
//    //       Provider.of<ImagePickerHelper>(context, listen: false).showHideLoading(false);
//    //     }
//    //   }
//    // }
//
//    imageClear(){
//      _imageProfile = null;
//      notifyListeners();
//    }
//
//    showHideLoading(bool status) {
//     _loaderState = status;
//       notifyListeners();
//       if(_loaderState == true){
//         const CircularProgressIndicator(color: Colors.black,);
//         notifyListeners();
//       }
//    }
//
//
// }
