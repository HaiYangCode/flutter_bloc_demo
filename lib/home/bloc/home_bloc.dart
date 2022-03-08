import 'package:bloc/bloc.dart';
import 'package:lm_bloc_architecture/home/bloc/home_event.dart';
import 'package:lm_bloc_architecture/home/bloc/home_state.dart';
import 'package:lm_bloc_architecture/home/repository/home_repository.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    print("这里是监听事件类型");
    on<LoginEvent>((event, emit) async {
      print("接收到的ui中传过来的数据 账号 == ${event.account}  pwd=== ${event.pwd}");

      var res = await homeRepository.login(event.account, event.pwd);

      ///TODO 处理登录的逻辑

      emit(LoginResult("这是逻辑层处理的结果"));
      print("这里是逻辑层发送一个状态到界面中");
    });
  }
}
