// import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
// import 'package:circular_bottom_navigation/tab_item.dart';
// import 'package:flutter/material.dart';
//
// import '../screens/movies_screen.dart';
//
// class BottomNavigationBarComponent extends StatefulWidget {
//   const BottomNavigationBarComponent({Key? key}) : super(key: key);
//
//   @override
//   State<BottomNavigationBarComponent> createState() => _BottomNavigationBarComponentState();
// }
//
// class _BottomNavigationBarComponentState extends State<BottomNavigationBarComponent> {
//   int selectedPos = 0;
//
//   double bottomNavBarHeight = 60;
//
//   List<TabItem> tabItems = List.of([
//     TabItem(
//       Icons.movie,
//       "Movie",
//       Colors.blue,
//       labelStyle: const TextStyle(
//         fontWeight: FontWeight.normal,
//       ),
//     ),
//     TabItem(
//       Icons.tv,
//       "Tv",
//       Colors.cyan,
//     ),
//   ]);
//
//   List<Widget> bottomListWidget = [const MoviesScreen(), const TvScreen()];
//   late CircularBottomNavigationController _navigationController;
//
//   @override
//   void initState() {
//     super.initState();
//     _navigationController = CircularBottomNavigationController(selectedPos);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CircularBottomNavigation(
//       tabItems,
//       controller: _navigationController,
//       selectedPos: selectedPos,
//       barHeight: bottomNavBarHeight,
//       barBackgroundColor: Colors.white,
//       backgroundBoxShadow: const <BoxShadow>[
//         BoxShadow(color: Colors.black45, blurRadius: 10.0),
//       ],
//       animationDuration: Duration(milliseconds: 300),
//       selectedCallback: (int? selectedPos) {
//         setState(() {
//           this.selectedPos = selectedPos ?? 0;
//         });
//       },
//     );
//   }
//
//   void navigateToSelectedScreen() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) {
//           return bottomListWidget[selectedPos];
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _navigationController.dispose();
//   }
// }