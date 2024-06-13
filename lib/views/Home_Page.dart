import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pollapk/views/components/my_drawer.dart';

import '../controllers/home_controller.dart';
import '../models/poll_item_model.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        title: const Text(
          'POLLING APP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green),
            ),
          ),
        ],
      ),
      // drawer: _buidDrawer(context),
      drawer: MyDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.showCreatePollPopup(context);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Colors.white),
              ),
              padding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
            ),
            child: const Text(
              'CREATE POLL',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: Obx(
                  () => Padding(
                padding: const EdgeInsets.all(20.0),
                child: controller.polls.isEmpty
                    ? const Center(
                    child: Text('No polls created',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold)))
                    : ListView.builder(
                  itemCount: controller.polls.length,
                  itemBuilder: (context, index) {
                    final reversedIndex =
                        controller.polls.length - 1 - index;
                    return _buildPollCard(controller.polls[reversedIndex],
                        context, reversedIndex);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPollCard(
      PollItem pollItem, BuildContext context, int pollIndex) {
    return SizedBox(
      child: Card(
        color: Colors.white.withOpacity(0.9),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      pollItem.question,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Column(
                    children: pollItem.options.map((option) {
                      return Obx(() {
                        final isSelected =
                            controller.selectedOption.value == option;
                        return GestureDetector(
                          onTap: () {
                            controller.voteForOption(option, pollIndex);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.green
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isSelected
                                        ? Colors.green
                                        : Colors.transparent,
                                    border: Border.all(color: Colors.green),
                                  ),
                                  child: isSelected
                                      ? const Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                      : null,
                                ),
                                Text(
                                  option,
                                  style: const TextStyle(color: Colors.green),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        );
                      });
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.viewVotes(pollIndex);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 90),
                        ),
                        child: const Text(
                          'View Votes',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Delete icon positioned in top right corner
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.green),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirm Delete'),
                          content: const Text(
                              'Are you sure you want to delete this poll?'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  controller.deletePoll(pollIndex);
                                },
                                child: const Text('Delete'))
                          ],
                        );
                      });
                  // Call your controller method to delete the poll at pollIndex
                  // controller.deletePoll(pollIndex);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
