import 'package:dms_app/helper/reusaple_componant/custom_text_fiked.dart';
import 'package:dms_app/helper/theme/app_colors.dart';
import 'package:dms_app/model/event_model.dart';
import 'package:dms_app/view_model/event_cupit/event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/costant/constant.dart';
import '../../../helper/reusaple_componant/custom_button.dart';
import '../../../model/route_argument.dart';
import '../../../view_model/event_cupit/event_state.dart';

class CheckEventScreen extends StatelessWidget {
  static const route = "CheckEventScreen";
  final EventItems? event;

  CheckEventScreen({Key? key, this.event}) : super(key: key);
  TextEditingController userId = TextEditingController();
  final fomKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(event?.eventArName.toString() ?? "");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.colorLightGray,
      appBar: AppBar(title: Text("التاكد من بيانات المتبرع")),
      body: Form(
        key: fomKey,
        child: BlocProvider(
          create: (context) => EventCubit(InitialEventState()),
          child: BlocConsumer<EventCubit, EventState>(
            builder: (context, state) {
              return state is LoadingEventState
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: size.width / 2,
                            child: Image.asset(
                              'assest/image/d.png',
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
                                      "التبرع لصالح حمله : " +
                                          event!.eventArName,
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.headline3!,
                                    ),
                                  ),
                                  CustomTextForm1(
                                    label: "الرقم القومي للمتبرع",
                                    controller: userId,
                                    valid: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'يرجي ادخال الرقم القومي';
                                      }
                                      return null;
                                    },
                                  ),
                                  addHorizontalSpace(w: 10),
                                  customElevatedButtonWithIcon(
                                    context,
                                    function: () {
                                      if (fomKey.currentState!.validate()) {
                                        EventCubit.get(context)
                                            .checkIfDonorExist(
                                                context, userId.text, event);
                                      }
                                    },
                                    title: 'التالي',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ));

              // Column(
              //         children: [
              //           Image.asset(
              //             'assest/image/logo.png',
              //             height: 250,
              //           ),
              //           Card(
              //             child: Column(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Row(
              //                     children: [
              //                       Text("التبرع لصالح حمله : "),
              //                       Text(event!.eventArName),
              //                     ],
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: CustomTextForm1(
              //                     label: "الرقم القومي للمتبرع",
              //                     controller: userId,
              //                     valid: (value) {
              //                       if (value == null || value.isEmpty) {
              //                         return 'يرجي ادخال الرقم القومي';
              //                       }
              //                       return null;
              //                     },
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(20.0),
              //                   child: customElevatedButtonWithIcon(
              //                     context,
              //                     function: () {
              //                       if (fomKey.currentState!.validate()) {
              //                         EventCubit.get(context).checkIfDonorExist(
              //                             context, userId.text, event);
              //                       }
              //                     },
              //                     title: 'التالي',
              //                   ),
              //                 )
              //               ],
              //             ),
              //           )
              //         ],
              //       );
            },
            listener: (BuildContext context, Object? state) {},
          ),
        ),
      ),
    );
  }
}
