import 'package:flutter/material.dart';

class MultiToggleButtons extends StatefulWidget {
  final Function(int) onOptionSelected;

  const MultiToggleButtons({super.key, required this.onOptionSelected});

  @override
  State<MultiToggleButtons> createState() => _MultiToggleButtonsState();
}

class _MultiToggleButtonsState extends State<MultiToggleButtons> {
  List<bool> isSelected = [true, false, false, false, false];
  List<String> optionList = ['1D', '1W', '1M', '6M', '1Y'];

  @override
  Widget build(BuildContext context) {
    //wrap the GridView wiget in an Ink wiget and set the width and height,
    //otherwise the GridView widget will fill up all the space of its parent widget
    return Ink(
      width: double.infinity,
      height: 80,
      color: Colors.transparent,
      child: GridView.count(
        primary: true,
        crossAxisCount: 5,
        //set the number of buttons in a row
        crossAxisSpacing: 8,
        //set the spacing between the buttons
        childAspectRatio: 1,
        //set the width-to-height ratio of the button,
        //>1 is a horizontal rectangle
        children: List.generate(isSelected.length, (index) {
          //using Inkwell widget to create a button
          return InkWell(
              borderRadius: BorderRadius.circular(24),
              splashColor: Colors.lightGreen, //the default splashColor is grey
              onTap: () {
                widget.onOptionSelected(index);
                setState(() {
                  for (int indexBtn = 0;
                      indexBtn < isSelected.length;
                      indexBtn++) {
                    if (indexBtn == index) {
                      isSelected[indexBtn] = true;
                    } else {
                      isSelected[indexBtn] = false;
                    }
                  }
                });
              },
              child: Ink(
                decoration: BoxDecoration(
                  //set the background color of the button when it is selected/ not selected
                  color: isSelected[index]
                      ? const Color(0xffD6EAF8)
                      : Colors.transparent,
                  // here is where we set the rounded corner
                  borderRadius: BorderRadius.circular(24),
                  //don't forget to set the border,
                  //otherwise there will be no rounded corner
                  border: Border.all(color: isSelected[index] ? Colors.green : Colors.transparent),
                ),
                child: Center(
                  child: Text(
                    optionList[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: isSelected[index] ? Colors.green : Colors.green.shade300),
                    //set the color of the icon when it is selected/ not selected
                  ),
                ),
              ));
        }),
      ),
    );
  }
}
