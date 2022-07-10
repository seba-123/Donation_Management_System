import 'package:dms_app/UI/view/events_screen/event_screen.dart';
import 'package:dms_app/helper/reusaple_componant/show_toaster.dart';
import 'package:dms_app/view_model/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helper/reusaple_componant/navigator.dart';
import '../network/cach_helper.dart';



class UserCubit extends Cubit<UserState> {
  UserCubit(UserState initialState) : super(UserInitialState());

  get oauth2 => null;

  static UserCubit get(context) =>
      BlocProvider.of<UserCubit>(context, listen: false);
  late String userToken;
  late String userEmail;

////================ --- data =========================/////

  ///===========================--------------- Login Function   ---------------===============================
  userLogin(context, {required email, required password}) {
    String adminEmail = "m.khalefa@dms.com";
    String adminPassword = "mk123456";

    String UserEmail = "m.khalefa@dms.com";
    String UserPassword = "mk123456";

    String ownerEmail = "m.khalefa@dms.com";
    String ownerPassword = "mk123456";
//isUser
//isAdmin
//isOwner
    if (email == adminEmail && password == adminPassword) {
      CacheHelper.saveData(key: "isAdmin", value: "true");
      CacheHelper.removeData(key: "isUser");
      CacheHelper.removeData(key: "isOwner");
      AppNavigator.navigateToName(context, EventScreen.route);
    } else if (email == UserEmail && password == UserPassword) {

      CacheHelper.removeData(key: "isAdmin");
      CacheHelper.saveData(key: "isUser", value: "true");
      CacheHelper.removeData(key: "isOwner");
      AppNavigator.navigateToName(context, EventScreen.route);
    } else if (email == ownerEmail && password == ownerPassword) {
      CacheHelper.removeData(key: "isAdmin");
      CacheHelper.removeData(key: "isUser");
      CacheHelper.saveData(key: "isOwner", value: true);
      AppNavigator.navigateToName(context, EventScreen.route);
    } else {
      showCustomToaster("يرجي التاكد من البريد الالكتروني كلمة المرور");
    }
  }
}

