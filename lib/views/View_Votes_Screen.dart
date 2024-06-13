  // // import 'package:flutter/material.dart';
  // //
  // // import '../models/poll_item_model.dart';
  // //
  // // class ViewVotesPage extends StatelessWidget {
  // //   final PollItem poll;
  // //
  // //   const ViewVotesPage(this.poll);
  // //
  // //   @override
  // //   Widget build(BuildContext context) {
  // //     return Scaffold(
  // //       backgroundColor:  Colors.white,
  // //       appBar: AppBar(
  // //         backgroundColor:  Colors.green,
  // //         shape: RoundedRectangleBorder(
  // //           borderRadius: BorderRadius.only(
  // //             bottomLeft: Radius.circular(25),
  // //             bottomRight: Radius.circular(25)
  // //           )
  // //
  // //         ),
  // //         centerTitle: true,
  // //         leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
  // //         title: const Text(
  // //           'VIEW VOTES',
  // //           // Dynamic title based on first option (null check)
  // //           style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
  // //         ),
  // //         actions: [
  // //           Container(
  // //             margin: const EdgeInsets.all(10),
  // //             decoration: BoxDecoration(
  // //               shape: BoxShape.circle,
  // //               border: Border.all(color:  Colors.white),
  // //             ),
  // //
  // //           ),
  // //         ],
  // //       ),
  // //       body: SingleChildScrollView(
  // //         child: Column(
  // //           crossAxisAlignment: CrossAxisAlignment.start,
  // //           children: [
  // //             const Padding(
  // //               padding: EdgeInsets.all(12.0),
  // //               child: Text(
  // //                 'Result',
  // //                 style: TextStyle(
  // //                   color: Colors.green,
  // //                   fontSize: 24,
  // //                   fontWeight: FontWeight.bold,
  // //                 ),
  // //               ),
  // //             ),
  // //             _buildOptionList(poll.options[0], poll.votes[poll.options[0]], context),
  // //             if (poll.options.length > 1) // Check if there's a second option before building its list
  // //               _buildOptionList(poll.options[1], poll.votes[poll.options[1]], context),
  // //             if (poll.options.length > 2) // Check if there's a third option before building its list
  // //               _buildOptionList(poll.options[2], poll.votes[poll.options[2]], context),
  // //           ],
  // //         ),
  // //       ),
  // //     );
  // //   }
  // //
  // //   Widget _buildOptionList(String optionTitle, int? votes, BuildContext context) {
  // //     final voteCount = votes ?? 0; // Using null-aware operator to provide a default value of 0 if votes is null
  // //     return Container(
  // //       width: double.infinity,
  // //       margin: const EdgeInsets.all(18.0),
  // //       padding: const EdgeInsets.all(8.0),
  // //       decoration: BoxDecoration(
  // //         color: Colors.green.withOpacity(0.9),
  // //         borderRadius: BorderRadius.circular(8.0),
  // //       ),
  // //       child: Column(
  // //         crossAxisAlignment: CrossAxisAlignment.start,
  // //         children: [
  // //           Container(
  // //             width: double.infinity,
  // //             decoration: const BoxDecoration(
  // //               border: Border(
  // //                 bottom: BorderSide(color: Colors.white, width: 1),
  // //               ),
  // //             ),
  // //             child: Padding(
  // //               padding: const EdgeInsets.symmetric(vertical: 8.0),
  // //               child: Text(
  // //                 optionTitle,
  // //                 style: const TextStyle(
  // //                   color: Colors.white,
  // //                   fontSize: 18,
  // //                   fontWeight: FontWeight.bold,
  // //                 ),
  // //                 textAlign: TextAlign.start,
  // //               ),
  // //             ),
  // //           ),
  // //           Padding(
  // //             padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
  // //             child: Text(
  // //               'Votes: $voteCount', // Using the non-nullable voteCount variable
  // //               style: const TextStyle(
  // //                 color: Colors.white,
  // //                 fontWeight: FontWeight.bold
  // //               ),
  // //               textAlign: TextAlign.start,
  // //             ),
  // //           ),
  // //         ],
  // //       ),
  // //     );
  // //   }
  // // }
  // import 'package:flutter/material.dart';
  // import '../models/poll_item_model.dart';
  //
  // class ViewVotesPage extends StatelessWidget {
  //   final PollItem poll;
  //
  //   const ViewVotesPage(this.poll);
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       backgroundColor: Colors.white,
  //       appBar: AppBar(
  //         backgroundColor: Colors.green,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //             bottomLeft: Radius.circular(25),
  //             bottomRight: Radius.circular(25),
  //           ),
  //         ),
  //         centerTitle: true,
  //         leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
  //         title: Text(
  //           'VIEW VOTES',
  //           // Dynamic title based on first option (null check)
  //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //         ),
  //         actions: [
  //           Container(
  //             margin: const EdgeInsets.all(10),
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               border: Border.all(color: Colors.white),
  //             ),
  //             // child: const CircleAvatar(
  //             //   backgroundColor: Colors.white,
  //             //   child: Text(
  //             //     'R',
  //             //     style: TextStyle(
  //             //       color: Colors.green,
  //             //       fontSize: 20,
  //             //     ),
  //             //   ),
  //             // ),
  //           ),
  //         ],
  //       ),
  //       body: SingleChildScrollView(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             const Padding(
  //               padding: EdgeInsets.all(12.0),
  //               child: Text(
  //                 'Result',
  //                 style: TextStyle(
  //                   color: Colors.green,
  //                   fontSize: 24,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //             _buildOptionList(
  //                 poll.options[0], poll.votes[poll.options[0]], context),
  //             if (poll.options.length >
  //                 1) // Check if there's a second option before building its list
  //               _buildOptionList(
  //                   poll.options[1], poll.votes[poll.options[1]], context),
  //             if (poll.options.length >
  //                 2) // Check if there's a third option before building its list
  //               _buildOptionList(
  //                   poll.options[2], poll.votes[poll.options[2]], context),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  //
  //   Widget _buildOptionList(
  //       String optionTitle, int? votes, BuildContext context) {
  //     final voteCount = votes ??
  //         0; // Using null-aware operator to provide a default value of 0 if votes is null
  //     return Container(
  //       width: double.infinity,
  //       margin: const EdgeInsets.all(18.0),
  //       padding: const EdgeInsets.all(8.0),
  //       decoration: BoxDecoration(
  //         color: Colors.green.withOpacity(0.9),
  //         borderRadius: BorderRadius.circular(8.0),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             width: double.infinity,
  //             decoration: const BoxDecoration(
  //               border: Border(
  //                 bottom: BorderSide(color: Colors.white, width: 1),
  //               ),
  //             ),
  //             child: Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 8.0),
  //               child: Text(
  //                 optionTitle,
  //                 style: const TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //                 textAlign: TextAlign.start,
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding:
  //                 const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
  //             child: Text(
  //               'Votes: $voteCount', // Using the non-nullable voteCount variable
  //               style: const TextStyle(
  //                   color: Colors.white, fontWeight: FontWeight.bold),
  //               textAlign: TextAlign.start,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
  import 'package:flutter/material.dart';

  import '../models/poll_item_model.dart';


  class ViewVotesPage extends StatelessWidget {
    final PollItem poll;

    const ViewVotesPage(this.poll);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'VIEW VOTES',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Result',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: poll.options.length,
                itemBuilder: (context, index) {
                  final option = poll.options[index];
                  final votes = poll.votes[option] ?? 0;
                  return _buildOptionList(option, votes);
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildOptionList(String optionTitle, int votes) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(18.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  optionTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              child: Text(
                'Votes: $votes',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      );
    }
  }