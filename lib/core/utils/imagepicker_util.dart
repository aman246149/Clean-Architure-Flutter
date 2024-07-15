// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../presentation/widgets/hspace.dart';
import '../presentation/widgets/vspace.dart';
import '../routes/router.dart';
import 'common_methods.dart';

class ImagePickerUtil {
  XFile? _selectedImagePath = XFile("");
  File _pickedImage = File("");
  final ImagePicker _pickedFile = ImagePicker();
  List<XFile> multiMedia = [];
  void showImagePicker(BuildContext context, Function() updateState,
      {bool isMultiMediaPickerRequired = false, int fileSize = 5}) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    // if (isMultiMediaPickerRequired) {
                    //   setMultiMediaPicker(updateState);
                    //   Navigator.pop(context);
                    //   return;
                    // }
                    getImage(
                        ImageSource.camera, context, updateState, fileSize);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xffD0D0D0),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.camera_alt,
                          color: Color(0xff0A84FF),
                        ),
                        const Hspace(5),
                        Text(
                          "Take photo from camera",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff0A84FF)),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 0.6,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () async {
                    if (isMultiMediaPickerRequired) {
                      setMultiMediaPicker(updateState, context);
                      Navigator.pop(context);
                      return;
                    }
                    getImage(
                        ImageSource.gallery, context, updateState, fileSize);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xffD0D0D0),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.photo_size_select_actual,
                          color: Color(0xff0A84FF),
                        ),
                        const Hspace(5),
                        Text(
                          "Select from Gallery",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff0A84FF)),
                        )
                      ],
                    ),
                  ),
                ),
                const Vspace(8),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff0A84FF)),
                        ),
                      )),
                ),
                const Vspace(10),
              ],
            ),
          );
        });
  }

  void getImage(ImageSource imageSource, BuildContext context,
      Function() updateState, int fileSize) async {
    try {
      _selectedImagePath =
          (await _pickedFile.pickImage(source: imageSource, imageQuality: 100));
      if (_selectedImagePath != null) {
        double imageSize =
            calculateSizeInMb(await _selectedImagePath!.length());
        if (imageSize > fileSize) {
          BuildContext currentContext =
              GetIt.I<AppRouter>().navigatorKey.currentContext!;
          showErrorSnackbar(currentContext, "File size must be less than 5MB");
          return;
        }
        _pickedImage = File(_selectedImagePath?.path ?? "");
      }
      updateState();
    } catch (e) {
      logger.e(e);
    }
  }

  void uploadImage(BuildContext context, Function(FormData) uploadApi,
      String keyName) async {
    String fileName = _pickedImage.path.split('/').last;
    FormData formData = FormData.fromMap({
      keyName:
          await MultipartFile.fromFile(_pickedImage.path, filename: fileName),
    });

    if (_pickedImage.path.isNotEmpty) {
      uploadApi(formData);
    }
  }

  File pickedImage() {
    return _pickedImage;
  }

  void setImagePickerToNull() {
    _pickedImage = File("");
  }

  void setMultiMediaPicker(Function() updateState, BuildContext context) async {
    List<XFile?> imageMedia = await _pickedFile.pickMultiImage();
    // final List<XFile> medias = await _pickedFile.pickMultipleMedia();
    final List<XFile> medias = imageMedia.whereType<XFile>().toList();
    // check file size
    for (var element in medias) {
      //check if medifile is more that 15 mb

      if (calculateSizeInMb(await element.length()) > 15) {
        BuildContext currentContext =
            GetIt.I<AppRouter>().navigatorKey.currentContext!;
        showErrorSnackbar(currentContext, "File size must be less than 15MB");
        return;
      }
    }

    multiMedia.addAll(medias);
    updateState();
  }
}
