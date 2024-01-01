import 'package:taxi_app_user/service/network.dart';

class AuthRepo {
  EitherResponse getUserData() async => await Api.getApi("");
}

class Userdate {
  getuserdata() async {
    final datas = await AuthRepo().getUserData();
    datas.fold((left) {

     
    }, (right) => null);
  }
}
