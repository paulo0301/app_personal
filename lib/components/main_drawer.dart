import 'package:app_personal/utils/app_routes.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 88,
            width: double.infinity,
            padding: EdgeInsets.all(40),
            color: const Color.fromARGB(255, 14, 53, 15),
            alignment: Alignment.bottomRight,
          ),
          _createItem(Icons.person_2, 'Alunos',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
          _createItem(
              Icons.settings,
              'Exercícios',
              () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.EXERCICIOS))
        ],
      ),
    );
  }
}
