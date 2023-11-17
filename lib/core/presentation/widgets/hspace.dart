import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hspace extends StatelessWidget {
  final double hspace;
  const Hspace(this.hspace, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
      ScreenUtil().setWidth(hspace)
       
    );
  }
}
