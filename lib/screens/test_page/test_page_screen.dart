import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_list.dart';
import 'package:flutter_application_1/utils/common/custome_button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestPageScreen extends StatefulWidget {
  const TestPageScreen({super.key});

  @override
  State<TestPageScreen> createState() => _TestPageScreenState();
}

class _TestPageScreenState extends State<TestPageScreen> {
  String _selectedValue = 'None';
  final Map<String, String> _options = {
    'option1': 'Option 1',
    'option2': 'Option 2',
    'option3': 'Option 3',
    'option4': 'Option 4',
  };

  Future<void> _radioButtonfunction() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        String? tempValue = _selectedValue;
        return AlertDialog(
          backgroundColor: ColorList.scaffoldBackgroundColor,
          title: Text("Selective Alert"),
          actionsAlignment: MainAxisAlignment.start,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _options.entries.map((entry) {
              return RadioListTile<String>(
                title: Text(entry.value),
                value: entry.value,
                groupValue: tempValue,
                onChanged: (String? value) {
                  setState(() {
                    tempValue = value;
                  });
                },
              );
            }).toList(),
          ),
          actions: [
            CustomSquareButton(
              text: "accept",
              textColor: ColorList.white,
              buttonColor: ColorList.danger,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CustomSquareButton(
              text: "Cancel",
              textColor: ColorList.black,
              buttonColor: ColorList.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showRadioDialog() async {
    String? selectedValue = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String? tempValue = _selectedValue;
        return AlertDialog(
          title: Text('Select an Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _options.entries.map((entry) {
              return RadioListTile<String>(
                title: Text(entry.value),
                value: entry.value,
                groupValue: tempValue,
                onChanged: (String? value) {
                  setState(() {
                    tempValue = value;
                  });
                },
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(tempValue);
              },
            ),
          ],
        );
      },
    );

    if (selectedValue != null) {
      setState(() {
        _selectedValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("testing"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Selected Value: $_selectedValue'),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    _showRadioDialog();
                  },
                  child: Icon(
                    Icons.ads_click,
                    size: 100.w,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    _radioButtonfunction();
                  },
                  child: Icon(
                    Icons.warning_amber,
                    size: 100.w,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
