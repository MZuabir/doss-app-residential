
import '../constants/icons.dart';

class StepperModel {
  final String icon;
  final String title;
  final String? subTitle;

  StepperModel({
    required this.icon,
    required this.title,
     this.subTitle,
  });
}
final List<StepperModel> stepperData = [
  StepperModel(
    icon: AppIcons.add,
    title: 'Maid - 05:30',
  ),
  StepperModel(
    icon: AppIcons.send,
    title: 'Sent - 05:30',
    subTitle: 'Request sent to watchman',
  ),
  StepperModel(
    icon: AppIcons.security,
    title: 'In progress - 05:30',
    subTitle: 'The watchman is on the way!',
  ),
  StepperModel(
    icon: AppIcons.locationVerified,
    title: 'Completed - 05:30',
  ),
];


