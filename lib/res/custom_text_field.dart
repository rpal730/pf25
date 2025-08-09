import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_portfolio_2025/res/app_dimensions.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';

class CustomTextField extends StatelessWidget {
  final TextStyle? textStyle;
  final String? title;
  final String? helperText;
  final String? subtitle;
  final double? borderRadius;
  final String? initialValue;

  final String? hint;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final int? maxLines;
  final bool expands;
  final bool readOnly;
  final void Function()? onTap;
  final double fontSize;
  final double maxHeight;
  final EdgeInsets? padding;
  final double? maxWidth;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final VoidCallback? onEditingComplete;
  final double? height;
  final double? width;
  final Color? textFieldBackgroundColor;
  final Color? titleColor;
  final double? titleFontSize;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool? obscureText;
  final double? leftPaddingForPrefixWidget;
  final double? topPaddingForPrefixWidget;
  final double? rightPaddingForSuffixWidget;
  final double? topPaddingForSuffixWidget;

  const CustomTextField({
    super.key,
    this.title,
    this.subtitle,
    this.hint,
    this.suffixWidget,
    this.prefixWidget,
    this.controller,
    this.inputType,
    this.maxLines = 1,
    this.expands = false,
    this.readOnly = false,
    this.onTap,
    this.fontSize = AppDimentions.px18,
    this.maxHeight = AppDimentions.px250,
    this.padding,
    this.maxWidth,
    this.textInputAction,
    this.textCapitalization,
    this.onSubmitted,
    this.height,
    this.width,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.helperText,
    this.textStyle,
    this.textFieldBackgroundColor,
    this.titleColor,
    this.titleFontSize,
    this.maxLength,
    this.inputFormatters,
    this.focusNode,
    this.obscureText,
    this.borderRadius = AppDimentions.px12,
    this.initialValue,
    this.leftPaddingForPrefixWidget,
    this.topPaddingForPrefixWidget,
    this.rightPaddingForSuffixWidget,
    this.topPaddingForSuffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (controller != null &&
        onChanged != null &&
        controller!.text.isNotEmpty) {
      onChanged!(controller!.text);
    }
    if (initialValue != null) {
      onChanged!(initialValue!);
    }

    final prefixWidth =
        prefixWidget != null
            ? 50.0
            : 0.0; // Adjust width as per your prefix widget size
    final suffixWidth =
        suffixWidget != null
            ? 50.0
            : 0.0; // Adjust width as per your suffix widget size

    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: maxWidth ?? double.infinity,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Row(
              children: [
                Text(
                  title ?? '',
                  style: TextStyle(color: titleColor, fontSize: titleFontSize),
                ),
                if (subtitle != null) ...[
                  horizontalSpaceTiny,
                  Text(
                    subtitle ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
            verticalSpaceSmall,
          ],
          Stack(
            children: [
              SizedBox(
                height: heightAccToFigma(
                  height: height ?? 65,
                  context: context,
                ), // Set a fixed height for the text field
                width: width,
                child: TextFormField(
                  obscureText: obscureText ?? false,
                  onChanged: onChanged,
                  focusNode: focusNode,
                  maxLength: maxLength,
                  validator: validator,
                  controller: controller,
                  initialValue: initialValue,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: inputType,
                  onSaved: onSaved,
                  textInputAction: textInputAction,
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.none,
                  onEditingComplete: onEditingComplete,
                  onFieldSubmitted: onSubmitted,
                  maxLines: maxLines,
                  expands: expands,
                  readOnly: readOnly,
                  onTap: onTap,
                  inputFormatters: inputFormatters,
                  textAlignVertical:
                      TextAlignVertical.center, // Center text vertically
                  decoration: InputDecoration(
                    counterText: '',
                    helperText: helperText,
                    isDense: true,
                    filled: true,
                    fillColor: textFieldBackgroundColor ?? AppColors.background,
                    hintText: hint,
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.text.shade300,
                      fontSize: 18,
                    ),
                    contentPadding:
                        padding ??
                        EdgeInsets.only(
                          left:
                              AppDimentions.px15 +
                              prefixWidth, // Adjust padding based on prefix widget
                          right: AppDimentions.px15 + suffixWidth,
                          top: AppDimentions.px10,
                          bottom: AppDimentions.px30,
                        ), // Adjust vertical padding for better centering
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        borderRadius ?? AppDimentions.px12,
                      ),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        borderRadius ?? AppDimentions.px12,
                      ),
                      borderSide: BorderSide(
                        color: AppColors.primary.shade100,
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary.shade100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(AppDimentions.px18),
                    ),
                  ),
                ),
              ),

              if (prefixWidget != null)
                Positioned(
                  left: 8,
                  child: SizedBox(
                    width: prefixWidth,
                    height: heightAccToFigma(
                      height: height ?? 65,
                      context: context,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [prefixWidget ?? const SizedBox()],
                    ),
                  ),
                ),

              if (suffixWidget != null)
                Positioned(
                  right: 8,
                  child: SizedBox(
                    width: suffixWidth,
                    height: heightAccToFigma(
                      height: height ?? 65,
                      context: context,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [suffixWidget ?? const SizedBox()],
                    ),
                  ),
                ),

              // if (prefixWidget != null)
              //   Positioned(
              //     top: topPaddingForPrefixWidget ?? 18,
              //     left: leftPaddingForPrefixWidget ?? 10,
              //     child: prefixWidget!,
              //   ),
              // if (suffixWidget != null)
              //   Positioned(
              //     top: topPaddingForSuffixWidget ?? 18,
              //     right:    rightPaddingForSuffixWidget ?? 10,
              //     child: suffixWidget!,
              //   ),
            ],
          ),
        ],
      ),
    );
  }
}
