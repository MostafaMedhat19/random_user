import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/screens/login_screen.dart';

import '../providers/register_provider.dart';
import '../widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});
  TextEditingController emailController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController() ;
   TextEditingController phoneController = TextEditingController() ;
   TextEditingController nameController = TextEditingController() ;
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
                CustomTextField(controller: nameController, title: 'Enter name' , icon: Icons.supervised_user_circle,),
                CustomTextField(controller: passwordController, title: 'Enter password' ,icon: Icons.password,),
                CustomTextField(controller: phoneController, title: 'Enter phone',icon: Icons.phone),
                CustomTextField(controller: emailController, title: 'Enter email' , icon: Icons.email,),

                TextButton(onPressed: () async{

                  await obj.signUp(emailController.text, passwordController.text, nameController.text, phoneController.text);
                    var status = await obj.model?.status;
                    if(formKey.currentState!.validate() && status == true )
                    {
                      Navigator.push(context, MaterialPageRoute(builder:  (context) =>  LoginScreen(),));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(obj.model!.message),));
                    }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(obj.model!.message),));
                      }

                  }
                , child:const Text('SignUp')),
                Center(
                  child: TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:  (context) =>  LoginScreen(),));
                  }, child:const Text('Go to SignIn')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
