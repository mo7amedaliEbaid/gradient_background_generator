/*import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../gradient_background_generator.dart';

class GradientEditor extends StatefulWidget {
  final Function(List<Color>) onGradientChanged;

  const GradientEditor({super.key, required this.onGradientChanged});

  @override
  GradientEditorState createState() => GradientEditorState();
}

class GradientEditorState extends State<GradientEditor> {
  final List<Color> _colors = [Colors.blue, Colors.purple];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientBackground(colors: _colors),
        Row(
          children: [
            ..._colors.map((color) => GestureDetector(
                  onTap: () async {
                    Color newColor = await pickColor(context, color);
                    setState(() {
                      int index = _colors.indexOf(color);
                      _colors[index] = newColor;
                      widget.onGradientChanged(_colors);
                    });
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    color: color,
                  ),
                )),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                Color newColor = await pickColor(context, Colors.white);
                setState(() {
                  _colors.add(newColor);
                  widget.onGradientChanged(_colors);
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Future<Color> pickColor(BuildContext context, Color currentColor) async {
    Color selectedColor = currentColor;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: (Color color) {
                selectedColor = color;
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Select'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    return selectedColor;
  }
}*/
