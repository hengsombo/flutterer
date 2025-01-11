// import 'package:flutter/material.dart';

// class AssignmentSombo extends StatelessWidget {
//   String pic =
//       "https://upload.wikimedia.org/wikipedia/commons/b/b3/Blackpink_Ros%C3%A9_Rimowa_1.jpg";
//   String pic2 =
//       "https://images.squarespace-cdn.com/content/v1/5a7f41ad8fd4d236a4ad76d0/1669842753281-3T90U1EY5HUNCG43XERJ/A2_Poster_DC_v80_PAYOFF_221029_12trimHD.jpg";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: _buildTopMenu(),
//         backgroundColor: const Color.fromARGB(255, 11, 4, 39),
//         foregroundColor: Colors.white,
//       ),
//       body: _buildBody(),
//       //bottomNavigationBar:// _buildBottomAppBar(),
//     );
//   }

//   Widget _buildTopMenu() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.favorite,
//               size: 30,
//             )),
//         IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark)),
//         IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_basket)),
//         IconButton(onPressed: () {}, icon: const Icon(Icons.currency_bitcoin)),
//       ],
//     );
//   }

//   Widget _buildBody() {
//     return Center(
//       child: _buildStack(),
//     );
//   }

//   Widget _buildStack() {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Image.network(pic),
//         Positioned(
//           right: 20,
//           child: ElevatedButton(onPressed: () {}, child: const Text("Buy Now")),  
//         ),
//         Positioned(
//           right: 280,
//           child: Text("Rose BlackPink")
//         ),

//         Positioned(
//           top: 300,
//           child: Container(
//               width: 400, height: 300, color: Color.fromARGB(255, 174, 32, 16)
//               ), const Text("Rose from Blackpink"),
         
//         ),

//       ],
//     );
//   }
// }


