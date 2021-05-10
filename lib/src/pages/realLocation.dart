import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RealtimeMapScrren extends StatefulWidget{
  @override
  _RealtimeMapScrrenState createState() => _RealtimeMapScrrenState();
}

class _RealtimeMapScrrenState extends State<RealtimeMapScrren> {

  Completer<GoogleMapController> _controller = Completer();

  List<Marker> markers = [];

  @override
  void initState() {

    super.initState();

    FirebaseFirestore.instance.collection('users').snapshots().listen((event){

      event.docChanges.forEach((change){

        setState(() {

          markers.add(

              Marker(
                  markerId: MarkerId(change.doc.id),
                  infoWindow: InfoWindow(
                      title: change.doc.get('name').toString()
                  ),
                  position: LatLng(change.doc.get('location').latitude,change.doc.get('location').longitude)
              )

          );

        });

      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime Map'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(38.9637, 35.2433),
          zoom: 10,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers:markers.toSet(),
      ),
    );
  }
}