import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_proj/providers/notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formkey = GlobalKey<FormBuilderState>();
  final todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            child: Column(
              children: [
                FormBuilderTextField(
                  controller: todoController,
                  name: "todo",
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Deepak',
                  ),
                  onSubmitted: (val) {
                    if (val!.isNotEmpty) {
                      ref.read(todoProvider.notifier).addTodo(val);
                      todoController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class TodoForm extends ConsumerWidget {
//   const TodoForm ({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: FormBuilder(
//           child: Column(
//               children: [
//                 FormBuilderTextField(
//                     name: "todo",
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                     border: OutlineInputBorder(),
//                     hintText: 'Deepak',
//                   ),
//                   onSubmitted: (val){
//                       print(val);
//                   },
//                 ),
//               ],
//
//       )
//       ),
//     ) ;
//   }
// }
