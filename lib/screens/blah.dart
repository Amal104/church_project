// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Instagram Clone',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePagee(),
//     );
//   }
// }

// class HomePagee extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Instagram Clone'),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: Column(
//                       children: [
//                         Image.network(
//                           'https://picsum.photos/200',
//                           fit: BoxFit.cover,
//                         ),
//                         SizedBox(height: 10),
//                         Text('Image $index'),
//                         SizedBox(height: 10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Icon(Icons.favorite),
//                             Icon(Icons.comment),
//                             Icon(Icons.send),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         Text('Description'),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }