import 'package:airplane_bwa/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  final CollectionReference _destinationRef =
      FirebaseFirestore.instance.collection("destinations");

  Future<List<DestinationModel>> fetchDestintations() async {
    try {
      QuerySnapshot result = await _destinationRef.get();

      List<DestinationModel> destinations = result.docs.map((e) {
        return DestinationModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return destinations;
    } catch (e) {
      rethrow;
    }
  }
}
