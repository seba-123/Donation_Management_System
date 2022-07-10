import 'package:reactive_forms/reactive_forms.dart';

class ReactiveConst {
  static const email = "email";
  static const password = "password";

  static const sellingPriceOfTheItem = "sellingPriceOfTheItem";
  static const taqresh = "taqresh";
  static const availableQuantity = "availableQuantity";
  static const soldQuantity = "soldQuantity";
  static const cartonPurchasePrice = "cartonPurchasePrice";
  static const cartonSellingPrice = "cartonSellingPrice";
  static const name = "name";
  static const note = "note";

  static const age = "age";
  static const militaryNumber = "militaryNumber";
  static const phone = "phone";
  static const nameOfTheClosest = "nameOfTheClosest";
  static const closestPhone = "closestPhone";
  static const address = "address";
  static const specialization = "specialization";
  static const enlistmentDate = "enlistmentDate";
  static const annexationDate = "annexationDate";
  static const demobilization = "demobilization";
  static const nationalID = "national_ID";
  static const center = "center";
  static const country = "country";
  static const province = "province";

  static ValidatorFunction mustMatch(
      String controlName, String matchingControlName) {
    return (AbstractControl<dynamic> control) {
      final form = control as FormGroup;

      final formControl = form.control(controlName);
      final matchingFormControl = form.control(matchingControlName);

      if (formControl.value != matchingFormControl.value) {
        matchingFormControl.setErrors({'': true});

        // force messages to show up as soon as possible
        matchingFormControl.markAsTouched();
      } else {
        matchingFormControl.removeError('');
      }

      return null;
    };
  }
}
