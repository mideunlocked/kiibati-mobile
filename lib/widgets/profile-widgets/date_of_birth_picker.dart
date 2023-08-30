import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DateOfBirthPicker extends StatefulWidget {
  const DateOfBirthPicker({
    super.key,
    required this.dateOfBirthController,
    required this.editable,
  });

  final TextEditingController dateOfBirthController;
  final bool editable;

  @override
  State<DateOfBirthPicker> createState() => _DateOfBirthPickerState();
}

class _DateOfBirthPickerState extends State<DateOfBirthPicker> {
  @override
  void initState() {
    super.initState();

    dateOfBirth = widget.dateOfBirthController.text.trim();
  }

  DateTime selectedDate = DateTime.now();
  String dateOfBirth = "";

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (BuildContext context, child) {
          var of = Theme.of(context);
          var primaryColor = of.primaryColor;
          return Theme(
            data: ThemeData(
                colorScheme: ColorScheme.light(
              primary: primaryColor,
            )),
            child: child!,
          );
        });

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateOfBirth =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      child: InkWell(
        onTap: () {
          if (widget.editable) {
            selectDate(context);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Date of birth",
              style: TextStyle(
                fontSize: 8.sp,
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              dateOfBirth,
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
