import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job/Data/globaldata.dart';
import 'package:job/Screens/jobcity.dart';
import 'package:job/Screens/selectinterest.dart';
import 'package:job/Theme/colors.dart';
import 'package:job/Theme/decoration.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

final List gender = [
  "Gender",
  "Male",
  "Female",
];
String? gendertype = "Gender";

class _CreateProfileState extends State<CreateProfile> {
  final TextEditingController _name = TextEditingController();
  DateTime? dateofbrith;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: shadowdecoration,
                child: Icon(
                  Icons.arrow_back,
                  color: primary,
                )),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's Create Your \n Profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset(
                "assets/createprofile.svg",
                height: 300,
                // width: width,
              ),
              TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Full Name',
                    suffixIcon: Icon(
                      Icons.person,
                      color: primary,
                    )),
                controller: _name,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030));
                  setState(() {
                    dateofbrith = date;
                  });
                },
                child: Container(
                  height: 60,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          dateofbrith == ""
                              ? 'Date of Brith'
                              : dateofbrith.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.date_range,
                            color: primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  buttonWidth: width,
                  buttonHeight: 60,
                  buttonDecoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  dropdownDecoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  // buttonDecoration: shadowdecoration,
                  items: gender
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Overpass'),
                              ),
                            ),
                          ))
                      .toList(),
                  value: gendertype,
                  onChanged: (value) {
                    setState(() {
                      gendertype = value as String;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const JobCity())),
                child: Container(
                  height: 60,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Text(
                      selectcity.isEmpty ? "Job City" : selectcity,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              setctlocation != ""
                  ? Container(
                      height: 60,
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Text(
                          setctlocation,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: primary,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                if (_name.text != "" ||
                    selectcity != "" ||
                    setctlocation != "" ||
                    gendertype != "Gender") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectInterest()));
                } else {
                  Fluttertoast.showToast(
                      msg: "Fill All Field",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: primary,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              }),
        ));
  }
}
