import 'package:flutter/material.dart';

import '../../core/utilities/asset_utils.dart';
import '../../core/utilities/color_utils.dart';
import 'custom_svg_view.dart';

typedef OnChange = void Function(bool);

/// ignore: must_be_immutable
class CustomCheckBox extends StatefulWidget {
  final double? size;
  bool isSelected;
  final OnChange onChange;

  CustomCheckBox(
      {Key? key, this.size, this.isSelected = false, required this.onChange})
      : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });

        widget.onChange(widget.isSelected);
      },
      child: Container(
        height: widget.size ?? 20,
        width: widget.size ?? 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? ColorUtilities.primary_500
              : ColorUtilities.white,
          borderRadius: BorderRadius.circular(5),
          border: widget.isSelected
              ? null
              : Border.all(color: ColorUtilities.text_400, width: 0.2),
        ),
        child: widget.isSelected
            ? CustomSvgView(
                imageUrl: AssetUtilities.checkTrueStrokeSvg,
                isFromAssets: true,
                height: 11,
                width: 11,
                svgColor: ColorUtilities.white,
              )
            : SizedBox(),
      ),
    );
  }
}
