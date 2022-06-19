import 'package:get_it/get_it.dart';
import 'package:marca_pagina_app/app/controller/livro_controller.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<LivroController>(LivroController());
}
