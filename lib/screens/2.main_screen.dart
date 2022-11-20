import 'dart:ffi';

import 'package:cathai_attendance/widget/event.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class Dimensions {
  static double screenHeight = 600;
  static double screenWidth = 500;

//dynamic height padding and margin
  static double pageView = screenHeight / 5.1;
  static double pageViewContainer =
      screenHeight / 6.5; //3.84 is a scaling factor
  static double pageViewTextContainer = screenHeight / 9.00;

  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height40 = screenHeight / 24.13;

  static double font20 = screenHeight / 40.2;
  static double font24 = screenHeight / 33.2;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

//dynamic width padding and margin
  static double pageViewWidth = screenWidth / 1.3;
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

// icon Size
  static double iconSize30 = screenHeight / 28.13;
  static double iconSize20 = screenHeight / 35.13;

// list view size
  static double listViewImgSize = screenHeight / 3.25;
  static double listViewImgContentSize = screenHeight / 3.9;

// details
  static double detailsBgSize = screenHeight / 2.41;
}

String category = "Elderly";
List task = [
  "Before Take-off",
  "Safety Instruction",
  "After Take-off",
  "First Meal",
  "Before Landing",
  "After Landing",
  
];

class _MainScreenState extends State<MainScreen> {
  final itemQuery = FirebaseFirestore.instance.collection("seats");
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Column(children: [
          // Hero panel
          Container(
            height: 280,
            width: Dimensions.screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/clear.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width15,
                    right: Dimensions.width15,
                    top: 30,
                    bottom: 30),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.2), //here i want to add opacity
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("CX2720",style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold ),),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width10, right: Dimensions.width10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("HKG",style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold )), Text("ICN", style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold ))],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        child: LinearPercentIndicator(
                          animation: true,
                          animationDuration: 1500,
                          percent: 53 / 100,
                          lineHeight: 5,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.green,
                        )),
                    Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width10, right: Dimensions.width10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "09:15",
                          ),
                          Text(
                            "12:30",
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("01:30h Left", style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold ))],
                    ),
                    Row(
                      children: [
                        // Column(
                        //   children: [
                        //     Text("Kim Chi"), Text("ok")],
                        // ),
                        // SizedBox(
                        //   width: Dimensions.width15,
                        // ),
                        // Column(
                        //   children: [Text("C"), Text("26")],
                        // ),
                        const SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.only(left:0),
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/images/sunny.png'),
                              fit: BoxFit.fill,
                            ))),
                        Column(
                          children: [Text("°C"), Text("26")],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[Text("4"), Text("Medical Conditions", style: TextStyle(fontSize: 12, fontWeight:FontWeight.bold ))],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[Text("3"), Text("Pregnant", style: TextStyle(fontSize: 12, fontWeight:FontWeight.bold ))],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[Text("15"), Text("Elderly", style: TextStyle(fontSize: 12, fontWeight:FontWeight.bold ))],
                          ),
                        ),
                      ],
                    ),

                  ],
                )),
          ),
        ]),
        Container(
            height: 120,
            width: double.infinity,
            child: ListView.builder(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: task.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                        minWidth: 200,
                        child: Container(
                          width: 130,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: index > 1 ?Colors.blue : Colors.grey[500]),
                              onPressed: () {},
                              child: Text(
                                textAlign: TextAlign.center,
                                "${index + 1}. "+task[index],
                                style: TextStyle(fontSize: 15),
                              )),
                        )),
                  );
                })),
        //eventWidget,
        
        Container(
          padding: const EdgeInsets.only(top: 10, right: 23),
          alignment: Alignment.topRight,
          child: Row(children: [
            SizedBox(width: 12,),
            Text("Seat Allocation", style: TextStyle(fontSize: 20),),
            Flexible(child: SizedBox(width: 1000),),
            DropdownButton<String>(
            value: category,
            iconSize: 24,
            onChanged: (String? newValue) {
              setState(() {
                category = newValue!;
              });
            },
            items: <String>[
              'Elderly',
              'Child',
              'Pregnant',
              'Medical Conditions',
              'Gender',
              'Status'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ],)
        ),
        StreamBuilder(
            stream: itemQuery.snapshots(),
            builder:
                (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final docs = snap.data!.docs;
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      seat("${index + 1}A", docs[index * 8]),
                      seat("${index + 2}B", docs[index * 8 + 1]),
                      SizedBox(
                        width: 20,
                      ),
                      seat("${index + 3}C", docs[index * 8 + 2]),
                      seat("${index + 4}D", docs[index * 8 + 3]),
                      seat("${index + 5}E", docs[index * 8 + 4]),
                      seat("${index + 6}F", docs[index * 8 + 5]),
                      SizedBox(
                        width: 20,
                      ),
                      seat("${index + 7}G", docs[index * 8 + 6]),
                      seat("${index + 8}H", docs[index * 8 + 7]),
                      SizedBox(
                        width: 10,
                      ),
                    ]);
                  });
            }),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: 10,
        //     ),

        //     // Expanded(
        //     //   child: GridView.count(
        //     //       physics: const ScrollPhysics(),
        //     //       crossAxisCount: 3,
        //     //       crossAxisSpacing: 4.0,
        //     //       mainAxisSpacing: 8.0,
        //     //       shrinkWrap: true,
        //     //       children: List.generate(150, (index) {
        //     //         return ButtonTheme(
        //     //           minWidth: double.infinity,
        //     //           height: 40,
        //     //           child: ElevatedButton(
        //     //             style: ElevatedButton.styleFrom(
        //     //                 backgroundColor: Colors.grey),
        //     //             onPressed: () {},
        //     //             child: Text(
        //     //               index.toString(),
        //     //               style: TextStyle(fontSize: 8),
        //     //             ),
        //     //           ),
        //     //         );
        //     //       })),
        //     // ),
        //     // SizedBox(
        //     //   width: 30,
        //     // ),
        //     // Expanded(
        //     //   child: GridView.count(
        //     //       physics: const ScrollPhysics(),
        //     //       crossAxisCount: 3,
        //     //       crossAxisSpacing: 4.0,
        //     //       mainAxisSpacing: 8.0,
        //     //       shrinkWrap: true,
        //     //       children: List.generate(150, (index) {
        //     //         return ButtonTheme(
        //     //           minWidth: double.infinity,
        //     //           height: 40,
        //     //           child: ElevatedButton(
        //     //             style: ElevatedButton.styleFrom(
        //     //                 backgroundColor: Colors.grey),
        //     //             onPressed: () {},
        //     //             child: Text(
        //     //               index.toString(),
        //     //               style: TextStyle(fontSize: 8),
        //     //             ),
        //     //           ),
        //     //         );
        //     //       })),
        //     // ),
        //     // SizedBox(
        //     //   width: 30,
        //     // ),
        //     // Expanded(
        //     //   child: GridView.count(
        //     //       physics: const ScrollPhysics(),
        //     //       crossAxisCount: 3,
        //     //       crossAxisSpacing: 4.0,
        //     //       mainAxisSpacing: 8.0,
        //     //       shrinkWrap: true,
        //     //       children: List.generate(150, (index) {
        //     //         return ButtonTheme(
        //     //           minWidth: double.infinity,
        //     //           height: 40,
        //     //           child: ElevatedButton(
        //     //             style: ElevatedButton.styleFrom(
        //     //                 backgroundColor: Colors.grey),
        //     //             onPressed: () {},
        //     //             child: Text(
        //     //               index.toString(),
        //     //               style: TextStyle(fontSize: 8),
        //     //             ),
        //     //           ),
        //     //         );
        //     //       })),
        //     // ),
        //     SizedBox(
        //       width: 10,
        //     )
        //   ],
        // ),
      ],
    ));
  }
}

Widget seat(
    String seatNumber, QueryDocumentSnapshot<Map<String, dynamic>> person) {
  List item = help(person, category);
  return Expanded(
    child: Padding(
      padding: EdgeInsets.all(2),
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: item[0]
                  ? item[1]
                  : (category == "Gender" ? Colors.pink : Colors.grey)),
          onPressed: () {},
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              seatNumber,
              
              style: TextStyle(fontSize: 8, overflow: TextOverflow.fade, color: !item[0] ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    ),
  );
}

List help(QueryDocumentSnapshot<Map<String, dynamic>> person, _category) {
  List result = [];
  switch (_category) {
    case "Elderly":
      result = [person['age'] >= 60, Colors.yellow];
      break;
    case "Child":
      result = [person['age'] <= 10, Colors.amber];
      break;
    case "Pregnant":
      result = [
        person['age'] >= 40 && person['gender'] == 'female',
        Colors.pink
      ];
      break;
    case "Medical Conditions":
      result = [person['diseases'] != [], Colors.yellow];
      break;
    case "Gender":
      result = [person['gender'] == "male", Colors.blue];
      break;
    case "Status":
      result = [person['status'] == "Do not disturb", Colors.red];
      break;
    default:
      result = [false, Colors.yellow];
      break;
  }

  return result;
}
