import 'package:dms_app/model/route_argument.dart';
import 'package:dms_app/view_model/event_cupit/event_cubit.dart';
import 'package:dms_app/view_model/event_cupit/event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_event_screen.dart';

class EventScreen extends StatelessWidget {
  static const route = "EventScreen";

  const EventScreen({Key? key}) : super(key: key);

  Widget _getItemImageByType(int? type) {
    switch(type) {
      case 11:
        return Image.asset('assest/image/index.png');
      case 3:
        return Image.asset('assest/image/home.png');
      case 6:
        return Image.asset('assest/image/shirt.jpg');
      case 2:
        return Image.asset('assest/image/bag.jpg');
      case 7:
        return Image.asset('assest/image/blanketn.jpg');
      case 4:
        return Image.asset('assest/image/tap.PNG');
      case 1:
        return Image.asset('assest/image/heart.jpg');
      case 12:
        return Image.asset('assest/image/money.jpg');
      default:
        return Image.asset('assest/image/logo.png');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("حملات التبرع")),
      body: BlocProvider(
        create: (context) => EventCubit(InitialEventState())..fetchEvent(),
        child: BlocConsumer<EventCubit, EventState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state is LoadingEventState
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : GridView.builder(
                itemCount:
                EventCubit.get(context).eventsModel?.items.length ??
                    0,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, CheckEventScreen.route,arguments:  RouteArgument(param: {
                    //   "title":EventCubit.get(context).eventsModel?.items[index] ?? ""
                    // ,
                    // }));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) {
                          return CheckEventScreen(
                            event: EventCubit.get(context)
                                .eventsModel
                                ?.items[index],
                          );
                        }));
                  },
                  child: Card(
                    child: Container(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(2), // Border radius
                                  child: ClipOval(
                                    child: _getItemImageByType(EventCubit.get(context)
                                        .eventsModel
                                        ?.items[index]
                                        .evnttypeCode
                                    ),
                                  ),
                                ),
                              ),
                              Text(EventCubit.get(context)
                                  .eventsModel
                                  ?.items[index]
                                  .eventArName ??
                                  ""),
                            ]
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                        ),
                      ),
                    ),
                  ),
                ),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
              );
            }),
      ),
    );
  }
}