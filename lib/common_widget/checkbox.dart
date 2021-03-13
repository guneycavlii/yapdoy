import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox(
      {Key key,
      this.vegetablesicon,
      this.degerimne,
      this.lastList,
      this.malzemeadi})
      : super(key: key);

  @override
  CheckboxWidget createState() =>
      new CheckboxWidget(degerimne, lastList, malzemeadi);

  // final String vegetablestext;
  final Widget vegetablesicon;
  final bool degerimne;
  final List<String> lastList;
  final String malzemeadi;
}

class CheckboxWidget extends State<CustomCheckbox> {

  List<String> lastList;
  bool degerimne;
  String malzemeadi;

  CheckboxWidget(this.degerimne, this.lastList, this.malzemeadi);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      widget.vegetablesicon != null ? widget.vegetablesicon : Container(),
      // Text(widget.vegetablestext),
      Transform.scale(
        scale: 1.0,
        child: Checkbox(
          value: degerimne != null ? degerimne : degerimne = false,
          onChanged: (value) {
            toggleCheckbox(value, malzemeadi);
          },
          activeColor: Colors.green,
          checkColor: Colors.white,
          tristate: false,
        ),
      ),
    ]);
  }

  void toggleCheckbox(bool value, String malzemeadi) {
    if (degerimne == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        lastList.add(malzemeadi);
        degerimne = true;
        print(lastList.toList());
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        
        lastList.remove(malzemeadi);
        degerimne = false;
        print(lastList.toList());
      });
    }
  }
}
