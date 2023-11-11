import 'package:doss/constants/colors.dart';
import 'package:doss/utils/size_config.dart';
import 'package:flutter/material.dart';

class SenderRowView extends StatelessWidget {
  const SenderRowView({Key? key, required this.senderMessage}) : super(key: key);

  final String senderMessage;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Flexible(
          flex: 35,
          fit: FlexFit.tight,
          child: SizedBox(),
        ),
        Flexible(
          flex: 72,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Wrap(
                children: [
                  Container(
                    margin:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5,
                    vertical: SizeConfig.heightMultiplier*0.35,
                    ),
                    padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5,
                      vertical: SizeConfig.heightMultiplier*0.6,),
                    decoration:  BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.primaryClr,
                        borderRadius: const BorderRadius.only(
                            topRight:Radius.circular(10.0),
                            bottomLeft:Radius.circular(10.0),
                            topLeft:Radius.circular(10.0),
                        )),
                    child: Text(
                      senderMessage,
                      textAlign: TextAlign.left,
                      style: textTheme.bodySmall!.copyWith(color: Colors.black,fontSize: SizeConfig.textMultiplier*1.7,fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //
        ),
      ],
    );
  }
}
