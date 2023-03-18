import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

enum DisplayMode {
  Grid,
  Staggered,
}

class DisplayListView extends StatefulWidget {
  final List<String> imageUrls;
  final DisplayMode initialDisplayMode;
  final void Function(DisplayMode) onDisplayModeChanged;

  const DisplayListView({
    Key? key,
    required this.imageUrls,
    this.initialDisplayMode = DisplayMode.Grid,
    required this.onDisplayModeChanged,
  }) : super(key: key);

  @override
  _DisplayListViewState createState() => _DisplayListViewState();
}

class _DisplayListViewState extends State<DisplayListView> {
  late DisplayMode _displayMode;

  @override
  void initState() {
    super.initState();
    _displayMode = widget.initialDisplayMode;
  }

  void _onDisplayModeChanged(DisplayMode mode) {
    setState(() {
      _displayMode = mode;
    });
    widget.onDisplayModeChanged(mode);
  }

  @override
  Widget build(BuildContext context) {
    switch (_displayMode) {
      case DisplayMode.Grid:
        return _buildGridView();
      case DisplayMode.Staggered:
        return _buildStaggeredView();
    }
  }

  Widget _buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(widget.imageUrls.length, (index) {
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.imageUrls[index],
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Item $index'),
              ),
            ],
          ),
        );
      }),
    );
  }


  Widget _buildStaggeredView() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: widget.imageUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.imageUrls[index],
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Item $index'),
              ),
            ],
          ),
        );
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  @override
  Widget rebuild(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.grid_on),
          color: _displayMode == DisplayMode.Grid ? Colors.blue : Colors.grey,
          onPressed: () => _onDisplayModeChanged(DisplayMode.Grid),
        ),
        IconButton(
          icon: Icon(Icons.dashboard),
          color:
          _displayMode == DisplayMode.Staggered ? Colors.blue : Colors.grey,
          onPressed: () => _onDisplayModeChanged(DisplayMode.Staggered),
        ),
      ],
    );
  }
}
