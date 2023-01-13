import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeasonSelector extends StatefulWidget {
  final List<int> seasonsList;
  final Function(int) updateParent;

  const SeasonSelector({
    super.key,
    required this.seasonsList,
    required this.updateParent,
  });

  @override
  State<SeasonSelector> createState() => _SeasonSelectorState();
}

class _SeasonSelectorState extends State<SeasonSelector> {
  int? selectedvalue = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          CupertinoSlidingSegmentedControl(
            padding: const EdgeInsets.all(4),
            groupValue: selectedvalue,
            children: {
              0: Text(widget.seasonsList[0].toString()),
              1: Text(widget.seasonsList[1].toString()),
              2: Text(widget.seasonsList[2].toString()),
              3: Text(widget.seasonsList[3].toString()),
              4: Text(widget.seasonsList[4].toString()),
              5: Text(widget.seasonsList[5].toString()),
            },
            onValueChanged: (groupValue) {
              setState(() {
                selectedvalue = groupValue;
                widget.updateParent(widget.seasonsList[groupValue ?? 0]);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildSegment(String text) => Container(
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: "Quicksand",
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      );
}
