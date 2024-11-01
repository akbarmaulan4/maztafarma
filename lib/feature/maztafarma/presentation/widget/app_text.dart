import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget{

  const AppText._(
      this.text, {
        this.textAlign,
        required this.appTextStyle,
        this.textOverflow,
        this.maxLine,
        this.color,
        this.fontSize
      });

  factory AppText.normal(
      String text, {
        TextOverflow? textOverflow,
        int? maxLine,
        TextAlign? textAlign,
        Color? color,
      }) {
    return AppText._(
      text,
      appTextStyle: AppTextStyle.bodyNormal,
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLine: maxLine,
      color: color,
    );
  }

  factory AppText.small(
      String text, {
        TextOverflow? textOverflow,
        int? maxLine,
        TextAlign? textAlign,
        Color? color,
      }) {
    return AppText._(
      text,
      appTextStyle: AppTextStyle.bodySmall,
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLine: maxLine,
      color: color,
    );
  }

  factory AppText.sectionTitle(
      String text, {
        TextOverflow? textOverflow,
        int? maxLine,
        TextAlign? textAlign,
        Color? color,
      }) {
    return AppText._(
      text,
      appTextStyle: AppTextStyle.sectionTitle,
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLine: maxLine,
      color: color,
    );
  }

  factory AppText.sectionTitleSize(
      String text, {
        TextOverflow? textOverflow,
        int? maxLine,
        TextAlign? textAlign,
        Color? color,
        double? fontSize
      }) {
    return AppText._(
      text,
      appTextStyle: AppTextStyle.sectionTitleSize,
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLine: maxLine,
      color: color,
      fontSize: fontSize,
    );
  }

  final String text;
  final AppTextStyle appTextStyle;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;

  TextStyle? getTextStyle(BuildContext context) {
    TextStyle? textStyle;

    if (appTextStyle case AppTextStyle.bodySmall) {
      textStyle = GoogleFonts.rubik(
        textStyle : const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        )
      );
    }
    if (appTextStyle case AppTextStyle.bodyNormal) {
      textStyle = GoogleFonts.rubik(
          textStyle : const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
          )
      );
    }

    if (appTextStyle case AppTextStyle.sectionTitle) {
      textStyle = GoogleFonts.rubik(
          textStyle : const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 20,
          )
      );

      if (appTextStyle case AppTextStyle.sectionTitleSize) {
        textStyle = GoogleFonts.rubik(
            textStyle : TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: fontSize,
            )
        );
      }
    }

    textStyle ??= GoogleFonts.rubik(
        textStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ));

    return textStyle;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextStyle? textStyle = getTextStyle(context);
    return Text(
      text,
      style: color != null ? textStyle!.copyWith(color: color, fontSize: fontSize) : textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
    );
  }
  
}

enum AppTextStyle {
  bodySmall,
  bodyNormal,
  buttonText,
  headline1,
  headline2,
  sectionTitle,
  sectionTitleSize,
  menuTitle,
}