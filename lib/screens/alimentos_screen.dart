import 'package:app_personal/components/form_alimento.dart';
import 'package:app_personal/components/main_drawer.dart';
import 'package:app_personal/models/alimento.store.dart';
import 'package:app_personal/models/alimento_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AlimentosPage extends StatelessWidget {
  AlimentosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Alimentos = Provider.of<AlimentoModelX>(context);

    List<AlimentoItem> lst_alimentos = Alimentos.getItens;

    _createAlimentoCard(AlimentoItem item) {
      return Card(
        child: ListTile(
          leading: Image.network(
              item.imagem ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzW6MEZy8fRsFgKEIipJmAByMyknqDTI3_9Q&s',
              errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.restaurant);
          }),
          title: Text(item.nome),
          subtitle: Row(
            children: [
              Text(item.categoria),
              SizedBox(width: 45),
              Text('${item.calorias.toString()} KCAL')
            ],
          ),
          trailing: Text("${item.peso} G"),
        ),
      );
    }

    _addAlimento(
        String nome, String categoria, int calorias, int peso, String image) {
      Alimentos.add(AlimentoItem(
          nome: nome, categoria: categoria, calorias: calorias, peso: peso));
      Navigator.pop(context);
    }

    _openFormModal(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return FormAlimento(_addAlimento);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alimentos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF085444),
      ),
      body: Expanded(
        child: Observer(
          builder: (context) => ListView.builder(
              itemCount: lst_alimentos.length,
              itemBuilder: (item, index) {
                return _createAlimentoCard(lst_alimentos[index]);
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
