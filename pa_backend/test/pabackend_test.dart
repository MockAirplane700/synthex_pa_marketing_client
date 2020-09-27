import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pabackend/pabackend.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  // Test ("title" , method (with test code))

  //Testing register with email and password
  test("Register with empty body returns error", () {
    var result = Register.registerEmailandPassword("", "");
    expect(result,"Error" );
  });

  test("Register with correct email and passoword", () {
    var result = Register.registerEmailandPassword(
        "mthandazo99@gmail.com", "Synthex2020"
    );
    expect(result, "");
  });

  test("Register with already existing email ", () {
    var result = Register.registerEmailandPassword(
        "mthandazo99@gmail.com", "Synthex2020"
    );
    expect(result, "Error");
  });

  test("Register with empty password and proper email", () {
    var result = Register.registerEmailandPassword(
        "synthex2020@gmail.com", ""
    );
    expect(result, "Error");
  });

  test("Register with non-existent email", () {
    var result = Register.registerEmailandPassword(
        "mthandazo@exampleemail.com", "gravy"
    );
    expect(result, "Error");
  });

  //Testing upload credentials

  //Testing register with google

  //Testing reset password
}//end main
