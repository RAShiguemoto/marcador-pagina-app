import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:marca_pagina_app/app/controller/livro_controller.dart';
import 'package:marca_pagina_app/app/repository/livro_repository.dart';

import '../model/livro_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var livroController = GetIt.I.get<LivroController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Marcador de Páginas'),
        backgroundColor: Color(0xff161b22),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder(
              future: LivroRepository().find(),
              builder: (context, futuro) {
                if (futuro.hasData) {
                  List<Livro> livros = futuro.data as List<Livro>;
                  return ListView.builder(
                    itemCount: livros.length,
                    itemBuilder: (context, index) {
                      Livro livro = livros[index];
                      return Card(
                        color: Color(0xff161b22),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.network('${livro.urlImagem}'),
                            title: Text(
                              '${livro.nome}',
                              style: TextStyle(
                                  color: Color.fromARGB(202, 255, 255, 255),
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                                'Capítulo: ${livro.capitulo} / Página: ${livro.pagina}',
                                style: TextStyle(
                                    color: Color.fromARGB(202, 255, 255, 255))),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Scaffold();
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => livroController.novoCadastro(context)),
        backgroundColor: Color(0xff161b22),
        child: const Icon(Icons.add),
      ),
    );
  }
}
