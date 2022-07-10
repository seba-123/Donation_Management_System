import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../costant/constant.dart';

class CustomTextForm extends StatefulWidget {
  final TextInputType inputType;
  final String label;
  final int? maxLength;
  final Color colorBorder;
  final Function? onTap;
  final double padding;
  final double height;
  final int maxLines;
  final ValueChanged<bool>? valid;
  final String? setInitial;
  final icon;
  final String formControlName;
  final bool obscureText;
  final Widget? suffixIcon;
  final BorderSide? borderSide;
  final TextEditingController? controller;

  CustomTextForm({
    this.inputType = TextInputType.text,
    this.setInitial,
    this.maxLength,
    this.valid,
    this.obscureText = false,
    this.height = 50,
    required this.label,
    // this.svgColor = const Color(0xffBFBFBF),
    this.padding = 5,
    this.colorBorder = const Color(0xff707070),
    this.icon,
    required this.formControlName,
    this.onTap,
    this.maxLines = 1,
    this.suffixIcon,
    this.borderSide,
    this.controller,
  });

  @override
  _CustomTextFormState createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: addSymmetricPaddingSpace(vertical: 10, horizontal: 0),
        child: ReactiveTextField(
          obscureText: widget.obscureText,
          onTap: widget.onTap == null ? null : () => widget.onTap!(),
          formControlName: widget.formControlName,
          controller:  widget.controller,
          validationMessages: (control) => {
            ValidationMessage.required: "",
            ValidationMessage.email: "",
          },
          keyboardType: widget.inputType,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          autofocus: false,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            errorMaxLines: 1,
            prefixIcon: widget.icon == null
                ? null
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                    child: widget.icon,
                  ),
            suffixIcon: widget.suffixIcon,
            label:Text(widget.label ),
            hintText: widget.label,
            hintStyle: Theme.of(context).textTheme.caption,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: widget.padding),
            border: Theme.of(context)
                .inputDecorationTheme
                .border!.copyWith(borderSide: widget.borderSide),
            enabledBorder: Theme.of(context)
                .inputDecorationTheme
                .border!
                .copyWith(borderSide: widget.borderSide),
          ),
        ));
  }
}

class CustomTextForm1 extends StatefulWidget {
  final TextInputType inputType;
  final String label;
  final int? maxLength;
  final ValueChanged<String>? onChange;
  final Color colorBorder;
  final Function? onTap;
  final double padding;
  final double height;
  final int maxLines;
  final  FormFieldValidator<String>? valid;
  final String? setInitial;
  final icon;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final BorderSide? borderSide;

  CustomTextForm1({
    this.inputType = TextInputType.text,
    this.setInitial,
    this.maxLength,
    this.valid,
    this.onChange,
    this.obscureText = false,
    this.height = 50,
    required this.label,
    // this.svgColor = const Color(0xffBFBFBF),
    this.padding = 5,
    this.colorBorder = const Color(0xff707070),
    this.icon,
    required this.controller,
    this.onTap,
    this.maxLines = 1,
    this.suffixIcon,
    this.borderSide,
  });

  @override
  _CustomTextForm1State createState() => _CustomTextForm1State();
}

class _CustomTextForm1State extends State<CustomTextForm1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: addSymmetricPaddingSpace(vertical: 10, horizontal: 0),
        child: TextFormField(onChanged: widget.onChange,
          obscureText: widget.obscureText,
          onTap: widget.onTap == null ? null : () => widget.onTap!(),
          controller: widget.controller,
          validator: widget.valid,
          // formControlName: widget.formControlName,
          // validationMessages: (control) => {
          //   ValidationMessage.required: "",
          //   ValidationMessage.email: "",
          // },
          keyboardType: widget.inputType,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          autofocus: false,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            errorMaxLines: 1,
            prefixIcon: widget.icon == null
                ? null
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                    child: widget.icon,
                  ),
            suffixIcon: widget.suffixIcon,
            hintText: widget.label,
            hintStyle: Theme.of(context).textTheme.caption,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: widget.padding),
            border: Theme.of(context)
                .inputDecorationTheme
                .border!
                .copyWith(borderSide: widget.borderSide),
            enabledBorder: Theme.of(context)
                .inputDecorationTheme
                .border!
                .copyWith(borderSide: widget.borderSide),
          ),
        ));
  }
}
