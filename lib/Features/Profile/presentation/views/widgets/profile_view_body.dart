import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:fruits_hub/Features/ProductsView/data/photo_cubit/photo_states.dart';
import 'package:fruits_hub/Features/Profile/presentation/view_model/cubits/update_cubit.dart';
import 'package:fruits_hub/Features/Profile/presentation/view_model/cubits/update_states.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/who_are_we_view.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/widgets/logout_alert_dialog.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/widgets/profile_item_list_view.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/widgets/sliding_toggle.dart';
import 'package:fruits_hub/Features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/Features/auth/presentation/views_model/cubits/log_in/log_in_cubit.dart';
import 'package:fruits_hub/Shared/get_user.dart';
import 'package:fruits_hub/Shared/internal_custom_app_bar.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../ProductsView/data/photo_cubit/photo_cubit.dart';
import '../../../../auth/domain/entities/user_entity.dart';
//

// class ProfileViewBody extends StatefulWidget {
//   const ProfileViewBody({super.key});
//
//   @override
//   State<ProfileViewBody> createState() => _ProfileViewBodyState();
// }
//
// class _ProfileViewBodyState extends State<ProfileViewBody> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<UpdateCubit>().loadUser(); // تحميل أولي + يبدأ الاستماع
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: BlocBuilder<UpdateCubit, UpdateStates>(
//         builder: (context, state) {
//           String name = "guest";
//           String email = "guest";
//
//           if (state is UpdateSuccess) {
//             final user = state.user;
//             name = user.name;
//             email = user.email;
//           }
//
//           if (state is UpdateLoaded) {
//             final user = state.user;
//             name = user.name;
//             email = user.email;
//           }
//
//
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 30.r,
//                     backgroundImage: const NetworkImage("https://..."),
//                   ),
//                   Gap(24.w),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(name, style: TextStyles.semiBold13),
//                       Text(
//                         email,
//                         style: TextStyles.semiBold13.copyWith(
//                           color: const Color(0xFF888FA0),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Gap(16.h),
//               Text('عام', style: TextStyles.semiBold13.copyWith(height: 1.70)),
//               Gap(16.h),
//                ProfileItemListView(),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      context.read<PhotoCubit>().updatePhoto(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCubit , UpdateStates>(
      builder: (context , state) {
        return StreamBuilder<UserEntity?>(
          stream: getUser2(),
          builder: (context, snapshot) {
            final name = snapshot.data?.name ?? "guest";
            final email = snapshot.data?.email ?? "guest";

            return Column(
              children: [
                // --- Avatar + Name + Email ---
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                BlocBuilder<PhotoCubit, PhotoStates>(
                                  builder: (context, photoState) {
                                    Widget avatar;

                                    // 1️⃣ صورة محلية تم اختيارها
                                    if (_image != null) {
                                      avatar = CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage: FileImage(_image!),
                                      );
                                    }
                                    // 2️⃣ صورة من السيرفر
                                    else if (photoState is PhotoSuccess &&
                                        photoState.downloadUrl.isNotEmpty) {
                                      avatar = CircleAvatar(
                                        radius: 30.r,
                                        backgroundColor: Colors.grey.shade300,
                                        backgroundImage: NetworkImage(photoState.downloadUrl),
                                      );
                                    }
                                    // 3️⃣ placeholder أيقونة
                                    else {
                                      avatar = CircleAvatar(
                                        radius: 30.r,
                                        backgroundColor: Colors.grey.shade300,
                                        child: Icon(
                                          Icons.photo_library,
                                          color: Colors.grey.shade800,
                                        ),
                                      );
                                    }

                                    return GestureDetector(
                                      onTap: () => _pickImage(ImageSource.gallery),
                                      child: avatar,
                                    );
                                  },
                                ),

                                Gap(24.w),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(name, style: TextStyles.semiBold13),
                                    Text(
                                      email,
                                      style: TextStyles.semiBold13.copyWith(
                                        color: const Color(0xFF888FA0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Gap(12.h),

                            // --- Delete button ---
                            BlocBuilder<PhotoCubit, PhotoStates>(
                              builder: (context, photoState) {
                                final hasPhoto =
                                    _image != null ||
                                    (photoState is PhotoSuccess &&
                                        photoState.downloadUrl.isNotEmpty);

                                return Visibility(
                                  visible: hasPhoto,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() => _image = null);
                                          context.read<PhotoCubit>().deletePhoto();
                                        },
                                        child: Container(
                                          width: 70.w,
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.r),
                                            color: Colors.red.shade800,
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "حذف",
                                                  style: TextStyles.regular13.copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Gap(6.w),
                                                Icon(
                                                  CupertinoIcons.trash,
                                                  color: Colors.white,
                                                  size: 14.sp,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),

                        // Gap(16.h),
                        Text('عام', style: TextStyles.semiBold13.copyWith(height: 1.70)),
                        Gap(16.h),
                        ProfileItemListView(),
                        Divider(color: const Color(0xFFF2F3F3)),

                        // --- Example Toggle Row ---
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.bell,
                              color: const Color(0xFF1B5E37),
                              size: 17.sp,
                            ),
                            Gap(7.w),
                            Text(
                              "الاشعارات",
                              style: TextStyles.semiBold13.copyWith(
                                color: const Color(0xFF949D9E),
                                height: 1.70,
                              ),
                            ),
                            Spacer(),
                            SlidingToggle(),
                          ],
                        ),
                        Divider(color: const Color(0xFFF2F3F3)),
                        Row(
                          children: [
                            Icon(
                              Icons.edit_note_rounded,
                              color: const Color(0xFF1B5E37),
                              size: 20.sp,
                            ),
                            Gap(7.w),
                            Text(
                              "الوضع",
                              style: TextStyles.semiBold13.copyWith(
                                color: const Color(0xFF949D9E),
                                height: 1.70,
                              ),
                            ),
                            Spacer(),
                            SlidingToggle(),
                          ],
                        ),
                        Divider(color: const Color(0xFFF2F3F3)),
                        Gap(22.h),
                        Text(
                          'المساعده',
                          style: TextStyles.semiBold13.copyWith(
                            height: 1.70,
                            color: const Color(0xFF0C0D0D),
                          ),
                        ),
                        Gap(16.h),
                        Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: const Color(0xFF1B5E37),
                              size: 16.sp,
                            ),
                            Gap(7.w),
                            Text(
                              "من نحن",
                              style: TextStyles.semiBold13.copyWith(
                                color: const Color(0xFF949D9E),
                                height: 1.70,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, WhoAreWeView.routeName);
                              },
                              child: Icon(Icons.arrow_forward_ios, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Gap(165.h),

                // --- Logout Row ---
                GestureDetector(
                  onTap: (){

                    showDialog( context: context, builder: (context) => const LogoutAlertDialog(), );
                  },
                  child: Container(
                    width: 375.w,
                    height: 41.h,
                    decoration: BoxDecoration(color: const Color(0xFFEBF9F1)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 55.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'تسجيل الخروج',
                            textAlign: TextAlign.center,
                            style: TextStyles.semiBold13.copyWith(
                              color: const Color(0xFF1B5E37),
                              height: 1.70,
                            ),
                          ),
                          Gap(82.w),
                          SvgPicture.asset("assets/images/logout_icon.svg"),
                        ],
                      ),
                    ),
                  ),
                ),

                Gap(25.h),
              ],
            );
          },
        );
      }
    );
  }
}
