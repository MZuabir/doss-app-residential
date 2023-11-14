import 'package:flutter/material.dart';
import '../../../../../utils/spacing.dart';
import '../../../../widgets/auth_textfield.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_image_picker.dart';


class UserData extends StatelessWidget {
  final Function()? onTap;
   UserData({Key? key, this.onTap}) : super(key: key);
  final cpfController=TextEditingController();
  final nameController=TextEditingController();
  final passwordController=TextEditingController();
  final phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User Data",
              style: textTheme.headlineMedium,
            ),
            Spacing.y(3),
            AuthTextField(
              title: "Name and Surname",
              hintText: "João Alves",
              controller: nameController,
            ),
            AuthTextField(
              title: "CPF or CNPJ",
                hintText: "000000000",
                controller: cpfController,
              keyboardType: TextInputType.number,
            ),
            AuthTextField(
              title: "TelePhone",
              hintText: "11 9999-9999",
              controller: phoneController,
              keyboardType: TextInputType.number,
            ),
            AuthTextField(
              isPassword: true,
              title: "Password",
              hintText: "***********",
              controller: passwordController,
            ),
            const CustomImagePicker(),
            Spacing.y(3),
            CustomButton(title: "Next", onTap: onTap),
            Spacing.y(3),

          ],
        ),
      ),
    );
  }
}




