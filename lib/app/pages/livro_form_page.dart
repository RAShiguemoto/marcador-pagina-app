import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:marca_pagina_app/app/controller/livro_controller.dart';

class LivroFormPage extends StatefulWidget {
  const LivroFormPage({Key? key}) : super(key: key);

  @override
  State<LivroFormPage> createState() => _LivroFormPageState();
}

class _LivroFormPageState extends State<LivroFormPage> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var livroController = GetIt.I.get<LivroController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Cadastro'),
        backgroundColor: Color(0xff161b22),
        actions: [
          IconButton(
              onPressed: () {
                _form.currentState?.save();
                livroController.save(context);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: livroController.livro.nome,
                  onSaved: (newValue) => livroController.livro.nome = newValue!,
                  decoration: InputDecoration(
                    labelText: 'Nome da obra:',
                    hintText: 'Informe um nome.',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: livroController.livro.capitulo,
                  onSaved: (newValue) =>
                      livroController.livro.capitulo = newValue!,
                  decoration: InputDecoration(
                    labelText: 'Capítulo:',
                    hintText: 'Informe o nome ou número do capítulo.',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: livroController.livro.pagina,
                  onSaved: (newValue) =>
                      livroController.livro.pagina = newValue!,
                  decoration: InputDecoration(
                    labelText: 'Página:',
                    hintText: 'Informe o nº da página.',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: livroController.livro.urlImagem,
                  onSaved: (newValue) =>
                      livroController.livro.urlImagem = newValue!,
                  decoration: InputDecoration(
                    labelText: 'URL Imagem:',
                    hintText: 'Informe o endereço da imagem.',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )),
    );
  }
}
