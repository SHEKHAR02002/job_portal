import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job/Data/globaldata.dart';
import 'package:job/Screens/joblocation.dart';
import 'package:job/Theme/colors.dart';
import 'package:job/Theme/decoration.dart';

class JobCity extends StatefulWidget {
  const JobCity({super.key});

  @override
  State<JobCity> createState() => _JobCityState();
}

class _JobCityState extends State<JobCity> {
  List city = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Hyderabad',
    'Ahmedabad',
    'Chennai',
    'Kolkata',
    'Surat',
    'Pune',
    'Jaipur',
    'Lucknow',
    'Kanpur',
    'Nagpur',
    'Indore',
    'Thane',
    'Bhopal',
    'Visakhapatnam',
    'Pimpri-Chinchwad',
    'Patna',
    'Vadodara',
    'Ghaziabad',
    'Ludhiana',
    'Agra',
    'Nashik',
    'Faridabad',
    'Meerut',
    'Rajkot',
    'Kalyan-Dombivli',
    'Vasai-Virar',
    'Varanasi'
  ];
  List filterlist = [];

  @override
  initState() {
    filterlist = city;
    super.initState();
  }

  void _filter({required String enterkeyword}) {
    setState(() {
      if (enterkeyword.isEmpty) {
        filterlist = city;
      } else {
        filterlist = city
            .where((element) =>
                element.toLowerCase().contains(enterkeyword.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
          'Select Job City',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                decoration: shadowdecoration,
                child: TextField(
                  onChanged: (value) async {
                    _filter(enterkeyword: value);
                  },
                  // controller: _search,
                  decoration: InputDecoration(
                      prefixIcon: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Icon(CupertinoIcons.search)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: white,
                      hintText: "Search",
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      helperStyle:
                          const TextStyle(fontSize: 10, color: Colors.grey)),
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
                    selectcity = filterlist[index];
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobLocation(
                                selectcity: selectcity,
                              )));
                },
                child: ListTile(
                  title: Text(filterlist[index]),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          )
        ]),
      ),
    );
  }
}
