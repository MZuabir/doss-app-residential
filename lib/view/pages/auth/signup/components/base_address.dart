import 'package:doss_resident/constants/colors.dart';
import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/controllers/base_address.dart';
import 'package:doss_resident/utils/size_config.dart';
import 'package:doss_resident/view/bottomsheets/auth_btm_sheet.dart';
import 'package:doss_resident/view/widgets/loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../../constants/icons.dart';
import '../../../../../utils/spacing.dart';
import '../../../../widgets/auth_textfield.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_drop_down.dart';
import '../../../../widgets/custom_snackbar.dart';

class BaseAddressPage extends StatefulWidget {
  const BaseAddressPage({
    Key? key,
    this.isEdit = false,
  }) : super(key: key);
  final bool isEdit;
  @override
  State<BaseAddressPage> createState() => _BaseAddressPageState();
}

class _BaseAddressPageState extends State<BaseAddressPage> {
  final cont = Get.put(BaseAddressCont());
  unFocusNodes() {}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(
    ()=> ShowLoading(
        inAsyncCall: authCont.isLoading.value,
        child: Form(
          key: cont.formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Base address",
                  style: textTheme.headlineMedium,
                ).tr(),
                Spacing.y(3),
                 AuthTextField(
                 
      
                    
                      onValidate: (val) {
                        if (val == null || val.isEmpty) {
                          return tr("Please enter your address name");
                        }
        
                        // Check if the value matches the Brazilian zip code format
                      },
                      title: "Address Name",
                      hintText: "Enter your address name",
                      controller: cont.addressName,
                 
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    
                    AuthTextField(
                      focusNode: cont.zipCodeNode,
                      formatter: [MaskTextInputFormatter(mask: "#####-###")],
                      onChange: (val) {
                        if (val?.length == 9) {
                          print(val);
                          cont.checkZipCode(val!);
                        } else {
                          cont.state.clear();
                          cont.city.clear();
                          cont.street.clear();
                          cont.complement.clear();
                          cont.country.clear();
                        }
                      },
                      onSubmit: (val) => cont.checkZipCode(val),
                      onValidate: (val) {
                        if (val == null || val.isEmpty) {
                          return tr("Please enter your Zip code");
                        }
        
                        // Check if the value matches the Brazilian zip code format
                      },
                      title: "Zip Code",
                      hintText: "Enter zip code",
                      controller: cont.zipCode,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                    Obx(
                      () => cont.isCheckingZipCode.value
                          ? Positioned(
                              right: SizeConfig.widthMultiplier * 5,
                              top: SizeConfig.heightMultiplier * 5.5,
                              child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.darkGryClr,
                                    ),
                                  )),
                            )
                          : const SizedBox(),
                    )
                  ],
                ),
                AuthTextField(
                  isEnable: false,
                  focusNode: cont.countryNode,
                  title: "Country",
                  hintText: "Country",
                  controller: cont.country,
                ),
                AuthTextField(
                  isEnable: false,
                  title: "State",
                  hintText: "State",
                  controller: cont.state,
                ),
                AuthTextField(
                  isEnable: false,
                  focusNode: cont.cityNode,
                  title: "City",
                  hintText: "City",
                  controller: cont.city,
                ),
                AuthTextField(
                  isEnable: false,
                  focusNode: cont.streetNode,
                  title: "Road",
                  hintText: "Road",
                  controller: cont.street,
                ),
                AuthTextField(
                  // isEnable: false,
                  title: "Complement",
                  hintText: "Enter Complement",
                  controller: cont.complement,
                ),
                AuthTextField(
                  focusNode: cont.numberNode,
                  title: "Number Residencial",
                  hintText: "Number Residencial",
                  onValidate: (val) {
                    if (val!.isEmpty) {
                      return tr('Please enter N°');
                    }
                  },
                  controller: cont.number,
                  keyboardType: TextInputType.text,
                ),
                CustomButton(
                    title: "Next",
                    onTap: () async{
                      cont.zipCodeNode.unfocus();
                      cont.numberNode.unfocus();
                      cont.complementNode.unfocus();
        
                      if (cont.formKey.currentState!.validate() &&
                          cont.country.text.isNotEmpty &&
                          cont.city.text.isNotEmpty &&
                          cont.street.text.isNotEmpty &&
                          cont.state.text.isNotEmpty && cont.addressName.text.isNotEmpty) {
                        await cont.postBaseAddress();
                      } else {
                       
                      }
                    }),
                Spacing.y(3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) async {
   

    // showModalBottomSheet(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AuthBottomSheet(
    //       icon: AppIcons.locationVerified,
    //       onTap: () async {

    //       },
    //       btnTitle: "ok",
    //       title: 'Coverage area',
    //       description:
    //           'The following data refers to your coverage area, that is, the region where you will operate, fill in carefully.',
    //     ); // Use the separate BottomSheet widget
    //   },
    // );
  }
}
