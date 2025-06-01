import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart';
import 'package:flutter_proj/features/shared/image_provider.dart';
import 'package:flutter_proj/features/shared/validator_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


class ProductForm extends ConsumerStatefulWidget {
  const ProductForm({super.key});

  @override
  ConsumerState createState() => _ProductFormState();
}

class _ProductFormState extends ConsumerState<ProductForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {

    // ref.listen(bookControllerProvider, (prev, next){
    //    next.maybeWhen(
    //      data: (data){
    //        context.pop();
    //      },
    //        error: (err, st) =>
    //            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //              content: Text(err.toString()),
    //
    //        )),
    //        orElse: () => null
    //    );
    // });

    final image = ref.watch(imageControllerProvider);
    final mode = ref.watch(validateModeControllerProvider(id: 3));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FormBuilder(
          autovalidateMode: mode,
            key: _formKey,
            child: ListView(
              children: [
                FormBuilderTextField(
                    name: 'title',
                  decoration: InputDecoration(
                    hintText: 'Title'
                  ),
                  validator: FormBuilderValidators.compose( [
                    FormBuilderValidators.required()
                  ]),
                ),
              AppSizes.gapH16,

                FormBuilderTextField(
                  name: 'author',
                  decoration: InputDecoration(
                      hintText: 'Author'
                  ),
                  validator: FormBuilderValidators.compose( [
                    FormBuilderValidators.required()
                  ]),
                ),
                AppSizes.gapH16,
                FormBuilderTextField(
                  name: 'publisher',
                  decoration: InputDecoration(
                      hintText: 'Publisher'
                  ),
                  validator: FormBuilderValidators.compose( [
                    FormBuilderValidators.required()
                  ]),
                ),
                AppSizes.gapH16,
                FormBuilderTextField(
                  name: 'price',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Price'
                  ),
                  validator: FormBuilderValidators.compose( [
                    FormBuilderValidators.required()
                  ]),
                ),
                AppSizes.gapH16,
                FormBuilderTextField(
                  name: 'description',
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Description'
                  ),
                  validator: FormBuilderValidators.compose( [
                    FormBuilderValidators.required()
                  ]),
                ),
                AppSizes.gapH16,
                FormBuilderDropdown(
                  name: 'genre',
                  hint: Text('Genre'),
                  items: [
                    DropdownMenuItem(value: 'Fiction', child: Text('Fiction')),
                    DropdownMenuItem(value: 'Non-Fiction', child: Text('Non-Fiction')),
                    DropdownMenuItem(value: 'Biography', child: Text('Biography')),
                    DropdownMenuItem(value: 'Self-Help', child: Text('Self-Help')),
                    DropdownMenuItem(value: 'Poetry', child: Text('Poetry')),
                    DropdownMenuItem(value: 'History', child: Text('History')),
                  ],
                  validator: FormBuilderValidators.compose( [
                    FormBuilderValidators.required()
                  ]),

                ),
                AppSizes.gapH16,
                AppSizes.gapH16,

                InkWell(
                    onTap: (){
                      ref.read(imageControllerProvider.notifier).pickImage();
                    },
                    child: Container(

                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      height: 100,
                      child: image == null ? Center(child: Text( 'Select Image')): Image.file(File(image.path)),
                    )
                ),
                AppSizes.gapH16,
                AppSizes.gapH16,


                ElevatedButton(
                    onPressed:
                    // bookState.isLoading ? null:
                        (){
                  if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)){
                    final map = _formKey.currentState!.value;

                  }else{
                    ref.read(validateModeControllerProvider(id: 3).notifier).change();
                  }



                }, child:
                // bookState.isLoading ? Center(child: CircularProgressIndicator())
                //     :
                Text('Submit'))

              ],
            )
        ),
      )
    );
  }
}
