import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ModalBottomSheetView extends StatefulWidget {
  final Function addPlan;

  const ModalBottomSheetView(this.addPlan, {super.key});

  @override
  State<ModalBottomSheetView> createState() => _ModalBottomSheetViewState();
}

class _ModalBottomSheetViewState extends State<ModalBottomSheetView> {
  DateTime? _selectedDateOnBottom;
  final planTextController = TextEditingController();

  /// To add date from modalBottomSheet
  void _addDateFromBottomSheet(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((selectedDate) {
      if (selectedDate != null) {
        setState(() {
          _selectedDateOnBottom = selectedDate;
        });
      }
    });
  }

  //ToAdd button(submit)
  void submit() {
    if (_selectedDateOnBottom == null || planTextController.text.isEmpty) {
      return;
    }
    widget.addPlan(
      planTextController.text,
      _selectedDateOnBottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            TextButton.icon(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                ),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(
                    color: Colors.white,
                  ),
                ),
                iconColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 255, 255, 255),
                ),
                alignment: Alignment.center,
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 9, 123, 205),
                ),
              ),
              onPressed: () {
                _addDateFromBottomSheet(context);
              },
              label: const Text(
                'Select Date',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              icon: const Icon(
                Icons.calendar_month,
                size: 40,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                _addDateFromBottomSheet(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.68,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xff0771BD),
                  ),
                ),
                child: Center(
                    child: _selectedDateOnBottom == null
                        ? const Text(
                            'No date selected...',
                            style: TextStyle(
                                color: Color.fromARGB(255, 129, 127, 127),
                                fontSize: 18),
                          )
                        : Text(
                            DateFormat("EEEE, d MMMM")
                                .format(_selectedDateOnBottom!),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 2, 2, 2),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextField(
                controller: planTextController,
                cursorColor: Colors.black,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    color: Color(0xff0771BD),
                    fontSize: 20,
                  ),
                  labelText: 'Your Plan',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff0771BD),
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //
                  // CANCEL BUTTON
                  //
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 159, 158, 158),
                        fontSize: 20,
                      ),
                    ),
                  ),
    
                  //  ADD BUTTON
                  GestureDetector(
                    onTap: submit,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff2EA3F8),
                            Color(0xff0771BD),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Color(0xff0771BD),