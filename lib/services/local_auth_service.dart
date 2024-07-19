import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService extends ChangeNotifier{
  final LocalAuthentication auth;

  LocalAuthService({required this.auth});

  //is device suport biometric auth
  Future<bool> isSuported() async{
    //bool: pode checar biometria
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    //pode checar biometria ou o dispositivo é suporteado biometria
    return canAuthenticateWithBiometrics || await auth.isDeviceSupported();
  }

  //
  Future<bool> autheticate(String message) async{
    return await auth.authenticate(localizedReason:message);
  }
}