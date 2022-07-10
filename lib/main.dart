import 'package:dms_app/UI/view/login_screen/login_screen.dart';
import 'package:dms_app/network/dio_helper.dart';
import 'package:dms_app/view_model/donor_cupit/donor_cupit.dart';
import 'package:dms_app/view_model/donor_cupit/donor_state.dart';
import 'package:dms_app/view_model/user_cubit.dart';
import 'package:dms_app/view_model/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'UI/view/events_screen/add_donor_screen.dart';
import 'UI/view/events_screen/event_screen.dart';
import 'helper/costant/route.dart';
import 'helper/theme/theme.dart';
import 'network/cach_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  DioHelpers.int();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => UserCubit(UserInitialState())),
        BlocProvider(
            create: (BuildContext context) => DonorCubit(InitialDonorState())),
      ],

      child: OKToast(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.data,
          builder: (context, widget) {
            return ResponsiveWrapper.builder(
                Directionality(
                    textDirection: TextDirection.rtl,
                    child: widget ?? Container()),
                maxWidth: 1200,
                minWidth: 480,
                defaultScale: true,
                breakpoints: [
                  ResponsiveBreakpoint.resize(480, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ],
                background: Container(color: Color(0xFFF5F5F5)));
          },
          onGenerateRoute: RouteGenerator.generateRoute,
           //home: EventScreen(),
           home: LoginScreen(),
           //home: AddDonorScreen(donorId: '',),
        ),
      ),
    );
  }
}