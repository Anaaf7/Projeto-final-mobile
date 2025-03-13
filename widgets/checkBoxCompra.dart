import 'package:flutter/material.dart';

class CheckBoxCompra extends StatefulWidget {
  final Color activeColor;

  const CheckBoxCompra({super.key, required this.activeColor});

  @override
  State<CheckBoxCompra> createState() => _CheckBoxCompraState();
}

class _CheckBoxCompraState extends State<CheckBoxCompra> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return widget.activeColor; // Cor quando selecionado
        }
        return Colors.white;
      }),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

      side: WidgetStateBorderSide.resolveWith((states) {
        return BorderSide(color: Colors.brown);
      }),
    );
  }
}
