import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class MaritalStatusWidget extends StatefulWidget {
  MaritalStatusWidget(
      {super.key, required this.editable, required this.status});

  final bool editable;
  String status;

  @override
  State<MaritalStatusWidget> createState() => _MaritalStatusWdigetState();
}

class _MaritalStatusWdigetState extends State<MaritalStatusWidget> {
  var maritalStatus = [
    "Single",
    "Married",
    "Divorced",
    "Widowed",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Marital Status",
            style: TextStyle(
              fontSize: 8.sp,
              color: Colors.black38,
            ),
          ),
          DropdownButton(
            value: widget.status,
            borderRadius: BorderRadius.circular(30),
            isExpanded: true,
            items: maritalStatus
                .map(
                  (status) => DropdownMenuItem(
                    value: status,
                    enabled: widget.editable,
                    child: Text(status),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                widget.status = value.toString();
              });
            },
          ),
        ],
      ),
    );
  }
}
