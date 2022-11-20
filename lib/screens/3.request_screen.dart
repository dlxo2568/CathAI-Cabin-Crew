import 'package:cathai_attendance/widget/request.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: 45,
          //   child: ListView.builder(
          //     itemCount: 20,
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.only(top:9,left: 12),
          //           child: Container(color: Colors.grey[350], child: FittedBox(fit: BoxFit.contain,child: TextButton(onPressed: () {}, child: Text("카테고리", style: TextStyle(color: Colors.black, fontSize: 17),), ))),
          //         );
          //         }
          //   ),
          // ),

          ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(onTap: () {}, child: requestWidget);
              }),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text(""))
        ],
      ),
    ));
  }
}
