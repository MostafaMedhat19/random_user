import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/providers/register_provider.dart';
import 'package:random_user/screens/random_user_screen.dart';
import 'package:random_user/screens/signup_screen.dart';

import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  TextEditingController emailController = TextEditingController() ;
   TextEditingController passwordController = TextEditingController() ;
   @override
  Widget build(BuildContext context) {
     var obj = Provider.of<RegisterProvider>(context ,listen:  false);
     var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          Form(
            key: formKey ,
            child: Column(
              children: [
                CustomTextField(controller: emailController, title: 'Enter Email' ,icon: Icons.email,),
                CustomTextField(controller: passwordController, title: 'Enter password' , icon: Icons.password,),
                TextButton(onPressed: ()async {

                  await  obj.loginUser(emailController.text, passwordController.text);
                       var status = await obj.model?.status;
                       if(formKey.currentState!.validate() && status == true)
                         {
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(obj.model!.message),));
                            Navigator.push(context, MaterialPageRoute(builder:  (context) =>  const RandomUserScreen(),));
                         }
                         else
                           {
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(obj.model!.message),));
                           }
                    }
                , child:const Text('Login')),
                Center(
                  child: TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:  (context) =>  SignupScreen(),));
                  }, child:const Text('Go to SignUp')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
