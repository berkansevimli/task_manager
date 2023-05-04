import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../size_config.dart';
import '../../constants.dart';
import '../../core/utilities/color_utils.dart';
import '../../core/utilities/font_style_utils.dart';
import 'custom_svg_view.dart';

typedef OnChangeValue = void Function(String);

/// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? icon;
  final Widget? suffixIcon;
  final String? hint;
  final String? text;
  final bool? readOnly;

  final bool? obsecure;
  final double? height;
  final double? width;
  int? maxLines = 1;

  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  List<TextInputFormatter>? inputFormatters;
  TextCapitalization textCapitalization;

  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final OnChangeValue? onChange;

  final decoration;

  CustomTextField(
      {Key? key,
      this.controller,
      this.icon,
      this.hint,
      this.obsecure = false,
      this.keyboardType,
      this.height,
      this.width,
      this.onTap,
      this.onChange,
      this.inputFormatters,
      this.suffixIcon,
      this.onSaved,
      this.validator,
      this.decoration,
      this.readOnly = false,
      this.textCapitalization = TextCapitalization.none,
      this.text,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: width ?? screenSize.width,
      decoration: BoxDecoration(
      
        boxShadow: [
          BoxShadow(
            color: kBorderColor.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: ColorUtilities.white,
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: icon != null ? 15 : 0),
          icon != null
              ? CustomSvgView(
                  imageUrl: icon,
                  isFromAssets: true,
                  height: 16,
                  width: 16,
                )
              : SizedBox(),
          SizedBox(width: icon != null ? 0 : 0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(15),
                  vertical: getProportionateScreenHeight(4)),
              child: TextFormField(
                textCapitalization: textCapitalization,
                onSaved: onSaved,
                readOnly: readOnly!,
                maxLines: maxLines,
                initialValue: text,
                validator: validator,

                //decoration: decoration,
                controller: controller,
                obscureText: obsecure!,
                keyboardType: keyboardType ?? TextInputType.text,
                onTap: onTap ?? () {},
                onChanged: onChange ?? (String value) {},
                inputFormatters: inputFormatters ?? [],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 0.1),
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(15)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(15)),
                  ),
                  hintText: hint,
                  hintStyle: FontStyleUtilities.t1(
                    fontColor: Theme.of(context).cardColor,
                    fontWeight: FWT.regular,
                  ),
                ),
                style: FontStyleUtilities.t1(
                  fontColor: Theme.of(context).primaryColor,
                  fontWeight: FWT.regular,
                ),
              ),
            ),
          ),
          SizedBox(width: suffixIcon != null ? 10 : 0),
          suffixIcon ?? SizedBox(),
        ],
      ),
    );
  }
}
