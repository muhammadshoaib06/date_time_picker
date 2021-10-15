import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  String? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
                primaryColor: Colors.black54,
                splashColor: Colors.black,
                brightness: Brightness.dark),
            child: child ?? Text(""),
          );
        },
        initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
                primaryColor: Colors.black54,
                splashColor: Colors.black,
                brightness: Brightness.dark),
            child: child ?? Text(""),
          );
        });
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Time Picker'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        child: Center(
            child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date Picker',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 55.0,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.black54,
                          border: Border.all(color: Colors.white)),
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                            Expanded(
                                child: Icon(Icons.calendar_today,
                                    color: Colors.white, size: 30))
                          ],
                        ),
                      ),
                    ))),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Time Picker',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 55.0,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.black54,
                          border: Border.all(color: Colors.white)),
                      child: InkWell(
                        onTap: () => _selectTime(context),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _selectedTime != null
                                        ? _selectedTime!
                                        : '${TimeOfDay.now().format(context)}',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                            Expanded(
                                child: Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 30,
                            ))
                          ],
                        ),
                      ),
                    ))),
          ],
        )),
      ),
    );
  }
}
