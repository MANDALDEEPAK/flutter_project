import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart';
import 'package:flutter_proj/features/shared/validate_provider.dart';
import 'package:flutter_proj/features/todos/presentation/controllers/todo_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class TodoForm extends ConsumerStatefulWidget {
  const TodoForm({super.key});

  @override
  ConsumerState<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends ConsumerState<TodoForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(todoControllerProvider, (previous, next){
      next.maybeWhen(
        data: (data) => {
          context.pop(),
        },
        error: (err,stack){
          SnackBar(content: Text('$err'),);
        },orElse: () => null,
      );
    });
    final mode = ref.watch(validateControllerProvider);
    final todoState = ref.watch(todoControllerProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FormBuilder(
          key: _formKey,
            autovalidateMode: mode,
            child: ListView(
              children: [
                FormBuilderTextField(
                    name: 'todo_task',
                  decoration: InputDecoration(
                    label: Text('Todo_task'),
                    //suffix: Icon(Icons.add)
                    //prefix: Icon(Icons.picture_as_pdf),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(5)
                    // ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(5),
                    FormBuilderValidators.maxLength(30),
                  ]),
                ),
                AppSizes.gapH20,
                FormBuilderCheckbox(
                    name: 'isComplete',
                    title: Text('isCompleted'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                AppSizes.gapH20,
                ElevatedButton(
                    onPressed:todoState.isLoading ? null : (){
                      FocusScope.of(context).unfocus();
                      if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)){
                        final value = _formKey.currentState!.value;
                        ref.read(todoControllerProvider.notifier).addTodo(value);
                      }else{
                        ref.read(validateControllerProvider.notifier).change();
                      }
                    },
                    child:todoState.isLoading ? CircularProgressIndicator(): Text('Submit')
                ),

              ],
            )
        ),
      ),
    );

  }
}
