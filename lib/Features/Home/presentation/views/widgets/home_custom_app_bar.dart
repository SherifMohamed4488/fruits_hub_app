import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:fruits_hub/Features/ProductsView/data/photo_cubit/photo_cubit.dart';
import 'package:fruits_hub/Features/ProductsView/data/photo_cubit/photo_states.dart';
import 'package:fruits_hub/Shared/get_user.dart';

import '../../../../auth/domain/entities/user_entity.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


// class HomeCustomAppBar extends StatelessWidget {
//   const HomeCustomAppBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     UserEntity? user;
//
//     void init() async {
//       user = await getUser();
//     }
//
//     final name = user?.name ?? 'Guest';
//
//     return ListTile(
//       leading: SvgPicture.asset("assets/images/profile_photo.svg"),
//       title: Text(
//         'صباح الخير !..',
//         textAlign: TextAlign.right,
//         style: TextStyles.regular16.copyWith(
//           color: const Color(0xFF949D9E),
//           height: 1.40,
//         ),
//       ),
//       subtitle: Text(
//         name,
//         style: TextStyles.bold16.copyWith(
//           color: const Color(0xFF0C0D0D),
//         ),
//       ),
//       trailing: Container(
//         width: 35.w,
//         height: 35.h,
//         decoration: const ShapeDecoration(
//           color: Color(0xFFEEF8ED),
//           shape: OvalBorder(),
//         ),
//         child: Center(
//           child: SvgPicture.asset("assets/images/bell_logo.svg"),
//         ),
//       ),
//     );
//   }
// }

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserEntity?>(
      stream: getUser2(),
      builder: (context, snapshot) {
        final name = snapshot.data?.name ?? 'Guest';

        return ListTile(
          leading: BlocBuilder<PhotoCubit, PhotoStates>(
            builder: (context, state) {
              if (state is PhotoLoading) {
                return SizedBox(
                  height: 15.h,
                  width: 15.w,
                  child: const CircularProgressIndicator(),
                );
              } else if (state is PhotoSuccess) {
                // show the new photo from Cubit
                return CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(state.downloadUrl),
                );
              } else if (snapshot.data != null && snapshot.data!.photoUrl.isNotEmpty) {
                // fallback: show persisted photo from Prefs
                return CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(snapshot.data!.photoUrl),
                );
              } else {
                // fallback: show default asset if no photo yet
                return CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person , color: Colors.grey.shade700,),
                );;
              }
            },
          ),


          title: Text(
            'صباح الخير !..',
            textAlign: TextAlign.right,
            style: TextStyles.regular16.copyWith(
              color: const Color(0xFF949D9E),
              height: 1.40,
            ),
          ),
          subtitle: Text(
            name,
            style: TextStyles.bold16.copyWith(
              color: const Color(0xFF0C0D0D),
            ),
          ),
          trailing: Container(
            width: 35.w,
            height: 35.h,
            decoration: const ShapeDecoration(
              color: Color(0xFFEEF8ED),
              shape: OvalBorder(),
            ),
            child: Center(
              child: SvgPicture.asset("assets/images/bell_logo.svg"),
            ),
          ),
        );
      },
    );
  }
}
