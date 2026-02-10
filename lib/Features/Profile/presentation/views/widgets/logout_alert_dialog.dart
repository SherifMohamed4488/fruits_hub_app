import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/constants/textStyles.dart';
import '../../../../auth/presentation/views/login_view.dart';
import '../../../../auth/presentation/views_model/cubits/log_in/log_in_cubit.dart';



class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 6.w),
      contentPadding: EdgeInsets.zero,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      // title: Text('Success' , style: Styles.style20InterBold,),
      content:

      LogoutWidget(),

    ); ;
  }
}

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 173.h,
      width: 340.w,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w , vertical: 16.h),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 285.w),
              child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close , color: Colors.black,)),
            ),

            Gap(12.h),
            Text(
                'هل ترغب في تسجيل الخروج ؟',
                textAlign: TextAlign.center,
                style: TextStyles.bold16.copyWith( color: const Color(0xFF0C0D0D) )
            ),
            Gap(29.h),
            Row(
              children: [
                CustomLogoutButton(isLogoutButton: true, text: "تأكيد" , onTap: (){

                  context.read<LogInCubit>().logOut();
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                },),
                Gap(8.w),
                CustomLogoutButton(isLogoutButton: false, text: "لا ارغب" , onTap: (){
                  Navigator.pop(context);
                },),

              ],
            )

          ],
        ),
      ),
    );
  }
}

class CustomLogoutButton extends StatelessWidget {
  CustomLogoutButton({required this.isLogoutButton , required this.text , required this.onTap});

  bool isLogoutButton ;
  String text ;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 146.w,
        height: 48.h,

        decoration:
        isLogoutButton ?

        ShapeDecoration(
          color: const Color(0xFF1B5E37) /* Green1-500 */,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ):
        ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: const Color(0xFF1B5E37) /* Green1-500 */,
            ),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Center(
          child: Text(
              text,

              style: TextStyles.bold16.copyWith(color: isLogoutButton ? Colors.white : AppColors.PrimaryColor)
          ),
        ),
      ),
    );

  }
}
