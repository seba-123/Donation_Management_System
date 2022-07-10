import 'package:dms_app/model/bank_branch_model.dart';
import 'package:dms_app/model/bank_model.dart';
import 'package:dms_app/model/donor_data_model.dart';
import 'package:dms_app/model/event_model.dart';
import 'package:dms_app/model/org_bank_account.dart';
import 'package:dms_app/model/receive_dept_model.dart';
import 'package:dms_app/network/dio_helper.dart';
import 'package:dms_app/view_model/donor_cupit/donor_cupit.dart';
import 'package:dms_app/view_model/donor_cupit/donor_state.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/reusaple_componant/custom_button.dart';
import '../../../helper/theme/app_colors.dart';
import '../../../model/govement_model.dart';
import '../../../model/pay_model.dart';
import '../../../view_model/event_cupit/event_cubit.dart';

class donorData extends StatelessWidget {
  DonorDatoModel ?donorDatoModel;
   EventItems ?eventsModel;
    donorData({Key? key,required this.donorDatoModel,this.eventsModel}) : super(key: key);
TextEditingController BILL_TRANSFER_NOcontroller=TextEditingController();
TextEditingController DONOR_ACCOUNT_NOcontroller=TextEditingController();
TextEditingController DONNATION_AMOUNTcontroller=TextEditingController();
TextEditingController KNET_NOcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    //print("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}");
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل متبرع جديد'),
      ),
      body: BlocProvider(
        create: (context){return DonorCubit(InitialDonorState());},

        child: BlocConsumer<DonorCubit,DonorState>(
          listener: (c,b){},
          builder: (c,b){
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 8),
                  child: Row(
                    children: [
                      Text('التبرع لصالح حمله :'),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(eventsModel!.eventArName.toString()),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 8),
                  child: Row(
                    children: [
                      Text('المتبرع :'),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text("${donorDatoModel?.fnameAr.toString()} "
                            "${donorDatoModel?.snameAr.toString()} "
                            "${donorDatoModel?.tnmaeAr.toString()} "
                            "${donorDatoModel?.lnameAr.toString()}"),
                      ),
                    ],
                  ),
                ),
                DropdownSearch<ReceiveDeptItems>(
                  label: "التبرع لصالح فرع",
                  onFind: (String ?filter) =>BlocProvider.of<DonorCubit>(context).fetchReceiveDept(),
                  itemAsString: (ReceiveDeptItems? u) => u?.deptArName ??"",
                  onChanged: (ReceiveDeptItems ?data) {
                    BlocProvider.of<DonorCubit>(context).selectDeptArName =data!.deptArName.toString();
                    BlocProvider.of<DonorCubit>(context).selectDeptCode=data.deptCode.toString();
                  },
                ),
                DropdownSearch<OrgBankItems>(
                  label: "التبرع علي حساب ",
                  onFind: (String ?filter) =>BlocProvider.of<DonorCubit>(context).fetchOrgAcc(),
                  itemAsString: (OrgBankItems? u) => u?.bankName ??"",
                  onChanged: (OrgBankItems ?data) {
                    BlocProvider.of<DonorCubit>(context).selectBankName=data!.bankName.toString();
                    BlocProvider.of<DonorCubit>(context).selectBankBranchCode= data.bankBranchCode;
                    BlocProvider.of<DonorCubit>(context).selectAccountNo= data.accountNo.toString();
                    BlocProvider.of<DonorCubit>(context).selectBankCode= data.bankCode;
                    BlocProvider.of<DonorCubit>(context).selectOrgCode= data.orgCode;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("قيمه التبرع : "),
                        Expanded(
                          child: TextField(controller:DONNATION_AMOUNTcontroller,decoration: InputDecoration(
                              hintText: "ادخل قيمه التبرع",
                              // enabledBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(color: AppColor.primaryColor),
                              //     borderRadius: BorderRadius.circular(8)),
                              border:  OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.primaryColor),
                                  borderRadius: BorderRadius.circular(8))
                          ),),
                        )
                      ],
                    )
                ),
                DropdownSearch<PayModelItems>(
                  label: "طريقه الدفع ",
                  onFind: (String ?filter) =>BlocProvider.of<DonorCubit>(context).fetchPayType(),
                  itemAsString: (PayModelItems? u) => u?.paytypeArName ??"",
                  onChanged: (PayModelItems ?data) {
                    BlocProvider.of<DonorCubit>(context).selectedpaytypearname=data!.paytypeArName.toString();
                    BlocProvider.of<DonorCubit>(context).selectedpaytypecode= data.payTypeCode;
                  },
                ),
                DropdownSearch<BankItems>(
                  label: "من فضلك اختار البنك الخاص بك",
                  onFind: (String ?filter) =>BlocProvider.of<DonorCubit>(context).fetchBank(),
                  itemAsString: (BankItems? u) => u?.bankArName ??"",
                  onChanged: (BankItems ?data) {
                    BlocProvider.of<DonorCubit>(context).selectBankArName=data!.bankArName.toString();
                    BlocProvider.of<DonorCubit>(context).selectbankCode= data.bankCode;
                  },
                ),
                DropdownSearch<BankBranchItems>(
                  label: "فرع البنك ",
                  onFind: (String ?filter) =>BlocProvider.of<DonorCubit>(context).fetchBankBranch(),
                  itemAsString: (BankBranchItems? u) => u?.branchArName ??"",
                  onChanged: (BankBranchItems ?data) {
                    BlocProvider.of<DonorCubit>(context).selectBranchArName=data!.branchArName.toString();
                    BlocProvider.of<DonorCubit>(context).selectBranchCode= data.bankBranchCode;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("رقم كرت البنك : "),
                        Expanded(
                          child: TextField(controller: KNET_NOcontroller,decoration: InputDecoration(
                              hintText: "ادخل رقم كرت البنك الخاص بك ",
                              border:  OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.primaryColor),
                                  borderRadius: BorderRadius.circular(8))
                          ),),
                        )
                      ],
                    )
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("رقم الحساب : "),
                        Expanded(
                          child: TextField(controller: DONOR_ACCOUNT_NOcontroller,decoration: InputDecoration(
                              hintText: "ادخل رقم الحساب الخاص بك ",
                              border:  OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.primaryColor),
                                  borderRadius: BorderRadius.circular(8))
                          ),),
                        )
                      ],
                    )
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                          Text("رقم التحويل : "),
                        Expanded(
                          child: TextField(controller: BILL_TRANSFER_NOcontroller,decoration: InputDecoration(
                              hintText: "ادخل رقم التحويل ",
                              border:  OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.primaryColor),
                                  borderRadius: BorderRadius.circular(8))
                          ),),
                        )
                      ],
                    )
                ),
                // DropdownSearch<GovermentItems>(
                //   label: "المحافظه ",
                //   onFind: (String ?filter) =>BlocProvider.of<DonorCubit>(context).fetchGoverment(),
                //   itemAsString: (GovermentItems? u) => u?.zoneName ??"",
                //   onChanged: (GovermentItems ?data) {
                //     BlocProvider.of<DonorCubit>(context).selectedzoneName=data!.zoneName.toString();
                //     BlocProvider.of<DonorCubit>(context).selectedzonecode=data.zoneCode.toString();
                //   },
                // ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: customElevatedButtonWithIcon(
                    context,
                    function: () {

                      BlocProvider.of<DonorCubit>(context).postDonnation(context,
                          RECEIVE_ORG_CODE: 1,
                          DONOR_CIVIL_ID: donorDatoModel?.civilId.toString(),
                          DONNATION_AMOUNT: DONNATION_AMOUNTcontroller.text,
                          DONNATION_DATE: "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                          DONOR_BANK_CODE: BlocProvider.of<DonorCubit>(context).selectbankCode,
                          DONOR_BANK_BRANCH_CODE: BlocProvider.of<DonorCubit>(context).selectBranchCode,
                          DONOR_ACCOUNT_NO: DONOR_ACCOUNT_NOcontroller.text,
                          RECEIVIED_BANK_ID: BlocProvider.of<DonorCubit>(context).selectBankCode,
                          RECEIVIED_BANK_BRANCH_CODE: BlocProvider.of<DonorCubit>(context).selectBankBranchCode,
                          BILL_TRANSFER_NO: BILL_TRANSFER_NOcontroller.text,
                          PAY_TYPE_CODE: BlocProvider.of<DonorCubit>(context).selectedpaytypecode,
                          RECEIVE_DEPT_CODE: BlocProvider.of<DonorCubit>(context).selectDeptCode,
                          KNET_NO: KNET_NOcontroller.text,
                          STATUS_CODE: 1,
                          EVENT_SERIAL: eventsModel!.evnttypeCode,
                          RECEIVIED_ACCOUNT_NO: BlocProvider.of<DonorCubit>(context).selectAccountNo);
                    },
                    title: 'تبرع',
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
