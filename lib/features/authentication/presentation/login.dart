import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart';
import 'package:flutter_proj/features/authentication/presentation/controllers/login_controller.dart';
import 'package:flutter_proj/features/shared/validator_provider.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {

    ref.listen(loginControllerProvider, (previous, next){
      next.maybeWhen(
        orElse: () => null,
        error:  (err, st) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1),
          content: Text(err.toString()),))
      );
    });


    final loginState = ref.watch(loginControllerProvider);
    final mode = ref.watch(validateModeControllerProvider(id: 1));
    final passShow = ref.watch(passControllerProvider(id: 1));


    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormBuilder(
          autovalidateMode: mode,
          key: _formKey,
            child: ListView(
              children: [
                FormBuilderTextField(
                    name: 'email',
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.email(),
                    FormBuilderValidators.required(),
                  ]),
                ),
                AppSizes.gapH20,
                FormBuilderTextField(
                  obscureText:passShow ? false : true,
                  name: 'password',
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(onPressed: (){
                      ref.read(passControllerProvider(id: 1).notifier).change();
                    }, icon: Icon(passShow ? Icons.lock_open : Icons.lock)),

                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.minLength(5),
                    FormBuilderValidators.maxLength(40),
                    FormBuilderValidators.required(),
                  ]),
                ),
                AppSizes.gapH20,
                ElevatedButton(
                    onPressed:loginState.isLoading ? null : (){
                      FocusScope.of(context).unfocus();
                  if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)){
                    final map = _formKey.currentState!.value;
                    ref.read(loginControllerProvider.notifier).userLogin(email: map['email'], password: map['password']);
                  }else{
                    ref.read(validateModeControllerProvider(id: 1).notifier).change();
                  }
                }, child: loginState.isLoading ? CircularProgressIndicator() : Text('Submit')),
                AppSizes.gapH20,
                AppSizes.gapH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an Account?'),
                    TextButton(onPressed: (){
                      context.pushNamed(AppRoute.signup.name);
                    }, child: Text('SignUp')),
                  ],
                )
              ],

            )
        ),
      ),
    );
  }
}
