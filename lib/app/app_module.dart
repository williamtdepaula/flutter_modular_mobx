import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/app/app_widget.dart';
import 'package:modular_app/app/modules/home/home_module.dart';
import 'package:modular_app/app/shared/utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => Dio(BaseOptions(baseUrl: url_base)),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: HomeModule()),
      ];
}
