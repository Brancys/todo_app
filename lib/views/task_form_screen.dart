import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskFormScreen extends ConsumerStatefulWidget {
  final Task? task;

  const TaskFormScreen({Key? key, this.task}) : super(key: key);

  @override
  ConsumerState<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends ConsumerState<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.task?.title ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final title = _controller.text.trim();
      final provider = ref.read(taskListProvider.notifier);

      if (widget.task == null) {
        await provider.addTask(title);
      } else {
        final updatedTask = widget.task!.copyWith(title: title);
        await provider.updateTask(updatedTask);
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.task != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Tarea' : 'Nueva Tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Título de la tarea'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El título no puede estar vacío';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                label: Text(isEditing ? 'Actualizar' : 'Agregar'),
                icon:  Icon(isEditing ? CupertinoIcons.arrow_2_circlepath : CupertinoIcons.add),
                onPressed: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
