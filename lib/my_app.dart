import 'package:flutter/material.dart';
import 'package:marvel_app/screens/home/home_page.dart';

import 'package:marvel_app/modules/app_module.dart';
import 'main_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: AppModule.to.bloc<MainBloc>().theme,
      initialData: false,
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Marvel App',
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness: snapshot.data ? Brightness.dark : Brightness.light,
          ),
          home: HomePage(),
        );
      },
    );
  }
}
