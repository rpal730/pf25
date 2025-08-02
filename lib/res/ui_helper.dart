import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_portfolio_2025/res/app_dimensions.dart';

const double figmaScreenWidth = 428.0;
const double figmaScreenHeight = 926.0;

const Widget horizontalSpaceTiny = SizedBox(width: AppDimentions.px5);
const Widget horizontalSpaceSmall = SizedBox(width: AppDimentions.px10);
const Widget horizontalSpaceMediumSmall = SizedBox(width: AppDimentions.px15);
const Widget horizontalSpaceMediumQuarter =
    SizedBox(height: AppDimentions.px20);
const Widget horizontalSpaceMedium = SizedBox(width: AppDimentions.px25);
const Widget horizontalSpaceExtraLarge = SizedBox(width: AppDimentions.px120);
const Widget horizontalSpaceMediumLarge = SizedBox(width: AppDimentions.px40);

const Widget verticalSpaceSize2 = SizedBox(height: AppDimentions.px2);
const Widget verticalSpaceTiny = SizedBox(height: AppDimentions.px5);
const Widget verticalSpaceSmall = SizedBox(height: AppDimentions.px10);
const Widget verticalSpaceMediumSmall = SizedBox(height: AppDimentions.px15);
const Widget verticalSpaceMediumQuarter = SizedBox(height: AppDimentions.px20);
const Widget verticalSpaceMedium = SizedBox(height: AppDimentions.px25);
const Widget verticalSpaceLarge = SizedBox(height: AppDimentions.px50);
const Widget verticalSpaceMassive = SizedBox(height: AppDimentions.px120);
Widget divider = Container(
  height: 1,
  color: Colors.grey.shade200,
);
Widget indentSpacedDivider = const Column(
  children: <Widget>[
    verticalSpaceMediumSmall,
    Divider(
      indent: 16.0,
      endIndent: 16.0,
    ),
    verticalSpaceMediumSmall,
  ],
);

double paddingTop(BuildContext context) => MediaQuery.of(context).padding.top;

Widget verticalSpace(double height) => SizedBox(height: height);

Widget horizontalSpace(double width) => SizedBox(width: width);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double widthAccToFigma(
        {required double width, required BuildContext context}) =>
    (width / figmaScreenWidth) * screenWidth(context);

double heightAccToFigma(
        {required double height, required BuildContext context}) =>
    (height / figmaScreenHeight) * screenHeight(context);

class CustomSvgAssetImage extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  const CustomSvgAssetImage(
      {super.key, required this.assetName, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
    );
  }
}
