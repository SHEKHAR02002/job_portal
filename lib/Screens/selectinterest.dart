import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job/Theme/colors.dart';

class Interest {
  Interest({required this.img, required this.name});

  final String name;
  final IconData img;
}

final _interest = [
  Interest(img: Icons.business, name: 'Business'),
  Interest(img: Icons.computer, name: 'Graphic Designer'),
  Interest(img: Icons.call, name: 'Telecaller BPO'),
  Interest(img: Icons.precision_manufacturing_sharp, name: 'Technology'),
  Interest(img: Icons.business_outlined, name: 'Business'),
  Interest(img: Icons.computer_outlined, name: 'Graphic Designer'),
  Interest(img: Icons.phone, name: 'Telecaller BPO'),
  Interest(img: Icons.precision_manufacturing_sharp, name: 'Technology'),
];

class SelectInterest extends StatefulWidget {
  const SelectInterest({super.key});

  @override
  State<SelectInterest> createState() => _SelectInterestState();
}

List selectinterst = [];

class _SelectInterestState extends State<SelectInterest> {
  bool checkpresent({required IconData title}) {
    if (selectinterst.isEmpty) {
      return false;
    }
    if (selectinterst.contains(title)) {
      return true;
    } else {
      return false;
    }
  }

  remove({required IconData imag}) {
    setState(() {
      selectinterst.remove(imag);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectinterst.isEmpty
                ? Container(
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                      child: Text(
                        "Let's Start by Selecting Your area of Interest",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 20),
                    child: SizedBox(
                      height: 70,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: selectinterst.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                InkWell(
                                  onTap: () =>
                                      remove(imag: _interest[index].img),
                                  child: CircleAvatar(
                                      radius: 50,
                                      child: Icon(
                                        _interest[index].img,
                                        size: 30,
                                      )),
                                ),
                                const Positioned(
                                    right: 10,
                                    child: Icon(
                                      CupertinoIcons.clear_thick_circled,
                                      color: Colors.red,
                                    ))
                              ],
                            );
                          }),
                    ),
                  ),
            Container(
              width: width,
              // height: 500,
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Choose Your Category",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "You have to choose atleast one category",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400, color: white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    // onChanged: (value) async {
                    //   _filter(enterkeyword: value);
                    // },
                    decoration: InputDecoration(
                        prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Icon(CupertinoIcons.search)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: white,
                        hintText: "Search",
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 12),
                        helperStyle:
                            const TextStyle(fontSize: 10, color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _interest.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              checkpresent(title: _interest[index].img)
                                  ? remove(imag: _interest[index].img)
                                  : selectinterst.add(_interest[index].img);
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                height: 170,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(children: [
                                  CircleAvatar(
                                      radius: 50,
                                      child: Icon(
                                        _interest[index].img,
                                        size: 30,
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _interest[index].name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                              ),
                              Positioned(
                                right: 30,
                                top: 5,
                                child: checkpresent(title: _interest[index].img)
                                    ? SvgPicture.asset(
                                        "assets/tickfill.svg",
                                        height: 25,
                                        width: 25,
                                        color: Colors.green,
                                      )
                                    : SvgPicture.asset(
                                        "assets/tick.svg",
                                        height: 25,
                                        width: 25,
                                      ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
