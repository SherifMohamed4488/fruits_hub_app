import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Features/Profile/presentation/view_model/cubits/update_cubit.dart';
import 'package:fruits_hub/Features/Profile/presentation/view_model/cubits/update_states.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/widgets/personal_file_widgets/personal_text_field.dart';
import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/Shared/custom_button.dart';
import 'package:fruits_hub/Shared/custom_text_form_field.dart';
import 'package:fruits_hub/Shared/error_success_snack_bar.dart';
import 'package:fruits_hub/Shared/get_user.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../Core/constants/textStyles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:fruits_hub/Features/Profile/presentation/view_model/cubits/update_cubit.dart';
import 'package:fruits_hub/Features/Profile/presentation/view_model/cubits/update_states.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/widgets/personal_file_widgets/personal_text_field.dart';
import 'package:fruits_hub/Shared/custom_button.dart';
import 'package:fruits_hub/Shared/custom_text_form_field.dart';
import 'package:fruits_hub/Shared/error_success_snack_bar.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PersonalFileViewBody extends StatefulWidget {
  const PersonalFileViewBody({super.key});

  @override
  State<PersonalFileViewBody> createState() => _PersonalFileViewBodyState();
}

class _PersonalFileViewBodyState extends State<PersonalFileViewBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  UserEntity? userData ;
  @override
  void initState() {
    super.initState();

    getUser2().listen((data) {
      if (data != null) {
        nameController.text = data.name;
        emailController.text = data.email ;

        userData = data;// ✅ هنا تستخدم الحقل الصحيح
      }
    });
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserEntity?> (
      stream: getUser2(),
      builder: (context , snapshot) => BlocConsumer<UpdateCubit , UpdateStates>(
        listener:(context , state) {


          if(state is UpdateSuccess){

            isLoading = false;

            return errorAndSuccessSnackBar(context, "تم التحديث بنجاح", Colors.green);


          }
          if (state is UpdateFailure){

            isLoading = false;
            return errorAndSuccessSnackBar(context, state.message, Colors.red.shade800);

          }
        } ,
        builder:(context , state) => ModalProgressHUD(
          inAsyncCall: state is UpdateLoading,
          child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.w),
                        child: ListView(
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
          Text(
              'المعلومات الشخصيه',
              style: TextStyles.semiBold13.copyWith(color: const Color(0xFF0C0D0D) , height: 1.70)),
          Gap(8.h),
          PersonalTextField(
            textInputType: TextInputType.name,
            controller: nameController, // ✅ هنا مكانه الصحيح
            suffixIcon: Icon(
              Icons.edit,
              color: const Color(0xFF949D9E),
            ),
          ),

          Gap(8.h),
          PersonalTextField(
            enabled: false,
            textInputType: TextInputType.emailAddress,
            controller: emailController , // ✅ هنا مكانه الصحيح
            suffixIcon: Icon(
              Icons.edit,
              color: const Color(0xFF949D9E),
            ),
          ),
          // CustomTextFormField(
          //
          // readOnly: true,
          //   hintText:  snapshot.data?.email ?? "guest.gmail.com", textInputType: TextInputType.emailAddress , suffixIcon: Icon(Icons.edit , color: const Color(0xFF949D9E),),),
          Gap(24.h),

          Text(
              'تغيير كلمة المرور',
              style: TextStyles.semiBold13.copyWith(color: const Color(0xFF0C0D0D) , height: 1.70)),
          Gap(8.h),


          PersonalTextField(
            textInputType: TextInputType.name,
            hintText: "كلمة المرور الحالية",
            controller: currentPasswordController, // ✅ هنا مكانه الصحيح
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: const Color(0xFF949D9E),
            ),
          ),
          Gap(8.h),
          PersonalTextField(
            textInputType: TextInputType.name,
            hintText: "كلمة المرور الجديده",
            controller: newPasswordController, // ✅ هنا مكانه الصحيح
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: const Color(0xFF949D9E),
            ),
          ),
          Gap(8.h),
          PersonalTextField(
            textInputType: TextInputType.name,
            hintText:  "تأكيد كلمة المرور الجديده",
            controller: confirmPasswordController, // ✅ هنا مكانه الصحيح
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: const Color(0xFF949D9E),
            ),
          ),



          Gap(24.h),

          CustomButton(
            onPressed: () {
              bool newname = nameController.text != userData!.name;
              // bool newEmail = emailController.text != userData!.email;

              if (newname) {
                context.read<UpdateCubit>().updateUserName(name: nameController.text);
              }
              // else If{
              //   context.read<UpdateCubit>().updateUserName(name: nameController.text);
              //
              // }


              if (validatePasswordChange()){
                context.read<UpdateCubit>().changePassword(oldPassword: currentPasswordController.text, newPassword: newPasswordController.text);
              }

              // if(!newname & ) {
              //   errorAndSuccessSnackBar(contehxt, "⚠ No changes detected", Colors.grey.shade800);
              // }
            },

            text: "حفظ التغييرات",
          )

                              ],
                            ),
                          ]

                        ),
                      ),
        ),
      ),
    );
  }
  bool validatePasswordChange() {
    final current = currentPasswordController.text.trim();
    final newPass = newPasswordController.text.trim();
    final confirm = confirmPasswordController.text.trim();

    // لو كتب في الباسورد الحالية
    if(current.isEmpty){
      return false;
    }

    if (current.isNotEmpty) {

      if (newPass.isEmpty || confirm.isEmpty) {
        errorAndSuccessSnackBar(context,"لازم تكتب الباسورد الجديدة وتأكيدها" , Colors.grey.shade800);
        return false;
      }

      if (newPass != confirm) {
        errorAndSuccessSnackBar(context,"الباسورد الجديدة مش متطابقة" , Colors.grey.shade800);

        return false;
      }

      if (newPass.length < 6) {
        errorAndSuccessSnackBar(context,"الباسورد لازم تكون 6 أحرف على الأقل" , Colors.grey.shade800);
        return false;
      }
    }

    return true;
  }
}

