import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
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
    return FutureBuilder<UserEntity?>(
      future: getUser(),
      builder: (context, snapshot) {
        final name = snapshot.data?.name ?? 'Guest';

        return ListTile(
          leading: SvgPicture.asset("assets/images/profile_photo.svg"),
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
