import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';
import 'package:fruits_hub/Core/services/get_it_service.dart';
import 'package:fruits_hub/Features/Home/presentation/views/home_view.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/Features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/or_widget.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruits_hub/Shared/custom_app_bar.dart';
import 'package:fruits_hub/Shared/custom_button.dart';
import 'package:fruits_hub/Shared/custom_text_form_field.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../Core/constants/textStyles.dart';
import '../../../../../Shared/error_success_snack_bar.dart';
import '../../../../../gen/assets.gen.dart';
import '../../views_model/cubits/log_in/log_in_cubit.dart';
import '../../views_model/cubits/log_in/log_in_states.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context ) => LogInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(
          text: 'تسجيل دخول',
        ),

        body: LoginViewBodyBlocConsumer()
      ),
    );

  }
}

class LoginViewBodyBlocConsumer extends StatefulWidget {
   LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  State<LoginViewBodyBlocConsumer> createState() => _LoginViewBodyBlocConsumerState();
}

class _LoginViewBodyBlocConsumerState extends State<LoginViewBodyBlocConsumer> {
   bool isObsecure = false;

  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoVlidateMode = AutovalidateMode.disabled;

   late String email ,password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit , LogInStates>(
      listener: (context , state){

        if (state is LogInSuccess) {
          errorAndSuccessSnackBar(context, " successs log in" , Colors.green);
          Navigator.pushNamed(context, HomeView.routeName);
        }
        if (state is LogInFailure) {
          errorAndSuccessSnackBar(context, state.message , Colors.red);
        }

      },
      builder: (context , state){

       return ModalProgressHUD(
         inAsyncCall: state is LogInLoading ? true : false,
         child: SingleChildScrollView(

            child: Padding(
              padding:  EdgeInsets.all(16.sp),
              child: Form(
                key: formKey,
                autovalidateMode: autoVlidateMode,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                        onSaved: (value){
                          email = value!;
                        },
                        hintText: "البريد الإلكتروني",
                        textInputType: TextInputType.emailAddress
                    ),
                    Gap(20.h),
                    CustomTextFormField(
                      isObsecure: isObsecure,
                      onSaved: (value){
                        password = value!;
                      },
                      hintText: "كلمة المرور",
                      textInputType: TextInputType.visiblePassword,
                      suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() => isObsecure = ! isObsecure);
                          },
                          child: isObsecure ?  Icon(CupertinoIcons.eye_slash_fill , color: Color(0xffC9CECF),) :Icon(CupertinoIcons.eye_fill , color: Color(0xffC9CECF),)),

                    ),


                    Gap(16.h),
                    Text(
                        'نسيت كلمة المرور؟',
                        style: TextStyles.bold13.copyWith(height: 1.70 , color: AppColors.LightPrimaryColor)
                    ),

                    Gap(33.h),

                    CustomButton(onPressed: (){

                      if(formKey.currentState!.validate()){

                        formKey.currentState!.save();

                          context.read<LogInCubit>().logInWithEmailAndPassword(email, password);

                      }else{
                        setState(() {
                          autoVlidateMode = AutovalidateMode.always;
                        });
                      }
                    }, text: 'تسجيل دخول'
                    ),
                    Gap(33.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("ليس لديك حساب؟ " , style: TextStyles.semiBold16.copyWith(height: 1.40 , color: const Color(0xFF616A6B)),),
                        GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, SignUpView.routeName);
                            },
                            child: Text("قم بانشاء حساب", style:TextStyles.semiBold16.copyWith(height: 1.40 , color: const Color(0xFF1B5E37))))
                      ],),
                    Gap(33.h),

                    OrWidget(),



                    Gap(16.h),
                    SocialLogInButton( onTap: (){

                      context.read<LogInCubit>().logInWithGoogle();

                    }, image: Assets.images.googleLogo.path, text: 'تسجيل بواسطة جوجل'),
                    Gap(16.h),

                    Platform.isIOS ?
                    Column(
                      children: [
                        SocialLogInButton(onTap: (){}
                            ,image: Assets.images.appleLogo.path, text:' تسجيل بواسطة أبل'),
                        Gap(16.h),
                      ],
                    ) : SizedBox(),


                    SocialLogInButton(onTap: (){

                      context.read<LogInCubit>().logInWithFacebook();

                    } , image: Assets.images.facebookLogo.path, text:" تسجيل بواسطة فيسبوك"),

                  ],

                ),
              ),
            ),
          ),
       );
      }

    );
  }
}
