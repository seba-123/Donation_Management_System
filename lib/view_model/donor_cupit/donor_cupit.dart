import 'package:dms_app/UI/view/events_screen/event_screen.dart';
import 'package:dms_app/model/country_model.dart';
import 'package:dms_app/model/donor_data_model.dart';
import 'package:dms_app/model/gender_model.dart';
import 'package:dms_app/model/marital_status_model.dart';
import 'package:flutter/material.dart';
import 'package:dms_app/model/bank_branch_model.dart';
import 'package:dms_app/model/bank_model.dart';
import 'package:dms_app/model/org_bank_account.dart';
import 'package:dms_app/model/receive_dept_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import '../../UI/view/events_screen/Donor_data.dart';
import '../../model/govement_model.dart';
import '../../model/pay_model.dart';
import '../../network/dio_helper.dart';
import 'donor_state.dart';
import 'package:intl/intl.dart';
 class DonorCubit extends Cubit<DonorState>{
  DonorCubit(DonorState initialState) : super(InitialDonorState());

  static DonorCubit get(context)=>BlocProvider.of<DonorCubit>(context);
/*-----------------------governemnts-----------------------------*/
  GovementModel? govementModel;
  String selectedzoneName="";
  String selectedzonecode="";

  Future<List<GovermentItems>> fetchGoverment() {
      print("governemnts");
    return DioHelpers.getData(url: "governemnts").then((value) {
      govementModel = GovementModel.fromJson(value.data);
      print(govementModel?.items);
       return govementModel!.items;
    }).catchError((e) {
    });
  }
/*-----------------------pay_type-----------------------------*/
   PayModel? payModel;
  String selectedpaytypearname="";
  int selectedpaytypecode = 0 ;

  Future<List<PayModelItems>> fetchPayType() {
    print("Pay List");
    return DioHelpers.getData(url: "pay_type").then((value) {
      payModel = PayModel.fromJson(value.data);
      print(payModel?.items);
      return payModel!.items;
    }).catchError((e) {
    });
  }

   /*-----------------------org Bank Account -----------------------------*/
   OrgBankAccount? orgBankAccount;
   int selectOrgCode= 0 ;
   int selectBankCode=0 ;
   String selectBankName="";
   int selectBankBranchCode= 0 ;
   String selectAccountNo ="";

   Future<List<OrgBankItems>> fetchOrgAcc() {
     print("Org Bank Account");
     return DioHelpers.getData(url: "org_bank_account").then((value) {
       orgBankAccount = OrgBankAccount.fromJson(value.data);
       print(orgBankAccount?.items);
       return orgBankAccount!.items;
     }).catchError((e) {
     });
   }


   /*-----------------------Bank-----------------------------*/
   BankModel? bankModel;
   int selectbankCode = 0 ;
   String selectBankArName="";

   Future<List<BankItems>> fetchBank() {
     print("Org Bank Account");
     return DioHelpers.getData(url: "bank").then((value) {
       bankModel = BankModel.fromJson(value.data);
       print(bankModel?.items);
       return bankModel!.items;
     }).catchError((e) {
     });
   }
   /*-----------------------Bank Branch -----------------------------*/
   BankBranchModel? bankBranchModel;
   int selectBranchCode= 0 ;
   String selectBranchArName ="";

   Future<List<BankBranchItems>> fetchBankBranch() {
     print("Org Bank Account");
     return DioHelpers.getData(url: "bank/"+selectbankCode.toString()).then((value) {
       bankBranchModel = BankBranchModel.fromJson(value.data);
       print(bankBranchModel?.items);
       return bankBranchModel!.items;
     }).catchError((e) {
     });
   }
   /*-----------------------Receive Dept -----------------------------*/
   ReceiveDeptModel? receiveDeptModel;
   String selectDeptCode = "";
   String selectDeptArName = "";

   Future<List<ReceiveDeptItems>> fetchReceiveDept() {
     print("Receive Dept");
     return DioHelpers.getData(url: "org/1").then((value) {
       receiveDeptModel = ReceiveDeptModel.fromJson(value.data);
       print(receiveDeptModel?.items);
       return receiveDeptModel!.items;
     }).catchError((e) {
     });
   }

/*-----------------------marital Status-----------------------------*/
   MaritalStatusModel? maritalStatusModel;
   String selectedMaritalStatusArName="";
   int selectedMaritalStatusCode = 0;

   Future<List<MaritalStatusItems>> fetchMaritalStatus() {
     print("marital Status");
     return DioHelpers.getData(url: "marital_status").then((value) {
       maritalStatusModel = MaritalStatusModel.fromJson(value.data);
       print(maritalStatusModel?.items);
       return maritalStatusModel!.items;
     }).catchError((e) {
     });
   }
/*-----------------------marital Status-----------------------------*/
   GenderModel? genderModel;
   String selectedGenderArName="";
   int selectedGenderCode = 0;

   Future<List<GenderItems>> fetchGender() {
     print("gender");
     return DioHelpers.getData(url: "gender").then((value) {
       genderModel = GenderModel.fromJson(value.data);
       print(genderModel?.items);
       return genderModel!.items;
     }).catchError((e) {
     });
   }
/*-----------------------marital Status-----------------------------*/
   CountryModel? countryModel;
   String selectedCountryArName="";
   int selectedCountryCode = 0;

   Future<List<CountryItems>> fetchCountry() {
     print("gender");
     return DioHelpers.getData(url: "countries").then((value) {
       countryModel = CountryModel.fromJson(value.data);
       print(countryModel?.items);
       return countryModel!.items;
     }).catchError((e) {
     });
   }
   /*-----------------------change Date-----------------------------*/
   DateTime? birth_date  ;
   changeDate(vDate){
     birth_date = vDate;
     emit(ChangDateSate());
   }
/*----------------------- Post Donnation transfer -----------------------------*/
/// Post Donnation transfer
postDonnation(context,{
 required RECEIVE_ORG_CODE,
 required DONOR_CIVIL_ID,
 required DONNATION_AMOUNT,
 required DONNATION_DATE,
 required DONOR_BANK_CODE,
 required DONOR_BANK_BRANCH_CODE,
 required DONOR_ACCOUNT_NO,
 required RECEIVIED_BANK_ID,
 required RECEIVIED_BANK_BRANCH_CODE,
 required BILL_TRANSFER_NO,
 required PAY_TYPE_CODE,
 required RECEIVE_DEPT_CODE,
 required KNET_NO,
 required STATUS_CODE,
 required EVENT_SERIAL,
 required RECEIVIED_ACCOUNT_NO}){

     return DioHelpers.postData(url: "donor_req/",data:{
       "RECEIVE_ORG_CODE":RECEIVE_ORG_CODE,
       "DONOR_CIVIL_ID":DONOR_CIVIL_ID,
       "DONNATION_AMOUNT":DONNATION_AMOUNT,
       "DONNATION_DATE":DONNATION_DATE,
       "DONOR_BANK_CODE":DONOR_BANK_CODE,
       "DONOR_BANK_BRANCH_CODE":DONOR_BANK_BRANCH_CODE,
       "DONOR_ACCOUNT_NO":DONOR_ACCOUNT_NO,
       "RECEIVIED_BANK_ID":RECEIVIED_BANK_ID,
       "RECEIVIED_BANK_BRANCH_CODE":RECEIVIED_BANK_BRANCH_CODE,
       "BILL_TRANSFER_NO":BILL_TRANSFER_NO,
       "PAY_TYPE_CODE":PAY_TYPE_CODE,
       "RECEIVE_DEPT_CODE":RECEIVE_DEPT_CODE,
       "KNET_NO":KNET_NO,
       "STATUS_CODE" :STATUS_CODE,
       "EVENT_SERIAL" :EVENT_SERIAL,
       "RECEIVIED_ACCOUNT_NO":RECEIVIED_ACCOUNT_NO,
     } ).then((value) {
       print(value.data.toString());
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){return EventScreen();}));
       showToast("تم التبرع بنجاح",position: ToastPosition.bottom,duration: Duration(seconds: 4));
       print(value);
     }).catchError((e){print(e.toString());

     });}
  /*----------------------- Post Donnation transfer -----------------------------*/
     /// Post Donnation transfer
  postDonor(context,{
     required civil_id,
     required fname,
     required sname,
     required tnmae,
     required lname,
     required fname_ar,
     required sname_ar,
     required tnmae_ar,
     required lname_ar,
     required mobil1,
     required country_code,
     required gender_code,
     required marital_status_code,
     required zone_code,
    required birth_date,
    required events}){
       return       DioHelpers.postData(url: "donor/",data:{
           "civil_id" :civil_id,
           "fname" :fname,
           "sname" :sname,
           "tnmae" :tnmae,
           "lname" :lname,
           "fname_ar" :fname_ar,
           "sname_ar" :sname_ar,
           "tnmae_ar" :tnmae_ar,
           "lname_ar" :lname_ar,
           "mobil1" :mobil1,
           "country_code" :country_code,
           "gender_code" :gender_code,
           "marital_status_code" :marital_status_code,
           "zone_code" :zone_code,
          "birth_date" :birth_date.toString()
       } ).then((value) {

         var donorDateModel=DonorDatoModel.fromJson(value.data);
         Navigator.push(context, MaterialPageRoute(builder: (c){
           return donorData(donorDatoModel: donorDateModel,eventsModel: events,);
         }));
         showToast("تم تسجيل بياناتك بنجاح",position: ToastPosition.bottom,duration: Duration(seconds: 4));
         print(value);
       }).catchError((e){print(e.toString());
       print(DateFormat('dd-MM-yyyy')
           .format(BlocProvider.of<DonorCubit>(context)
           .birth_date ??
           DateTime.now()));


       });}
 }