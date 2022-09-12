import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/shared/widges/auth_background.dart';
import 'package:admin_dashboard/ui/shared/widges/card_container.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox( height: 350 ),

              CardContainer(
                child: Column(
                  children: [
                    SizedBox( height: 20 ),
                    Text('Login', style: Theme.of(context).textTheme.headline4 ),
                    SizedBox( height: 30 ),   

                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm(), 
                    )                                                     
                  ],
                )
              ),
            ],
          ),
        )
      )
   );
  }
}
//////////////////////////////////////////////////////////////////////////////

class _LoginForm extends StatelessWidget {

  const _LoginForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
final authProvider = Provider.of<AuthProvider>(context);   
 final loginFormProvider = Provider.of<LoginFormProvider>(context,listen:false);
    return Container(
          
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Form(

           autovalidateMode: AutovalidateMode.always,  // Valida los campos de manera automática
           key: loginFormProvider.formKey,       //Actualiza la llave
            child: Column(
              children: [
                
                //email
                TextFormField(
                  onFieldSubmitted:(_)=>onFormSubmit(loginFormProvider,authProvider),
                  validator:(value){
                    if(!EmailValidator.validate(value ?? ''))  return 'Email no valido';
                    return null;
                  },
                  onChanged:(value) => loginFormProvider.email=value,
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint:'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email_outlined,
                  ),
                ),
                SizedBox(height: 20),  
                //Contraseña
                TextFormField(
                  onFieldSubmitted:(_)=>onFormSubmit(loginFormProvider,authProvider),
                  onChanged:(value) => loginFormProvider.password=value,
                  validator:(value){
                    if(value==null || value.isEmpty ) return 'Ingrese su contraseña';
                    if(value.length<6) return 'La contrseña debe tener 6 caracteres';
                    
                    return null;  //Valido
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint:'*********',
                    label: 'Contraseña',
                    icon: Icons.lock_outlined,
                  ),
                ),
    
                SizedBox(height: 20), 
                
                CustomOutlinedButton(
                  onPressed: ()=>onFormSubmit(loginFormProvider,authProvider),
                  text: 'Ingresar',
                  ),
                
                SizedBox(height: 20), 
    
                LinkText(text: 'Nueva Cuenta',onPressed: (){
                  Navigator.pushReplacementNamed(context, Flurorouter.registerRoute);
                },
                setcolor: Colors.blue),               
    
              ],
            ),
          ),
          ),
    
      );
  }

 void onFormSubmit(LoginFormProvider loginFormProvider, AuthProvider authProvider){
      final isValid = loginFormProvider.validateForm(); 
      if(isValid)
      authProvider.login(loginFormProvider.email,loginFormProvider.password);
  } 
}