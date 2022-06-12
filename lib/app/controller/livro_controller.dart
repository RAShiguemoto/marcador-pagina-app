import 'package:marca_pagina_app/app/model/livro_model.dart';
import 'package:marca_pagina_app/app/repository/livro_repository.dart';

class LivroController {
  inserirNovosLivros() {
    Livro livro1 = Livro();
    livro1.nome = 'BOKU NO HERO ACADEMIA';
    livro1.capitulo = '1';
    livro1.pagina = '1';
    LivroRepository().save(livro1);

    Livro livro2 = Livro();
    livro2.nome = 'NARUTO';
    livro2.capitulo = '1';
    livro2.pagina = '1';
    LivroRepository().save(livro2);

    Livro livro3 = Livro();
    livro3.nome = 'ONE PIECE';
    livro3.capitulo = '1';
    livro3.pagina = '1';
    LivroRepository().save(livro3);
  }
}
