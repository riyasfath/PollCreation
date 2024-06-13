//
import 'package:cloud_firestore/cloud_firestore.dart';

class PollService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _pollsCollection = FirebaseFirestore.instance.collection('polls');


  Future<void> createPOll(String question, List<String> options) async {}
}