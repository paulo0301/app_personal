import 'package:flutter/material.dart';
import 'package:app_personal/controller/AcademiasController.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../components/main_drawer.dart';

final appKey = GlobalKey();

class AcademiasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: AppBar(
        title: const Text(
          "Academias próximas",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF085444),
      ),
      drawer: MainDrawer(),
      body: ChangeNotifierProvider<AcademiasController>(
        create: (context) => AcademiasController(),
        child: Builder(builder: (context) {
          final local = context.watch<AcademiasController>();

          String mensagem = local.erro == ''
              ? 'Latitude: ${local.lat} | Longitude: ${local.long}'
              : local.erro;

          print(local.lat);
          print(local.long);

          CameraPosition _kGooglePlex(double lat, double long) {
            return CameraPosition(
              target: LatLng(lat, long),
              zoom: 14.4746,
            );
          }

          return GoogleMap(
            initialCameraPosition: _kGooglePlex(local.lat, local.long),
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            onMapCreated: local.onMapCreated,
            markers: local.markers,
            // initialCameraPosition: CameraPosition(
            //   target: LatLng(local.lat, local.long),
            //   zoom: 18,
            // ),
          );
        }),
      ),
    );
  }
}
