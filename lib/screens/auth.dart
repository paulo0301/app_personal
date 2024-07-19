import 'package:app_personal/services/local_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final ValueNotifier<bool> isLocalAuthFailed = ValueNotifier(false);

  @override
  void initState(){
    super.initState();
    checkLocalAuth();
  }

  checkLocalAuth() async{
    final auth = context.read<LocalAuthService>();
    final isLocalAuth = await auth.isSuported();
    isLocalAuthFailed.value = false;

    if(isLocalAuth){
      print("Disponivel para biometria");
      final authenticated = await auth.autheticate('Desbloqueie seu celular');

      if(!authenticated){
        print("Autenticação falhou");
        isLocalAuthFailed.value = true;
      }else{
        Navigator.of(context).pushNamed('/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ValueListenableBuilder<bool>(
        valueListenable: isLocalAuthFailed,
        builder: (context, failed, _){
          if(failed){
            return Center(
              child: ElevatedButton(
                onPressed: (){checkLocalAuth();},
                child: Text("Tentar autenticar novamente"),
              ),
            );
          }
          return Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}