
import 'package:flutter/material.dart';

import '../costant/constant.dart';
import '../theme/app_colors.dart';

Widget customElevatedButtonWithIcon(context,
        {required String title,
        required Function? function,
        bool isUpperCase = true,
        bool showSpacing = true,
        Color backGroundColor = AppColor.buttonColor,
        Color color = Colors.white,
        double? width,
        Widget? rightIcon,
        Widget? leftIcon,
        double radius = 10,
        bool showCustomRadius = false,
        BorderRadiusGeometry? borderRadius}) =>
    SizedBox(
      height: 50.0,
      width: width,
      child: ElevatedButton(
        clipBehavior: Clip.hardEdge,
        onPressed: function == null ? null : () => function(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            rightIcon ?? SizedBox.shrink(),
            showSpacing ? Spacer() : SizedBox.shrink(),
            Padding(
              padding: addSymmetricPaddingSpace(vertical: 0,horizontal: 0),
              child: Text(title,textAlign: TextAlign.center,),
            ),
            showSpacing ? Spacer() : SizedBox.shrink(),
            leftIcon ?? SizedBox.shrink()
          ],
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: backGroundColor,
            onPrimary: color,
            textStyle: Theme.of(context).textTheme.headline6,
            shape: RoundedRectangleBorder(
                borderRadius: showCustomRadius
                    ? borderRadius ?? BorderRadius.circular(5)
                    : BorderRadius.circular(radius))),
      ),
    );

customAcceptTerms(context,
    {required ValueChanged<bool>? onChanged, required bool value}) {
  return Row(
    children: [
      Checkbox(
          activeColor: AppColor.primaryColor,
          value: value,
          onChanged: (value) => onChanged),
      InkWell(
          onTap: () {
            // NavigationRout.navigatorTo(
            //     context, TermsAndCondition("1"));
          },
          child: Row(
            children: [
              Text(
                "accept",
                style: Theme.of(context).textTheme.headline4,
              ),
              addHorizontalSpace(w: 5),
              Text(
                "terms and condition",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: AppColor.primaryColor,
                    decoration: TextDecoration.underline),
              )
            ],
          ))
    ],
  );
}

customTextOrIconButton({required function, label}) {
  return TextButton(child: label ?? Container(), onPressed: () => function());
}
