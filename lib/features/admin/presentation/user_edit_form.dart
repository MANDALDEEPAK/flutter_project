import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart' show AppSizes;
import 'package:flutter_proj/features/admin/presentation/controllers/user_controller.dart';
import 'package:flutter_proj/features/home/domain/user_data.dart' show UserData;
import 'package:flutter_proj/features/shared/image_provider.dart';
import 'package:flutter_proj/features/shared/validator_provider.dart' show validateModeControllerProvider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';



class UserEditForm extends ConsumerStatefulWidget {
  final UserData user;
  const UserEditForm({super.key, required this.user});
  @override
  ConsumerState<UserEditForm> createState() => _UserEditFormState();
}

class _UserEditFormState extends ConsumerState<UserEditForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(userControllerProvider, (prev, next){
      next.maybeWhen(
          data: (data){
            context.pop();
          },
          error: (err, st) =>
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(err.toString()))),
          orElse: () =>  null
      );
    });

    final userState = ref.watch(userControllerProvider);
    final mode = ref.watch(validateModeControllerProvider(id: 6));
    final image = ref.watch(imageControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('User EditForm Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FormBuilder(
            autovalidateMode: mode,
            key: _formKey,
            child: ListView(
              children: [

                FormBuilderTextField(
                  name: 'username',
                  initialValue: widget.user.username ,
                  decoration: InputDecoration(
                      hintText: 'Username'
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                AppSizes.gapH16,
                FormBuilderTextField(
                  name: 'email',
                  initialValue: widget.user.email ,
                  decoration: InputDecoration(
                      hintText: 'Email'
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.email(),
                    FormBuilderValidators.required(),
                  ]),
                ),
                AppSizes.gapH16,

                FormBuilderTextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10)
                  ],
                  name: 'phone',
                  initialValue: widget.user.phone.toString() ,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Phone'
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.minLength(10),
                    FormBuilderValidators.required(),

                  ]),
                ),
                FormBuilderDropdown(
                    name: 'role',
                  initialValue: widget.user.role ,
                  items: [
                    DropdownMenuItem(value: 'admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'user', child: Text('User')),
                  ],
                ),
                AppSizes.gapH16,

                AppSizes.gapH20,
                InkWell(
                  onTap: (){
                    ref.read(imageControllerProvider.notifier).pickImage();
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Center(child:
                    image == null ?  Image.network(widget.user.image) : Image.file(File(image.path))),
                  ),
                ),
                AppSizes.gapH20,
                ElevatedButton(
                    onPressed: userState.isLoading ? null: (){
                      FocusScope.of(context).unfocus();
                      if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)){
                        final map = _formKey.currentState!.value;
                        if(image == null){
                          ref.read(userControllerProvider.notifier).userUpdate(

                              phone: int.parse(map['phone']),
                              email: map['email'],
                              username: map['username'],
                              role: map['role'],
                              userId: widget.user.uid,

                          );
                        }else{
                          ref.read(userControllerProvider.notifier).userUpdate(
                              image: image,
                              phone: int.parse(map['phone']),
                              email: map['email'],
                               username: map['username'],
                            role: map['role'],
                            userId: widget.user.uid,
                            imageId: widget.user.public_id
                          );
                        }

                      }else{
                        ref.read(validateModeControllerProvider(id: 6).notifier).change();
                      }
                    }, child: userState.isLoading ? CircularProgressIndicator(): Text('Submit')),
                AppSizes.gapH16,

              ],
            )
        ),
      ),
    );
  }
}
