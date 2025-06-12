import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart';
import 'package:flutter_proj/features/products/presentation/controllers/product_controller.dart';
import 'package:flutter_proj/features/shared/image_provider.dart';
import 'package:flutter_proj/features/shared/validator_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class ProductForm extends ConsumerStatefulWidget {
  const ProductForm({super.key});

  @override
  ConsumerState createState() => _ProductFormState();
}

class _ProductFormState extends ConsumerState<ProductForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {

    ref.listen(productControllerProvider, (prev, next){
       next.maybeWhen(
         data: (data){
           ref.invalidate(getProductsProvider);
           context.pop();
         },
           error: (err, st) =>
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                 content: Text(err.toString()),

           )),
           orElse: () => null
       );
    });

    final image = ref.watch(imageControllerProvider);
    final mode = ref.watch(validateModeControllerProvider(id: 3));
    final productState = ref.watch(productControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Form'),
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
                  name: 'description',
                  decoration: InputDecoration(
                      hintText: 'Description'
                  ),
                  validator: FormBuilderValidators.compose( [
                    FormBuilderValidators.required()
                  ]),
                ),
                AppSizes.gapH16,
                FormBuilderTextField(
                  name: 'price',
                  keyboardType: TextInputType.number ,
                  decoration: InputDecoration(
                      hintText: 'Price'
                  ),
                  validator: FormBuilderValidators.compose( [
                    FormBuilderValidators.required()
                  ]),
                ),

                AppSizes.gapH16,
                FormBuilderDropdown(
                  name: 'brand',
                  hint: Text('Brand'),
                  items: [
                    DropdownMenuItem(value: 'Apple', child: Text('Apple')),
                    DropdownMenuItem(value: 'Samsung', child: Text('Samsung')),
                    DropdownMenuItem(value: 'Addidas', child: Text('Addidas')),
                    DropdownMenuItem(value: 'Google', child: Text('Google')),
                    DropdownMenuItem(value: 'Tanishq', child: Text('Tanishq')),

                  ],
                  validator: FormBuilderValidators.compose( [
                    FormBuilderValidators.required()
                  ]),

                ),
                AppSizes.gapH16,

                AppSizes.gapH16,
                FormBuilderDropdown(
                  name: 'category',
                  hint: Text('Category'),
                  items: [
                    DropdownMenuItem(value: 'men\'s clothing', child: Text('Men\'s clothing')),
                    DropdownMenuItem(value: 'women\'s clothing', child: Text('Women\'s clothing')),
                    DropdownMenuItem(value: 'jewelery', child: Text('Jewelery')),
                    DropdownMenuItem(value: 'electronics', child: Text('Electronics')),

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
                    onPressed: productState.isLoading ? null:
                        (){
                  if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)){
                    final map = _formKey.currentState!.value;
                    if(image== null){
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('Please Select an Image')));
                    }else{
                       ref.read(productControllerProvider.notifier).addProduct(map, image);
                    }

                  }else{
                    ref.read(validateModeControllerProvider(id: 3).notifier).change();
                  }



                }, child: productState.isLoading ? Center(child: CircularProgressIndicator())
                    :
                Text('Submit'))

              ],
            )
        ),
      )
    );
  }
}
