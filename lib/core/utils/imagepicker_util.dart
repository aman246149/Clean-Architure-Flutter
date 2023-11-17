import 'dart:io';

import 'package:architecture/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  XFile? _selectedImagePath = XFile("");
  File _pickedImage = File("");
  final ImagePicker _pickedFile = ImagePicker();

  void showImagePicker(BuildContext context, Function() updateState) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    getImage(ImageSource.camera, context, updateState);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera_alt_rounded,
                            color: Colors.black, size: 30),
                        const SizedBox(height: 5),
                        Text(
                          'Camera',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    getImage(ImageSource.gallery, context, updateState);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.photo_library_rounded,
                            color: Colors.black, size: 30),
                        const SizedBox(height: 5),
                        Text(
                          'Gallery',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void getImage(ImageSource imageSource, BuildContext context,
      Function() updateState) async {
    try {
      _selectedImagePath = (await _pickedFile.pickImage(source: imageSource));
      if (_selectedImagePath != null) {
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
}
