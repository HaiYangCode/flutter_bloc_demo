import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBlocState<T extends StatefulWidget,
        LMBloc extends Bloc<dynamic, dynamic>> extends State<T>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LMBloc>(
      create: (context) => createBloc(),
      child: buildView(context),
    );
  }

  LMBloc createBloc();

  Widget buildView(BuildContext context);
}
