import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_proj/core/api.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart';
import 'package:flutter_proj/features/products/domain/product.dart';
import 'package:flutter_proj/features/products/presentation/controllers/product_controller.dart';
import 'package:flutter_proj/features/shared/image_provider.dart';
import 'package:flutter_proj/features/shared/validator_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';


class ProductEditForm extends ConsumerStatefulWidget {
  final Product product;
  const ProductEditForm({super.key, required this.product});

  @override
  ConsumerState createState() => _ProductEditFormState();
}

class _ProductEditFormState extends ConsumerState<ProductEditForm> {
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
    final mode = ref.watch(validateModeControllerProvider(id: 4));
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
                    initialValue: widget.product.title ,
                    decoration: InputDecoration(
                        hintText: 'Title'
                    ),
                    validator: FormBuilderValidators.compose( [
                      FormBuilderValidators.required()
                    ]),
                  ),
                  AppSizes.gapH16,

                  FormBuilderTextField(
                    initialValue: widget.product.description ,
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
                    initialValue: widget.product.price.toString(),
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
                    initialValue: widget.product.brand,
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
                    initialValue: widget.product.category ,
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
                        child: image == null ? Image.network('$base${widget.product.image}'): Image.file(File(image.path)),
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
                            ref.read(productControllerProvider.notifier).updateProduct(data: map, productId: widget.product.id);
                          }else{
                            ref.read(productControllerProvider.notifier).updateProduct(data: map, image: image, productId: widget.product.id);
                          }

                        }else{
                          ref.read(validateModeControllerProvider(id: 4).notifier).change();
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
