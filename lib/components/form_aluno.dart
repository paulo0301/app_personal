import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FormAluno extends StatefulWidget {
  Function(String, String, DateTime, File?) onSubmit;

  FormAluno(this.onSubmit);

  @override
  State<FormAluno> createState() => _FormAlunoState();
}

class _FormAlunoState extends State<FormAluno> {
  //final AssetImage imageDefault = AssetImage("assets/man.png");
  final ImagePicker picker = ImagePicker();
  File? image;

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime _dataNascimentoSelecionada = DateTime.now();

  _getPhoto(ImageSource source) async {
    final XFile? imageFile = await picker.pickImage(source: source);

    if (imageFile != null) {
      setState(() {
        image = File(imageFile.path);
      });
    }
  }

  _submitForm() {
    if (_nomeController.text.isEmpty || _emailController.text.isEmpty) return;

    widget.onSubmit(_nomeController.text, _emailController.text,
        _dataNascimentoSelecionada, image);
    Navigator.of(context).pop();
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: _dataNascimentoSelecionada,
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dataNascimentoSelecionada = pickedDate;
      });
    });
  }

  _openModalPhoto(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 250,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.image),
                        title: Text("Galeria"),
                        onTap: () {
                          Navigator.of(context).pop();
                          _getPhoto(ImageSource.gallery);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.camera_alt_outlined),
                        title: Text("Câmera"),
                        onTap: () {
                          Navigator.of(context).pop();
                          _getPhoto(ImageSource.camera);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.delete),
                        title: Text("Deletar foto"),
                        onTap: () {
                          Navigator.of(context).pop();
                          setState(() {
                            image = null;
                          });
                        },
                      ),
                    ],
                  )),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.grey[300],
                  child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.grey[200],
                      backgroundImage:
                          image != null ? FileImage(image!) : null)),
              Positioned(
                  bottom: 5,
                  right: 3,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.red,
                        size: 25,
                      ),
                      onPressed: () {
                        _openModalPhoto(context);
                      },
                    ),
                  ))
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Nome: ",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _nomeController,
                  decoration:
                      InputDecoration(contentPadding: EdgeInsets.all(0)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Email: ",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      InputDecoration(contentPadding: EdgeInsets.all(0)),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                      'Data de nascimento: ${DateFormat('dd/MM/y').format(_dataNascimentoSelecionada)}',
                      style: TextStyle(fontSize: 15)),
                ),
                TextButton(
                    onPressed: _showDatePicker, child: Text('Selecionar'))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _submitForm,
              child: Text('Cadastrar aluno'),
            ),
          )
        ],
      ),
    );
  }
}
