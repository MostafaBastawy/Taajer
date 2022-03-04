import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultTextFormField extends StatelessWidget {
  double? width;
  double? height;
  Color? borderColor;
  List<BoxShadow> borderBoxShadow;
  TextEditingController? textEditingController;
  TextInputType? textInputType;
  bool? obscureText;
  Function? validator;
  Function? onTap;
  String? hintText;
  String? activeTextFormField;
  String? activeTextFormFieldName;
  Function? clearController;
  DefaultTextFormField({
    Key? key,
    required this.width,
    required this.height,
    required this.borderColor,
    required this.borderBoxShadow,
    required this.textEditingController,
    required this.textInputType,
    required this.obscureText,
    required this.validator,
    required this.onTap,
    required this.hintText,
    required this.activeTextFormField,
    required this.activeTextFormFieldName,
    required this.clearController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.0, color: borderColor!),
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: borderBoxShadow),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textEditingController,
              keyboardType: textInputType,
              maxLines: 1,
              obscureText: obscureText!,
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              validator: (value) {
                validator!;
              },
              onTap: () {
                onTap!();
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFB2B7C2),
                  fontStyle: FontStyle.normal,
                  height: 1.6,
                ),
              ),
            ),
          ),
          if (activeTextFormField == activeTextFormFieldName)
            GestureDetector(
              onTap: () {
                clearController!();
              },
              child: SvgPicture.asset(
                'assets/images/delete-icon.svg',
                width: 16.67.w,
                height: 16.67.h,
              ),
            ),
        ],
      ),
    );
  }
}
