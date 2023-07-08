import 'package:ecommerce/my_theme.dart';
import 'package:ecommerce/providers/Auth_provider.dart';
import 'package:ecommerce/ui/home/home_screen.dart';
import 'package:ecommerce/ui/login/login_screen.dart';
import 'package:ecommerce/ui/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/validation utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/Custom_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register screen';
  var formkey = GlobalKey<FormState>();
  var namecontroller = TextEditingController(text: "bashar walid");
  var Emailcontroller = TextEditingController(text: "basharwalid2002@gmail.com");
  var mobilecontroller = TextEditingController(text: "01016309078");
  var Passwordcontroller = TextEditingController(text: "123456");
  var PasswordConfirmcontroller = TextEditingController(text: "123456");
  var viewModel = RegisterViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterViewModel , RegisterViewState>
      (
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
        print("User Registered successfully");
        UserProvider userProvider = BlocProvider.of<UserProvider>(context ,listen: false);
        userProvider.Login(LoggedInState(state.response.user! , state.response.token!));
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      }
      },
      builder:(context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80,),
                  Image.asset("assets/images/route_logo_big.png"),
                  Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomFormField(
                          hint: "Enter your Full name",
                          controller: namecontroller,
                          label: "Full name",
                          validator:(text){
                            if(text==null || text.trim().isEmpty){
                              return 'please Enter Full name';
                            }
                            return null;
                          },
                        ),
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
                          hint: "enter your Mobile number",
                          controller: mobilecontroller,
                          label: "Mobile no.",
                          keyboardtype: TextInputType.phone,
                          validator: (text) {
                            if(text==null || text.trim().isEmpty){
                              return 'please Enter mobile no.';
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
                        CustomFormField(
                          hint: "re-enter your password",
                          validator:(text){
                            if(text==null || text.trim().isEmpty){
                              return 'please Enter Password confirmation';
                            }
                            if(Passwordcontroller.text != text){
                              return "Password doesn't match";
                            }
                            return null;
                          },
                          controller: PasswordConfirmcontroller,
                          label: "Confirm Password",
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
                              register();
                            }, child: const Text("Register" ,
                          style: TextStyle(
                              fontSize: 24
                          ),
                        )
                        ),
                        Row(
                          children: [
                            Text("Already have account ?",
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            TextButton(onPressed: (){
                              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                            }, child: const Text("Log in" ,
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
                ],
              ),
            ),
          ),
        );
      },
    )
      ;
  }
  void register() async{
    if(formkey.currentState!.validate()== false){
      return;
    }
    viewModel.Register(namecontroller.text, Emailcontroller.text, Passwordcontroller.text, PasswordConfirmcontroller.text, mobilecontroller.text);
  }
}