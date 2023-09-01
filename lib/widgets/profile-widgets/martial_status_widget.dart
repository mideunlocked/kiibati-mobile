import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MaritalStatusWidget extends StatefulWidget {
  const MaritalStatusWidget(
      {super.key,
      required this.editable,
      required this.callback,
      required this.status});

  final Function(String) callback;
  final bool editable;
  final String status;

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

  var status = "Single";

  @override
  void initState() {
    super.initState();

    status = widget.status;
  }

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
            value: status,
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
                status = value.toString();
                widget.callback(status);
              });
            },
          ),
        ],
      ),
    );
  }
}
