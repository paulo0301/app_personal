import 'package:app_personal/components/form_suplemento.dart';
import 'package:app_personal/components/main_drawer.dart';
import 'package:app_personal/models/suplemento.store.dart';
import 'package:app_personal/models/suplemento_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SuplementosPage extends StatelessWidget {
  const SuplementosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Suplementos = Provider.of<SuplementoModelX>(context);

    List<SuplementoItem> lst_suplementos = Suplementos.getItens;

    _createSuplementoCard(SuplementoItem item) {
      return Card(
        child: ListTile(
          leading: Image.network(
            item.imagem ??
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzW6MEZy8fRsFgKEIipJmAByMyknqDTI3_9Q&s',
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzW6MEZy8fRsFgKEIipJmAByMyknqDTI3_9Q&s');
            },
          ),
          title: Text(item.nome),
          subtitle: Text(item.marca),
          trailing: Text("${item.peso} G"),
        ),
      );
    }

    _addSuplemento(String nome, String marca, int peso, String image) {
      Suplementos.add(
          SuplementoItem(nome: nome, marca: marca, peso: peso, imagem: image));
      Navigator.pop(context);
    }

    _openFormModal(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return FormSuplemento(_addSuplemento);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Suplementos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF085444),
      ),
      body: Expanded(
        child: Observer(
          builder: (context) => ListView.builder(
              itemCount: lst_suplementos.length,
              itemBuilder: (item, index) {
                return _createSuplementoCard(lst_suplementos[index]);
              }),
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_openFormModal(context)},
        child: Icon(Icons.add),
      ),
    );
  }
}
