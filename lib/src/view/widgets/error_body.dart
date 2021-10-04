import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/core/style/color.dart';
import 'package:sizer/sizer.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    Key key,
    this.message,
    this.refresh,
  }) : super(key: key);

  final Object message;
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // ignore: unnecessary_brace_in_string_interps
              "${message}",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 100.0.w,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColor.yellow),
                ),
                onPressed: refresh,
                child: Text(
                  'Refresh',
                  style: kSubHeadline.copyWith(
                    color: Colors.white,
                    fontSize: 11.0.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
