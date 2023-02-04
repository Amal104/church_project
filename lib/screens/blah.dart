// import 'dart:async';
// import 'dart:convert';
// import 'package:church/provider/MemberProvider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// import '../Model/MemberListModel.dart';

// class Jobs extends StatefulWidget {
//   Jobs() : super();

//   @override
//   JobsState createState() => JobsState();
// }


// class JobsState extends State<Jobs> {

//   @override
//   void initState() {
//     super.initState();
//     final getmember = Provider.of<MemberProvider>(context, listen: false);
//     getmember.searchMember();
//   }

//   //Main Widget
//   @override
//   Widget build(BuildContext context) {
//     final getmember = Provider.of<MemberProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'All Users',
//           style: TextStyle(fontSize: 25),
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           //Search Bar to List of typed Subject
//           Container(
//             padding: EdgeInsets.all(15),
//             child: TextField(
//               textInputAction: TextInputAction.search,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25.0),
//                   borderSide: BorderSide(
//                     color: Colors.grey,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                   ),
//                 ),
//                 suffixIcon: InkWell(
//                   child: Icon(Icons.search),
//                 ),
//                 contentPadding: EdgeInsets.all(15.0),
//                 hintText: 'Search ',
//               ),
//               onChanged: (string) => getmember.search(string),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               physics: ClampingScrollPhysics(),
//               padding: EdgeInsets.all(5),
//               itemCount: getmember.memberLists?.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     side: BorderSide(
//                       color: Colors.grey.shade300,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         ListTile(
//                           title: Text(
//                             getmember.memberLists![index].memberName,
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           subtitle: Text(
//                             getmember.memberLists![index].designation,
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
