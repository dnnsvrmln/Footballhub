import 'package:flutter/material.dart';
import 'package:football_app/resources/constants.dart';

class TeamDetailsInfoDetailsItem extends StatelessWidget {
  const TeamDetailsInfoDetailsItem({
    Key? key,
    required this.itemString,
    required this.itemNaam,
  }) : super(key: key);

  final String itemNaam;
  final String itemString;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.4),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              itemNaam,
              style: const TextStyle(
                color: appTextColor,
                fontFamily: 'Quicksand',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              itemString,
              style: const TextStyle(
                color: appTextColor,
                fontFamily: 'Quicksand',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
