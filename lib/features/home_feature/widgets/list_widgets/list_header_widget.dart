import 'package:flutter/material.dart';
import 'package:formation_app/core/utils/common_functions.dart';
import 'package:formation_app/core/utils/values/styles.dart';

class ListHeaderWidget extends StatefulWidget {
  const ListHeaderWidget({
    Key? key,
    required this.onValueChanged,
  }) : super(key: key);
  final ValueChanged<String?> onValueChanged;

  @override
  State<ListHeaderWidget> createState() => _ListHeaderWidgetState();
}

class _ListHeaderWidgetState extends State<ListHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02,
              horizontal: getResponsiveItemSize(width: size.width, value: 20)),
          child: Text(
            'Welcome',
            style: poppinsBold.copyWith(
              fontSize: getResponsiveItemSize(
                width: size.width,
                value: 17,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getResponsiveItemSize(width: size.width, value: 30)),
          child: TextField(
            style: poppinsBold.copyWith(
              fontSize: getResponsiveItemSize(
                width: size.width,
                value: 14,
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                widget.onValueChanged(value);
              });
            },
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: poppinsMedium.copyWith(
                fontSize: getResponsiveItemSize(
                  width: size.width,
                  value: 14,
                ),
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black,
                    width: getResponsiveItemSize(width: size.width, value: 1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black,
                    width: getResponsiveItemSize(width: size.width, value: 1)),
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black,
                size: getResponsiveItemSize(width: size.width, value: 25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
