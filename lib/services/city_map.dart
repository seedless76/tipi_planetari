import 'package:dominanti_planetarie/graphic/graphic_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class BirthCityWidget extends StatefulWidget {
  @override
  _BirthCityWidgetState createState() => _BirthCityWidgetState();
}

class _BirthCityWidgetState extends State<BirthCityWidget> {
  final LatLng _initialPosition = LatLng(0.0, 0.0);
  GoogleMapController _controller;
  final MarkerId _markerID = MarkerId('1');
  Map<MarkerId, Marker> markersMap = Map();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleziona la tua città natale'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _initialPosition),
        markers: Set.of(markersMap.values),
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
            markersMap[_markerID] = Marker(markerId: _markerID, position: _initialPosition);
          });
        },
        onTap: (coordinate) {
          setState(() {
            _controller.animateCamera(CameraUpdate.newLatLng(coordinate));
            markersMap[_markerID] = Marker(markerId: _markerID, position: coordinate);
          });
          print('Latitudine del marker:');
          print(markersMap[_markerID].position.latitude.toString());
          print('Longitudine del marker: ');
          print(markersMap[_markerID].position.longitude.toString());
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: FlatButton(
          onPressed: () {
            Navigator.pop(context, markersMap[_markerID].position);
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: kMainColor),
            height: 50,
            width: 150,
            child: Center(child: Text('Seleziona')),
          ),
        ),
      ),
    );
  }
}
