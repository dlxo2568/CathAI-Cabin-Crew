import 'package:flutter/material.dart';

Widget requestWidget = Container(      
                    padding: const EdgeInsets.only(bottom:10, top: 10),
                    color: Colors.grey[200],
                    child: Container(
                      padding: const EdgeInsets.only(top:8, left:8, right: 8),
                      color: Colors.white,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(height:25, width: 35, color:Colors.grey[300], child: FittedBox(fit: BoxFit.contain,child: TextButton(onPressed: () {}, child: Text("Category", style: TextStyle(color: Colors.black, fontSize: 40),), ))),
                                const Flexible(child: SizedBox(width: double.infinity,),),
                                Text("5min ago", style: TextStyle(color: Colors.grey[600], fontSize: 10),),
                              ],
                            ),
                            const SizedBox(height: 3,),
                            Text(" Title", style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 3,),
                            Text(" Content", style: TextStyle(color: Colors.grey[800], fontSize: 14),),
                            const SizedBox(height: 10,),
                            Divider(endIndent: 1),
                            Text(" Taehun Lee | Seat A7", style: TextStyle(color: Colors.grey[800], fontSize: 10),),
                            SizedBox(height: 10,)
                          ]),
                    ),
                  );