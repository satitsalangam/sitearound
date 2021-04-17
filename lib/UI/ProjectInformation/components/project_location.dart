import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitearound/API/client.dart';
import 'package:sitearound/API/endpoints.dart';
import 'package:sitearound/Models/project_location.dart';
import 'package:sitearound/ulility/text_style.dart';

class ProjectLocation extends StatefulWidget {
  @override
  _ProjectLocationState createState() => _ProjectLocationState();
}

class _ProjectLocationState extends State<ProjectLocation> {
  EndPoints endpoints = EndPoints();
  SharedPreferences prefs;
  Future<Location> getlocation() async {
    prefs = await SharedPreferences.getInstance();
    CustomClient client = CustomClient();
    var result = await client.get(
      endpoints.projectDetailByNameURL.replaceAll(
        ':project_name',
        prefs.getString('project_name'),
      ),
    );
    var decoded = utf8.decode(result.bodyBytes);
    Location location = locationFromJson(decoded);
    print('dynamic>>>>>${result.body}');
    print('decoded>>>>>$decoded');
    print(result);
    return location;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: FutureBuilder<Location>(
          future: getlocation(),
          builder: (context, AsyncSnapshot<Location> snapshot) {
            if (snapshot.hasError) {
              print('hasError${snapshot.hasError}');
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    showMap(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            'Location',
                            style: bl22Style,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    showBoxText(
                        size, snapshot, 'Country', '${snapshot.data.country}'),
                    Divider(
                      thickness: 1,
                    ),
                    showBoxText(size, snapshot, 'Time zone',
                        '${snapshot.data.timeZone}'),
                    Divider(
                      thickness: 1,
                    ),
                    showBoxText(
                        size, snapshot, 'Address', '${snapshot.data.address}'),
                    Divider(
                      thickness: 1,
                    ),
                    showBoxText(
                        size, snapshot, 'City', '${snapshot.data.city}'),
                    Divider(
                      thickness: 1,
                    ),
                    showBoxText(
                        size, snapshot, 'Province', '${snapshot.data.state}'),
                    Divider(
                      thickness: 1,
                    ),
                    showBoxText(
                        size, snapshot, 'PostCode', '${snapshot.data.code}'),
                    Divider(
                      thickness: 1,
                    ),
                    showBoxText(
                        size, snapshot, 'PostCode', '${snapshot.data.phone}'),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Set<Marker> myMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId('location'),
          position: LatLng(13.811438420586938, 100.56469305119386),
          infoWindow: InfoWindow(title: 'ตำแหน่งบริษัท')),
    ].toSet();
  }

  Widget showMap() {
    LatLng latLng = LatLng(13.811438420586938, 100.56469305119386);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 16.0);
    return Container(
      height: 300.0,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: myMarker(),
      ),
    );
  }

  Widget showBoxText(
      Size size, AsyncSnapshot<Location> snapshot, title, detail) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: size.width * 0.37,
              child: Text(
                title,
                style: bl14Style,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text(':'),
          ),
          Container(
            width: size.width * 0.5,
            child: Text(
              detail,
              overflow: TextOverflow.ellipsis,
              style: bl14Style,
            ),
          ),
        ],
      ),
    );
  }
}
 