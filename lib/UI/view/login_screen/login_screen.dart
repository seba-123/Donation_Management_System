import 'package:dms_app/view_model/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../helper/costant/constant.dart';
import '../../../helper/costant/reactive_form_const.dart';
import '../../../helper/reusaple_componant/custom_button.dart';
import '../../../helper/reusaple_componant/custom_text_fiked.dart';
import '../../../network/cach_helper.dart';
import '../../../view_model/user_state.dart';





class LoginScreen extends StatefulWidget {
  static const route = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCont = TextEditingController();

  final loginForm = FormGroup(
    {
      ReactiveConst.email:
      FormControl<String>(validators: [Validators.required]),
      ReactiveConst.password: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
    },
  );

  @override
  Widget build(BuildContext context) {
    print( CacheHelper.sharedPreferences.containsKey("isAdmin")||CacheHelper.sharedPreferences.containsKey("isOwner")||CacheHelper.sharedPreferences.containsKey("isUser"));
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: size.height,
                child: ReactiveFormBuilder(
                  form: () => loginForm,
                  builder: (BuildContext context, FormGroup formGroup,
                      Widget? child) =>
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              // color: Colors.black,
                              width: size.width / 2,
                              child: Image.asset(
                                'assest/image/logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: addSymmetricPaddingSpace(
                                    vertical: 20, horizontal: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        "تسجيل الدخول لحسابك",
                                        textAlign: TextAlign.center,
                                        style:
                                        Theme.of(context).textTheme.headline3!,
                                      ),
                                    ),
                                    CustomTextForm(
                                        label: "البريد الالكتروني",
                                        formControlName: ReactiveConst.email),
                                    CustomTextForm(
                                      label: "كلمة المرور",
                                      formControlName: ReactiveConst.password,
                                      obscureText: true,
                                    ),
                                    addHorizontalSpace(w: 10),
                                    customElevatedButtonWithIcon(
                                      context,
                                      function: () {
                                        if (formGroup.valid) {
                                          print(formGroup.value);
                                          BlocProvider.of<UserCubit>(
                                            context,
                                            listen: false,
                                          ).userLogin(
                                            context,
                                            email: formGroup
                                                .value[ReactiveConst.email],
                                            password: formGroup
                                                .value[ReactiveConst.password],
                                          );
                                        } else {
                                          formGroup.markAllAsTouched();
                                        }
                                        // showCustomToaster("Pleas check The data");
                                        // navigateToName(context, SpeakScreen.route);
                                      },
                                      title: 'تسجيل الدخول',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
            ),
          );
        });
  }
}
