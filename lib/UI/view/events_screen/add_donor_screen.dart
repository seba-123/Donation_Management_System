import 'package:dms_app/helper/reusaple_componant/custom_button.dart';
import 'package:dms_app/helper/theme/app_colors.dart';
import 'package:dms_app/model/country_model.dart';
import 'package:dms_app/model/gender_model.dart';
import 'package:dms_app/model/govement_model.dart';
import 'package:dms_app/view_model/donor_cupit/donor_cupit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extirnalLip/date_picker/lib/flutter_datetime_picker.dart';
import '../../../extirnalLip/date_picker/lib/src/i18n_model.dart';
import '../../../model/event_model.dart';
import '../../../model/marital_status_model.dart';
import '../../../view_model/donor_cupit/donor_state.dart';
import 'package:intl/intl.dart';

class AddDonorScreen extends StatefulWidget {
  String donorId = "";
  EventItems? eventsModel;

  AddDonorScreen({Key? key, this.eventsModel, required this.donorId})
      : super(key: key);

  @override
  State<AddDonorScreen> createState() => _AddDonorScreenState();
}

class _AddDonorScreenState extends State<AddDonorScreen> {
  TextEditingController fNameController = TextEditingController();

  TextEditingController sNameController = TextEditingController();

  TextEditingController tNameController = TextEditingController();

  TextEditingController lNameController = TextEditingController();

  TextEditingController fNameArController = TextEditingController();

  TextEditingController sNameArController = TextEditingController();

  TextEditingController tNameArController = TextEditingController();

  TextEditingController lNameArController = TextEditingController();

  TextEditingController mobil1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('اضافه بيانات المتبرع')),
      body: BlocProvider(
        create: (context) {
          return DonorCubit(InitialDonorState());
        },
        child: BlocConsumer<DonorCubit, DonorState>(
          listener: (c, b) {},
          builder: (c, b) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 8),
                  child: Row(
                    children: [
                      Text('الرقم القومي:'),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(widget.donorId),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: fNameController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: "الاسم الاول بالانجليزيه ",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            controller: sNameController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: "الاسم الثاني بالانجليزيه ",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        )
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: tNameController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: "الاسم الثالث بالانجليزيه ",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            controller: lNameController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: "الاسم الرابع بالانجليزيه ",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        )
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: fNameArController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: "الاسم الاول بالعربيه ",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            controller: sNameArController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: "الاسم الثاني بالعربيه ",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        )
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: tNameArController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: "الاسم الثالث بالعربيه ",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            controller: lNameArController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: "الاسم الرابع بالعربيه ",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        )
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(1940, 3, 5),
                          maxTime: DateTime.now(), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        BlocProvider.of<DonorCubit>(context).changeDate(date);
                        print(BlocProvider.of<DonorCubit>(context)
                            .birth_date
                            .toString());
                        print(DateFormat('dd-MM-yyyy')
                            .format(BlocProvider.of<DonorCubit>(context)
                            .birth_date ??
                            DateTime.now()));
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.ar);
                    },
                    child: Text(
                      BlocProvider.of<DonorCubit>(context).birth_date == null
                          ? 'show date time picker (Chinese)'
                          : DateFormat('dd-MM-yyyy')
                              .format(BlocProvider.of<DonorCubit>(context)
                                      .birth_date ??
                                  DateTime.now())
                              .toString(),
                      style: TextStyle(color: Colors.blue),
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("رقم الهاتف : "),
                        Expanded(
                          child: TextField(
                            controller: mobil1Controller,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: "رقم الهاتف",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                      ],
                    )),
                DropdownSearch<CountryItems>(
                  label: "الدوله",
                  onFind: (String? filter) =>
                      BlocProvider.of<DonorCubit>(context).fetchCountry(),
                  itemAsString: (CountryItems? u) => u?.countryArName ?? "",
                  onChanged: (CountryItems? data) {
                    BlocProvider.of<DonorCubit>(context).selectedCountryArName =
                        data!.countryArName.toString();
                    BlocProvider.of<DonorCubit>(context).selectedCountryCode =
                        data.countryCode;
                  },
                ),
                DropdownSearch<GovermentItems>(
                  label: "المنطقه",
                  onFind: (String? filter) =>
                      BlocProvider.of<DonorCubit>(context).fetchGoverment(),
                  itemAsString: (GovermentItems? u) => u?.zoneName ?? "",
                  onChanged: (GovermentItems? data) {
                    BlocProvider.of<DonorCubit>(context).selectedzoneName =
                        data!.zoneName.toString();
                    BlocProvider.of<DonorCubit>(context).selectedzonecode =
                        data.zoneCode.toString();
                  },
                ),
                DropdownSearch<GenderItems>(
                  label: "الجنس",
                  onFind: (String? filter) =>
                      BlocProvider.of<DonorCubit>(context).fetchGender(),
                  itemAsString: (GenderItems? u) => u?.genderArName ?? "",
                  onChanged: (GenderItems? data) {
                    BlocProvider.of<DonorCubit>(context).selectedGenderArName =
                        data!.genderArName.toString();
                    BlocProvider.of<DonorCubit>(context).selectedGenderCode =
                        data.genderCode;
                  },
                ),
                DropdownSearch<MaritalStatusItems>(
                  label: "الحاله الاجتماعيه",
                  onFind: (String? filter) =>
                      BlocProvider.of<DonorCubit>(context).fetchMaritalStatus(),
                  itemAsString: (MaritalStatusItems? u) =>
                      u?.maritalStatusArName ?? "",
                  onChanged: (MaritalStatusItems? data) {
                    BlocProvider.of<DonorCubit>(context)
                            .selectedMaritalStatusArName =
                        data!.maritalStatusArName.toString();
                    BlocProvider.of<DonorCubit>(context)
                        .selectedMaritalStatusCode = data.maritalStatusCode;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: customElevatedButtonWithIcon(
                    context,
                    function: () {
                      BlocProvider.of<DonorCubit>(context).postDonor(context,
                          events: widget.eventsModel,
                          civil_id: widget.donorId,
                          fname: fNameController.text,
                          sname: sNameController.text,
                          tnmae: tNameController.text,
                          lname: lNameController.text,
                          fname_ar: fNameArController.text,
                          sname_ar: sNameArController.text,
                          tnmae_ar: tNameArController.text,
                          lname_ar: lNameArController.text,
                          mobil1: mobil1Controller.text,
                          country_code: BlocProvider.of<DonorCubit>(context)
                              .selectedCountryCode,
                          gender_code: BlocProvider.of<DonorCubit>(context)
                              .selectedGenderCode,
                          marital_status_code:
                              BlocProvider.of<DonorCubit>(context)
                                  .selectedMaritalStatusCode,
                          zone_code: BlocProvider.of<DonorCubit>(context)
                              .selectedzonecode,
                          birth_date:
                          DateFormat('dd-MM-yyyy')
                              .format(BlocProvider.of<DonorCubit>(context)
                              .birth_date ??
                              DateTime.now()));
                    },
                    title: 'حفظ وتبرع',
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
//country_code, gender_code, marital_status_code, zone_code
