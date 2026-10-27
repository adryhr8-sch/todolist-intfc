import 'package:flutter/material.dart';

class TareaItem extends StatelessWidget {
  final String tarea;
  final int index;
  final Function(int) onDismissed;

  const TareaItem({
    super.key,
    required this.tarea,
    required this.index,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(tarea + index.toString()),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDismissed(index);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: ListTile(
          title: Text(
            tarea,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          trailing: const Icon(
            Icons.drag_handle,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
