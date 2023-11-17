import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/apptheme.dart';

class AppCommonDropDown extends StatelessWidget {
  const AppCommonDropDown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.updateState,
    required this.hint,
  });

  final List<String> items;
  final String? selectedValue;
  final Function(String?) updateState;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      isExpanded: true,
      hint: Text(
        hint,
        style: AppTheme.bodyText3.copyWith(
            color: Colors.black.withOpacity(0.64),
            fontSize: 14.sp,
            fontWeight: FontWeight.w300),
      ),
      items: items
          .map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: AppTheme.bodyText3.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300),
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (String? value) {
        updateState(value);
      },
      underline: Container(
        height: 1.2,
        color: Colors.black,
      ),
      // buttonStyleData: ButtonStyleData(
      //   width: double.infinity,
      //   padding: EdgeInsets.zero,
      //   decoration: BoxDecoration(
      //       border: Border.all(color: AppColors.white),
      //       borderRadius: BorderRadius.circular(12)),
      // ),
      //  menuItemStyleData:  MenuItemStyleData(
      //     selectedMenuItemBuilder: (context, child) {
      //      return Container(
      //         color: Colors.black,
      //         child: child,
      //       );
      //     },
      //  ),
      selectedItemBuilder: (context) {
        return items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AppTheme.bodyText3.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300),
                  ),
                ))
            .toList();
      },
    );
  }
}
