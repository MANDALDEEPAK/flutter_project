import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart';
import 'package:flutter_proj/features/shared/image_provider.dart';
import 'package:flutter_proj/features/shared/validator_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


class ProductEditForm extends ConsumerStatefulWidget {

  const ProductEditForm({super.key});

  @override
  ConsumerState createState() => _ProductEditFormState();
}

class _ProductEditFormState extends ConsumerState<ProductEditForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {

    // ref.listen(bookControllerProvider, (prev, next){
    //   next.maybeWhen(
    //       data: (data){
    //         context.pop();
    //       },
    //       error: (err, st) =>
    //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //             content: Text(err.toString()),
    //
    //           )),
    //       orElse: () => null
    //   );
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
                   // initialValue: widget.book.title,
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
                  //  initialValue: widget.book.author ,
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
                  //  initialValue: widget.book.publisher ,
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
                   // initialValue: widget.book.price.toString() ,
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
                   // initialValue: widget.book.description ,
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
                 //   initialValue: widget.book.genre,
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

                  // InkWell(
                  //     onTap: (){
                  //       ref.read(imageControllerProvider.notifier).pickImage();
                  //     },
                  //     child: Container(
                  //
                  //       decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.black)
                  //       ),
                  //       height: 100,
                  //       child: image == null ? CachedNetworkImage(imageUrl: widget.book.imageUrl): Image.file(File(image.path)),
                  //     )
                  // ),
                  AppSizes.gapH16,
                  AppSizes.gapH16,

                  ElevatedButton(
                      onPressed:
                      //bookState.isLoading ? null:
                          (){
                        if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)){

                        }else{
                          ref.read(validateModeControllerProvider(id: 3).notifier).change();
                        }



                      }, child:
                  //bookState.isLoading ? Center(child: CircularProgressIndicator()):
                  Text('Submit'))

                ],
              )
          ),
        )
    );
  }
}
