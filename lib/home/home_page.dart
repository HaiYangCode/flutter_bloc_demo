import 'package:flutter/material.dart';
import 'package:lm_bloc_architecture/base_state.dart';
import 'package:lm_bloc_architecture/home/bloc/home_bloc.dart';
import 'package:lm_bloc_architecture/home/bloc/home_event.dart';
import 'package:lm_bloc_architecture/home/bloc/home_state.dart';
import 'package:lm_bloc_architecture/home/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseBlocState<HomePage, HomeBloc> {
  @override
  Widget buildView(BuildContext context) {
    // TODO: implement buildView
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试标题内容"),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state is LoginResult) {
          print("这里收到了一个从逻辑发送过来的事件 == ${state.result}");
        }
      }, builder: (context, state) {
        return FloatingActionButton(onPressed: () {
          /// 发送一个事件到逻辑层，并把参数带进去
          print("第一步：发送一个事件到逻辑层");
          context.read<HomeBloc>().add(LoginEvent("account", "pwd"));
        });
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        /// 发送一个事件到逻辑层，并把参数带进去
        print("第一步：发送一个事件到逻辑层");
        context.read<HomeBloc>().add(LoginEvent("account", "pwd"));
      }),
    );
  }

  @override
  HomeBloc createBloc() {
    return HomeBloc(const HomeRepository());
  }
}
