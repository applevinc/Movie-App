import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/src/core/style/color.dart';
import 'package:sizer/sizer.dart';

class TabHeaderText extends StatelessWidget {
  const TabHeaderText({
    Key key,
    this.title,
    this.indicator,
  }) : super(key: key);

  final String title;
  final Widget indicator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: GoogleFonts.montserrat(
              color: Color(0xffC1C1C6),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.0.h),
          indicator,
        ],
      ),
    );
  }
}

class IndicatorContainer extends StatelessWidget {
  const IndicatorContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: AppColor.yellow,
          height: 0.5.h,
          width: 3.0.h,
        ),
        SizedBox(width: 1.0.w),
        Container(
          color: AppColor.yellow,
          height: 0.5.h,
          width: 1.0.h,
        ),
      ],
    );
  }
}
