import 'package:flutter/material.dart';

import 'tarea_item.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<String> _tareas = [
    'tarea1',
    'tarea2',
    'tarea3',
    'tarea4',
    'tarea5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Text(
                'To Do List',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Ingresa una tarea...',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF638EC6),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add, color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, thickness: 1, color: Colors.grey),

                    Expanded(
                      child: ReorderableListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: _tareas.length,
                        onReorderItem: (oldIndex, newIndex) {
                          setState(() {
                            final item = _tareas.removeAt(oldIndex);
                            _tareas.insert(newIndex, item);
                          });
                        },
                        itemBuilder: (context, index) {
                          return TareaItem(
                            key: Key(_tareas[index] + index.toString()),
                            tarea: _tareas[index],
                            index: index,
                            onDismissed: (deletedIndex) {
                              setState(() {
                                _tareas.removeAt(deletedIndex);
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}