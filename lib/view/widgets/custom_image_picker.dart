import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../utils/size_config.dart';
import '../../utils/spacing.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({Key? key}) : super(key: key);

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload Photo",
          style: textTheme.bodyLarge,
        ),
        Spacing.y(1),
        GestureDetector(
          onTap: (){
            _pickImage();
          },
          child: Container(
            height: SizeConfig.heightMultiplier*6.5,
            width: SizeConfig.widthMultiplier*100,
            color: AppColors.fieldClr,
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Select file",
                  style: textTheme.bodyLarge!.copyWith(color: Colors.black45,fontWeight: FontWeight.w500),
                ),
                Image.asset(
                  AppIcons.upload,
                  height: SizeConfig.imageSizeMultiplier*6,
                  width: SizeConfig.imageSizeMultiplier*6,
                ),
              ],
            ),
          ),
        ),
        _image == null?const SizedBox():Spacing.y(3),
        _image == null?const SizedBox(): Image.file(
          File(_image!.path),
          height: SizeConfig.heightMultiplier*20,
          width: SizeConfig.widthMultiplier*100,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}