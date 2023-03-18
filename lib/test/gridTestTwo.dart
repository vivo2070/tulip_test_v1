// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
// enum DisplayMode { Grid, Staggered }
//
// class ImageGridView extends StatefulWidget {
//   @override
//   _ImageGridViewState createState() => _ImageGridViewState();
// }
//
// class _ImageGridViewState extends State<ImageGridView> {
//   DisplayMode _displayMode = DisplayMode.Grid;
//
//   void _toggleDisplayMode() {
//     setState(() {
//       _displayMode = _displayMode == DisplayMode.Grid
//           ? DisplayMode.Staggered
//           : DisplayMode.Grid;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> imageUrls = [      "https://picsum.photos/id/1018/300/200",      "https://picsum.photos/id/1019/300/200",      "https://picsum.photos/id/1020/300/200",      "https://picsum.photos/id/1021/300/200",      "https://picsum.photos/id/1022/300/200",      "https://picsum.photos/id/1023/300/200",      "https://picsum.photos/id/1024/300/200",      "https://picsum.photos/id/1025/300/200",    ];
//
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       _displayMode = DisplayMode.Grid;
//                     });
//                   },
//                   icon: Icon(Icons.grid_view),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       _displayMode = DisplayMode.Staggered;
//                     });
//                   },
//                   icon: Icon(Icons.view_list),
//                 ),
//               ],
//             ),
//           ),
//           _displayMode == DisplayMode.Grid
//               ? GridView.builder(
//             shrinkWrap: true,
//             physics: ClampingScrollPhysics(),
//             itemCount: imageUrls.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 3 / 4,
//               mainAxisSpacing: 4.0,
//               crossAxisSpacing: 4.0,
//             ),
//             itemBuilder: (BuildContext context, int index) {
//               return Image.network(
//                 imageUrls[index],
//                 fit: BoxFit.cover,
//               );
//             },
//           )
//               : StaggeredGridView.countBuilder(
//             shrinkWrap: true,
//             physics: ClampingScrollPhysics(),
//             crossAxisCount: 2,
//             itemCount: imageUrls.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Stack(
//                 children: [
//                   Image.network(
//                     imageUrls[index],
//                     fit: BoxFit.cover,
//                   ),
//                   Positioned(
//                     top: 8.0,
//                     right: 8.0,
//                     child: IconButton(
//                       onPressed: () {
//                         // Handle heart icon press
//                       },
//                       icon: Icon(Icons.favorite_border),
//                     ),
//                   ),
//                 ],
//               );
//             },
//             staggeredTileBuilder: (int index) =>
//                 StaggeredTile.count(1, index.isEven ? 1.2 : 1.8),
//             mainAxisSpacing: 4.0,
//             crossAxisSpacing: 4.0,
//           ),
//         ],
//       ),
//     );
//   }
// }
