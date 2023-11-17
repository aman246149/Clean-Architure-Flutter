import 'package:architecture/core/presentation/widgets/vspace.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showDatePickerBottomSheet(BuildContext context,
    Function(String) onDateTimeChanged, DateTime selectedDate,
    {DateTime? maxDate, DateTime? minDate}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext builderContext) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              minimumDate: minDate,
              maximumDate: maxDate,
              onDateTimeChanged: (DateTime newDateTime) {
                selectedDate = newDateTime;
                String formattedDate =
                    DateFormat("d MMM yyyy").format(selectedDate);
                onDateTimeChanged(formattedDate);
              },
            ),
          ),
          SizedBox(
            height: 40,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the bottom sheet
                  String formattedDate =
                      DateFormat("d MMM yyyy").format(selectedDate);

                  onDateTimeChanged(
                      formattedDate); // Pass the selected date back
                },
                child: const Text('Done'),
              ),
            ),
          ),
          const Vspace(20)
        ],
      );
    },
  );
}
