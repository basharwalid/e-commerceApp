import 'package:ecommerce/api/User.dart';
import 'package:ecommerce/my_theme.dart';

import 'package:ecommerce/ui/login/login_view_model.dart';
import 'package:ecommerce/ui/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/validation utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../providers/Auth_provider.dart';
import '../components/Custom_form_field.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'Login screen';
  var formkey = GlobalKey<FormState>();
  var Emailcontroller = TextEditingController(text: "basharwalid2002@gmail.com");
  var Passwordcontroller = TextEditingController(text: "123456");
  var viewModel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewModel , LoginViewState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if(current is FailState || current is SuccessState || current is LoadingState)return true;
        return false;
      },
      buildWhen: (previous, current) {
        if(current is InitialState)return true;
        return false;
      },
      listener:(context, state) {
        if(state is FailState){
          print(state.message?? state.exception.toString() ,);
        }else if(state is LoadingState){
          print(state.LoadingMessage??"Loading...");
        }else if(state is SuccessState){
          print("User Logged in successfully");
          UserProvider userProvider = BlocProvider.of<UserProvider>(context ,listen: false);
          userProvider.Login(LoggedInState(state.response.user! , state.response.token!));
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80,),
                Image.asset("assets/images/route_logo_big.png"),
                Text("Welcome Back to Route" ,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text("Please sign in with your mail",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        CustomFormField(
                          hint: "enter your email address",
                          controller: Emailcontroller,
                          label: "Email",
                          keyboardtype: TextInputType.emailAddress,
                          validator: (text) {
                            if(text==null || text.trim().isEmpty){
                              return 'please Enter email';
                            }
                            if (!validationUtils.isValidEmail(text))
                            {
                              return "please enter a valid email";
                            }
                            return null;
                          },
                        ),
                        CustomFormField(
                          hint: "enter your password",
                          validator: (text){
                            if(text==null || text.trim().isEmpty){
                              return 'please Enter Password';
                            }
                            if(text.length>6){
                              return 'Password should be at least 6 chars';
                            }
                            return null;
                          },
                          controller: Passwordcontroller,
                          label: "Password",
                          ispassword: true,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                                padding: const EdgeInsets.symmetric(vertical: 12)),
                            onPressed: (){
                              login();
                            }, child: const Text("Login" ,
                          style: TextStyle(
                              fontSize: 24
                          ),
                        )
                        ),
                        Row(
                          children: [
                             Text("Don't have account ?",
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            TextButton(onPressed: (){
                              Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                            }, child: const Text("Create One" ,
                              style: TextStyle(
                                fontSize: 18,
                               color: Colors.blueAccent
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void login() async{
    if(formkey.currentState!.validate()== false){
      return;
    }
    viewModel.login(Emailcontroller.text, Passwordcontroller.text);
  }
}
