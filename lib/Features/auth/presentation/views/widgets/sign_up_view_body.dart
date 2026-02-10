import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/services/get_it_service.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:fruits_hub/Features/auth/presentation/views_model/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruits_hub/Features/auth/presentation/views_model/cubits/sign_up_cubit/sign_up_states.dart';
import 'package:fruits_hub/Shared/custom_app_bar.dart';
import 'package:fruits_hub/Shared/error_success_snack_bar.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../Core/constants/textStyles.dart';
import '../../../../../Shared/custom_button.dart';
import '../../../../../Shared/custom_text_form_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context ) => SignUpCubit(getIt.get<AuthRepo>()),
      child: Scaffold(

        appBar:CustomAppBar(text: "حساب جديد"),
        body: SignUpBlocConsumer(),
      ),
    );
  }
}

class SignUpBlocConsumer extends StatefulWidget {
   SignUpBlocConsumer({
    super.key,
  });

  @override
  State<SignUpBlocConsumer> createState() => _SignUpBlocConsumerState();
}

class _SignUpBlocConsumerState extends State<SignUpBlocConsumer> {
   bool isTermsAccept = false ;
   bool isObsecure = false;

   final GlobalKey<FormState> formKey = GlobalKey();

   AutovalidateMode autoVlidateMode = AutovalidateMode.disabled;

  late String email , name ,password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit , SignUpStates>(
      listener: (context, state){

        if (state is SignUpSuccess) {
          errorAndSuccessSnackBar(context, " successs register" , Colors.green);
          Navigator.pop(context);
        }
        if (state is SignUpFailure) {
          errorAndSuccessSnackBar(context, state.message , Colors.red);
        }
      },

      builder: (context, state){
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
          child: SingleChildScrollView(

            child: Padding(
              padding:  EdgeInsets.all(16.sp),
              child: Form(
                key: formKey,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      onSaved: (value){
                        name = value!;
                      },
                        hintText: "الاسم كامل", textInputType: TextInputType.name),
                    Gap(16.h),

                    CustomTextFormField(
                        onSaved: (value){
                          email = value!;
                        },
                        hintText: "البريد الإلكتروني", textInputType: TextInputType.emailAddress),
                    Gap(16.h),
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

                    // Padding(
                    //   padding: EdgeInsets.only(left: 16.w),
                    //   child: Row(
                    //     children: [
                    //       Checkbox(
                    //
                    //           activeColor: Color(0xffEF2A39),
                    //           value: checked,
                    //           onChanged: (v){
                    //             setState(() {
                    //               checked = !checked;
                    //             });
                    //           }),
                    //       // Gap(9.w),
                    //
                    //     ],
                    //   ),
                    // ),
                    TermsAndConditions(
                      valueChanged: (value){
                        isTermsAccept = value;
                      },
                    ),

                    Gap(33.h),

                    CustomButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){

                            formKey.currentState!.save();

                            if (isTermsAccept) {
                              context.read<SignUpCubit>().createUserWithEmailAndPassword(email, password, name);
                            }else{

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(content: Text("you should accept terms and conditions ")),
                                );
                            }

                          }else{
                            setState(() {
                              autoVlidateMode = AutovalidateMode.always;
                            });
                          }

                        }, text: 'إنشاء حساب جديد'
                    ),
                    Gap(26.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("تمتلك حساب بالفعل؟ " , style: TextStyles.semiBold16.copyWith(height: 1.40 , color: const Color(0xFF616A6B)),),
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text("تسجيل دخول", style:TextStyles.semiBold16.copyWith(height: 1.40 , color: const Color(0xFF1B5E37))))
                      ],),
                    Gap(33.h),






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
