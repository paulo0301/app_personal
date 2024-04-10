import 'package:app_personal/models/aluno.dart';
import 'package:app_personal/screens/avaliacao_screen.dart';
import 'package:app_personal/screens/dados_aluno_screen.dart';
import 'package:app_personal/screens/ficha_treino_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  Aluno aluno;
  Function(Aluno) onDelete;
  Function() onSave;

  TabsScreen(
      {required this.aluno, required this.onDelete, required this.onSave});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _indexSelectedScreen = 0;

  late List<Widget> _screens = [];
  final List<String> _titles = [
    "Ficha de treino",
    "Avaliações físicas",
    "Dados do aluno",
  ];

  _selectScreen(int index) {
    setState(() {
      _indexSelectedScreen = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      FichaTreino(fichaDeTreino: widget.aluno.fichaTreino),
      AvaliacoesFisica(aluno: widget.aluno),
      DadosAluno(
        aluno: widget.aluno,
        onDelete: widget.onDelete,
        onSave: widget.onSave,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_indexSelectedScreen],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 4, 114, 86),
      ),
      body: _screens[_indexSelectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        selectedItemColor: Color.fromARGB(255, 167, 211, 7),
        unselectedItemColor: Colors.white,
        currentIndex: _indexSelectedScreen,
        backgroundColor: Color.fromARGB(255, 4, 114, 86),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.content_paste_rounded),
              label: 'Ficha de treino'),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services_outlined),
              label: 'Avaliação Física'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Dados'),
        ],
      ),
    );
  }
}
