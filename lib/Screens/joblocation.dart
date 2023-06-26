import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job/Data/globaldata.dart';
import 'package:job/Theme/colors.dart';
import 'package:job/Theme/decoration.dart';

class JobLocation extends StatefulWidget {
  final String selectcity;
  const JobLocation({super.key, required this.selectcity});

  @override
  State<JobLocation> createState() => _JobLocationState();
}

class _JobLocationState extends State<JobLocation> {
  List location = [
    '10th Road',
    '16th Road',
    '600 Tenament Gate',
    'Aai Tuljabhvani Chk',
    'Akash Ganga Society',
    'Abhinav School',
    'Adarsh Dairy',
    'Adarsh Nagar',
    'Kolhapur',
    'Goa nagar',
    'Shiv nagar',
    'golden mandir',
    'Snatos nagar',
    'Agra gate'
  ];
  List filterlist = [];

  @override
  initState() {
    filterlist = location;
    super.initState();
  }

  void _filter({required String enterkeyword}) {
    setState(() {
      if (enterkeyword.isEmpty) {
        filterlist = location;
      } else {
        filterlist = location
            .where((element) =>
                element.toLowerCase().contains(enterkeyword.toLowerCase()))
            .toList();
      }
    });
  }

  // void _filter({required String enterkeyword}) {
  //   List results = [];
  //   if (enterkeyword.isEmpty) {
  //     results = location;
  //   } else {
  //     results = location.where((element) {
  //       return element == enterkeyword;
  //     }).toList();
  //   }

  //   setState(() {
  //     filterlist = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  decoration: shadowdecoration,
                  child: Icon(
                    Icons.arrow_back,
                    color: primary,
                  )),
            ),
          ),
          title: const Text(
            'Select Job Location',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      widget.selectcity,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      onChanged: (value) async {
                        _filter(enterkeyword: value);
                      },
                      // controller: _search,
                      decoration: InputDecoration(
                          prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Icon(CupertinoIcons.search)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(16)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          filled: true,
                          fillColor: white,
                          hintText: "Enter Nearest Railway/Bus/Autostand",
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          helperStyle: const TextStyle(
                              fontSize: 10, color: Colors.grey)),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: filterlist.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        setctlocation = filterlist[index];
                      });
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: ListTile(
                      title: Text(filterlist[index]),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              )
            ],
          ),
        ));
  }
}
