import 'package:flutter/material.dart';

import '../../core/style/app_color.dart';

class GroupRadioListWidget extends StatefulWidget {
  const GroupRadioListWidget(
      {Key? key,
      required this.listItem,
      this.padding,
      required this.onChanged,
      this.color,
      this.radioRadius = 8.0,
      this.spaceBetween = 8.0,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.selectedIndex,
      this.scrollDirection = Axis.vertical,
      this.physics = const ClampingScrollPhysics()})
      : super(key: key);

  final Color? color;
  final List<Widget> listItem;
  final EdgeInsets? padding;
  final Function(int) onChanged;
  final double radioRadius;
  final double spaceBetween;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final int? selectedIndex;
  final Axis scrollDirection;
  final ScrollPhysics physics;

  @override
  State<GroupRadioListWidget> createState() => _GroupRadioListWidgetState();
}

class _GroupRadioListWidgetState extends State<GroupRadioListWidget> {
  int? selectedIndex;

  @override
  void initState() {
    setState(() {
      selectedIndex = widget.selectedIndex;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.listItem.length <= 2
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.listItem.map<Widget>((e) {
              int index = widget.listItem.indexOf(e);
              return Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 8.0),
                  child: LabeledRadio(
                    selectedIndex: selectedIndex,
                    color: widget.color ?? AppColor.secondaryColor,
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value;
                        widget.onChanged(value);
                      });
                    },
                    index: index,
                    item: widget.listItem[index],
                    crossAxisAlignment: widget.crossAxisAlignment,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    radioRadius: widget.radioRadius,
                    spaceBetween: widget.spaceBetween,
                    padding: widget.padding,
                  ),
                ),
              );
            }).toList(),
          )
        : ListView.builder(
            shrinkWrap: true,
            scrollDirection: widget.scrollDirection,
            physics: widget.physics,
            itemCount: widget.listItem.isNotEmpty ? widget.listItem.length : 0,
            itemBuilder: (context, index) {
              return LabeledRadio(
                selectedIndex: selectedIndex,
                color: widget.color ?? AppColor.mainColor,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                    widget.onChanged(value);
                  });
                },
                index: index,
                item: widget.listItem[index],
                crossAxisAlignment: widget.crossAxisAlignment,
                mainAxisAlignment: widget.mainAxisAlignment,
                radioRadius: widget.radioRadius,
                spaceBetween: widget.spaceBetween,
                padding: widget.padding,
              );
            });
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.item,
    required this.index,
    required this.color,
    required this.onChanged,
    required this.radioRadius,
    required this.padding,
    required this.spaceBetween,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.selectedIndex,
  }) : super(key: key);

  final Color color;
  final int? selectedIndex;
  final Widget item;
  final int index;
  final EdgeInsets? padding;
  final Function(int) onChanged;
  final double radioRadius;
  final double spaceBetween;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(index);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: selectedIndex == index
              ? Border.all(color: AppColor.mainColor)
              : null,
          color: selectedIndex == index
              ? AppColor.borderCardWhite
              : AppColor.borderCardWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: <Widget>[
            item,
            SizedBox(
              width: spaceBetween,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    color: selectedIndex == index ? color : AppColor.mainColor,
                    width: 2),
              ),
              padding: const EdgeInsets.all(2),
              child: selectedIndex == index
                  ? Container(
                      height: radioRadius,
                      width: radioRadius,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                        shape: BoxShape.rectangle,
                      ),
                    )
                  : SizedBox(
                      height: radioRadius,
                      width: radioRadius,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
