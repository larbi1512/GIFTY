// toggle_button.dart
import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

class ToggleButton extends StatefulWidget {
   final Function(bool) onToggle;

  ToggleButton({required this.onToggle});
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isUserSelected = true; // Default selection is user

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: Text('User'),
          selected: isUserSelected,
          onSelected: (selected) {
            setState(() {
              isUserSelected = selected;
              widget.onToggle(selected); 
            });
          },
          backgroundColor:isUserSelected ? AppColor.mainLighter : AppColor.peachLighter,

          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)
           ),
           
           
        
        ),
        SizedBox(width: 10,),
        ChoiceChip(
          label: Text('Provider'),
          selected: !isUserSelected,
          backgroundColor: !isUserSelected ? AppColor.mainLighter : AppColor.peachLighter,
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

          onSelected: (selected) {
            setState(() {
              isUserSelected = !selected;
              widget.onToggle(!selected);
            });
          },
        ),
      ],
    );
  }
}
