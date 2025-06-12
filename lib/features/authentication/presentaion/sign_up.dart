import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart';
import 'package:flutter_proj/features/authentication/presentaion/controllers/sign_up_provider.dart';
import 'package:flutter_proj/features/shared/validator_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';


class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});
  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(signUpControllerProvider, (prev, next){
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

    final signUpState = ref.watch(signUpControllerProvider);
    final mode = ref.watch(validateModeControllerProvider(id: 2));
    final passShow = ref.watch(passControllerProvider(id: 2));


    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp Page'),
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
                  name: 'password',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: passShow ? false : true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(onPressed: (){
                        ref.read(passControllerProvider(id: 2).notifier).change();
                      }, icon: Icon( passShow ? Icons.lock_open : Icons.lock))
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.minLength(5),
                    FormBuilderValidators.maxLength(40),
                    FormBuilderValidators.required(),
                  ]),
                ),
                AppSizes.gapH20,

                AppSizes.gapH20,
                ElevatedButton(
                    onPressed: signUpState.isLoading ? null: (){
                      FocusScope.of(context).unfocus();
                      if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)){
                        final map = _formKey.currentState!.value;
                        ref.read(signUpControllerProvider.notifier).userSignUp(map);

                      }else{
                        ref.read(validateModeControllerProvider(id: 2).notifier).change();
                      }
                    }, child: signUpState.isLoading ? CircularProgressIndicator(): Text('Submit')),
                AppSizes.gapH16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have Account'),
                    TextButton(onPressed: (){
                      context.pop();
                    }, child: Text('Login')),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}
