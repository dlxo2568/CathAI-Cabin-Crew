import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List checklist = [
  "Before Take-off",
  "Safety Instruction",
  "After Take-off",
  "First Meal",
  "Before Landing",
  "After Landing",
  
];

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: ' ${index+1}'+'. '+checklist[index],
      expandedValue: 'Not completed',
      
    );
  });
}

class CheckListScreen extends StatefulWidget {
  const CheckListScreen({super.key});

  @override
  State<CheckListScreen> createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  final List<Item> _data = generateItems(checklist.length);
  @override
  Widget build(BuildContext context) {
    final itemQuery = FirebaseFirestore.instance.collection("items");

    return SingleChildScrollView(
        child: Stack(children: <Widget>[
      Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // StreamBuilder(
                    //     stream: itemQuery.snapshots(),
                    //     builder: (ctx,
                    //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                    //             snap) {
                    //       if (snap.connectionState == ConnectionState.waiting) {
                    //         return const Center(
                    //           child: CircularProgressIndicator(),
                    //         );
                    //       }
                    //       final docs = snap.data!.docs;
                    //       return ListView.builder(
                    //           shrinkWrap: true,
                    //           scrollDirection: Axis.vertical,
                    //           physics: const NeverScrollableScrollPhysics(),
                    //           itemCount: 2,
                    //           itemBuilder: (context, index) {
                    //             return Container(
                    //               child: Text(docs[index]["stock"].toString()),
                    //             );
                    //           });
                    //     }),

                    Container(
                      //margin: EdgeInsets.only(left: 96.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "CX2720",
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("Republic of Korea"),
                            subtitle: Text("Incheon/Seoul"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 100,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2500,
                              percent: 0.8,
                              center: Text("8/27"),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ElevatedButton(
                    //     onPressed: () async {
                    //       for (int i = 1; i <=240; i++) {
                    //         Random random = new Random();
                    //         int randomNumber = random.nextInt(80);
                    //         FirebaseFirestore.instance
                    //             .collection('seats')
                    //             .doc()
                    //             .set({
                    //           'number': i,
                    //           'name': "kim",
                    //           'age': randomNumber,
                    //           'gender': randomNumber > 40 ? 'male' : 'female',
                    //           'diseases': [],
                    //           'nationality': randomNumber > 40
                    //               ? 'Hong Kong'
                    //               : 'Republic of Korea',
                    //           'status':
                    //               randomNumber > 20 ? 'Do not disturb' : 'Fine',
                    //           'notes': "Any notes",
                    //         });
                    //       }
                    //     },
                    //     child: Text("add ")),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[Text("28"), Text("requests")],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[Text("30"), Text("Resolved")],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[Text("4"), Text("Toilets")],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                width: 80,
              )
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            child: _buildPanel(),
          ),
          Container(
            height: 122,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("Check List"),
                ),
                Divider(),
                ListTile(
                  title: Text("Email"),
                  subtitle: Text("butterfly.little@gmail.com"),
                  leading: Icon(Icons.email),
                ),
                ListTile(
                  title: Text("Phone"),
                  subtitle: Text("+977-9815225566"),
                  leading: Icon(Icons.phone),
                ),
                ListTile(
                  title: Text("Website"),
                  subtitle: Text("https://www.littlebutterfly.com"),
                  leading: Icon(Icons.web),
                ),
                ListTile(
                  title: Text("About"),
                  subtitle: Text(""),
                  leading: Icon(Icons.person),
                ),
                ListTile(
                  title: Text("Joined Date"),
                  subtitle: Text("15 February 2019"),
                  leading: Icon(Icons.calendar_view_day),
                ),
              ],
            ),
          )
        ],
      )
    ]));
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: Column(children: [
              ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('Welcome Greetings'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
              ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('Door-Lock check once everyone boards'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
              ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('Overhead Locker Check'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('Seatbelt Check'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('Welcome Annoucement'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          ],),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
