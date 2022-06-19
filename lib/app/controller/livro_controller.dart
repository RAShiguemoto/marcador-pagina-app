import 'package:flutter/material.dart';
import 'package:marca_pagina_app/app/model/livro_model.dart';
import 'package:marca_pagina_app/app/repository/livro_repository.dart';

class LivroController {
  Livro livro = Livro();

  novoCadastro(BuildContext context) {
    livro = Livro();
    Navigator.of(context).pushReplacementNamed('livro-form-page');
  }

  save(BuildContext context) {
    LivroRepository().save(livro);
    Navigator.of(context).pushReplacementNamed('/');
  }

  editar(BuildContext context, Livro l) {
    livro = l;
    Navigator.of(context).pushReplacementNamed('livro-form-page');
  }
}
