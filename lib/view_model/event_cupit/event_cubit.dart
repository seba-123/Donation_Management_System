import 'package:dms_app/UI/view/events_screen/Donor_data.dart';
import 'package:dms_app/UI/view/events_screen/add_donor_screen.dart';
import 'package:dms_app/model/donor_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

import '../../model/event_model.dart';
import '../../network/dio_helper.dart';
import 'event_state.dart';


class EventCubit extends Cubit<EventState>{
  EventCubit(EventState initialState) : super(InitialEventState());


 static  EventCubit get(context)=>BlocProvider.of(context);
  DonorDatoModel ?donorDateModel;
  EventsModel ? eventsModel;
  fetchEvent(){
    emit(LoadingEventState());



    DioHelpers.getData(url: "events").then((value) {
      print(value.data.toString());

      eventsModel=EventsModel.fromJson(value.data);
emit(LoadedEventState());
    });

  }
  checkIfDonorExist(context,String donorId,events){
    emit(LoadingEventState());
    DioHelpers.getData(url: "donor/$donorId").then((value) {
      // eventsModel=EventsModel.fromJson(value.data);
      // showToast("الرقم المدني متواجد",position: ToastPosition.bottom);
      donorDateModel=DonorDatoModel.fromJson(value.data);

      Navigator.push(context, MaterialPageRoute(builder: (c){
        return donorData(donorDatoModel: donorDateModel,eventsModel: events,);
      }));
      print(value);
      emit(LoadedEventState());
    }).catchError((e){
      Navigator.push(context, MaterialPageRoute(builder: (c){
        return AddDonorScreen(eventsModel: events,donorId: donorId );
      }));
      showToast("الرجاء تسجيل بياناتك كمتبرع اولا",position: ToastPosition.bottom,duration: Duration(seconds: 4));

      emit(LoadedEventState());

    });
  }

  
}