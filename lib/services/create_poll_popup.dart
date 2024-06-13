import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/poll_item_model.dart';

class CreatePollBottomSheet extends StatefulWidget {
  final Function(PollItem) onPollCreated;

  CreatePollBottomSheet({required this.onPollCreated});

  @override
  _CreatePollBottomSheetState createState() => _CreatePollBottomSheetState();

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CreatePollBottomSheet(onPollCreated: onPollCreated),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
    );
  }
}

class _CreatePollBottomSheetState extends State<CreatePollBottomSheet> {
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _optionControllers = [
    TextEditingController(), // Initial option
    TextEditingController(), // Second option
  ]; // List for dynamic options
  bool _allowMultipleAnswers = false;

  @override
  Widget build(BuildContext context) {
    bool canCreatePoll = _questionController.text.isNotEmpty &&
        _optionControllers.where((c) => c.text.isNotEmpty).length >=
            2; // Check for valid question and at least 2 options

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20.0,
          right: 20.0,
          top: 20.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 110),
                  child: Text(
                    'CREATE POLL!',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.green),
                  onPressed: () => Get.back(), // Close the bottom sheet on tap
                ),
              ],
            ),
            const SizedBox(
                height: 15), // Increased space between title and textfield
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: _questionController,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold), // Green and bold style
                decoration: const InputDecoration(
                  hintText: ' Ask Question...',
                  hintStyle:
                  TextStyle(color: Colors.grey, fontSize: 16.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10), // Space between question and options
            Wrap(
              // Wrap options for better layout
              children: _optionControllers
                  .map((controller) => _buildOptionTextField(controller))
                  .toList(),
            ),
            const SizedBox(height: 10), // Space between options and switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Allow Multiple Answers',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ),
                Switch(
                  value: _allowMultipleAnswers,
                  onChanged: (value) =>
                      setState(() => _allowMultipleAnswers = value),

                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.white,
                  inactiveThumbColor: Colors.lightGreen, // Green switch color
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: canCreatePoll
                    ? () {
                  var question = _questionController.text;
                  var options = _optionControllers
                      .where((c) => c.text.isNotEmpty)
                      .map((c) => c.text.trim())
                      .toList();
                  var pollItem = PollItem(
                    question: question,
                    options: options,
                    votes: {},
                    allowMultipleAnswers: _allowMultipleAnswers,
                  );
                  widget.onPollCreated(pollItem);
                  // Get.snackbar(
                  //
                  //   'Success',
                  //   'Poll created successfully!',
                  //   backgroundColor: Colors.green,
                  //   snackPosition: SnackPosition.TOP
                  // );
                  Get.back(); // Close the bottom sheet
                }
                    : null, // Disable button if invalid
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  backgroundColor: canCreatePoll
                      ? Colors.green
                      : Colors
                      .lightGreen, // Green for enabled, light green for disabled
                  minimumSize: Size(
                      MediaQuery.of(context).size.width, 40), // Full width button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text(
                  'CREATE',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTextField(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: controller,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  hintText: 'Option',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.green),
            onPressed: () {
              if (_optionControllers.length > 2) {
                setState(() {
                  _optionControllers.remove(controller);
                });
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.green),
            onPressed: () {
              setState(() {
                _optionControllers.add(TextEditingController());
              });
            },
          ),
        ],
      ),
    );
  }
}