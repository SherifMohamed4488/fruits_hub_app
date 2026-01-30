
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/bottom_navigation_bar_entity.dart';
import 'active_navigation_bar_item.dart';
import 'in_active_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 70.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          final index = e.key;
          final entity = e.value;

          final isSelected = index == currentIndex;

          return Expanded(
            flex: isSelected ? 3 : 2,
            child: GestureDetector(
              onTap: () => onItemSelected(index),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 120),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: Tween<double>(begin: 0.9, end: 1.0)
                        .animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: NavigationBarItem(
                  key: ValueKey(isSelected),
                  isSelected: isSelected,
                  bottomNavigationBarEntity: entity,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 120),
      scale: isSelected ? 1.03 : 1.0,
      curve: Curves.easeOut,
      child: isSelected
          ? ActiveNavigationBarItem(
        text: bottomNavigationBarEntity.name,
        image: bottomNavigationBarEntity.activeImage,
      )
          : InActiveNavigationBarItem(
        image: bottomNavigationBarEntity.inActiveImage,
      ),
    );
  }
}



//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fruits_hub/Features/Home/domain/entities/bottom_navigation_bar_entity.dart';
// import 'package:fruits_hub/Features/Home/presentation/views/widgets/active_navigation_bar_item.dart';
// import 'package:fruits_hub/Features/Home/presentation/views/widgets/in_active_navigation_bar_item.dart';
//
// class CustomBottomNavigationBar extends StatefulWidget {
//    CustomBottomNavigationBar({super.key});
//
//   @override
//   State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
// }
//
// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int selectedIndex = 0 ;
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       width: 375.w,
//       height: 70.h,
//       decoration: ShapeDecoration(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30.r),
//             topRight: Radius.circular(30.r),
//           ),
//         ),
//         shadows: [
//           BoxShadow(
//             color: Color(0x19000000),
//             blurRadius: 25,
//             offset: Offset(0, -2),
//             spreadRadius: 0,
//           )
//         ],
//       ),
//       child: Row(
//         children: bottomNavigationBarItems.asMap().entries.map((e){
//
//
//           var index = e.key;
//           var entity = e.value;
//
//           return Expanded(
//               flex: index == selectedIndex ? 3 : 2,
//               child: GestureDetector(
//                   onTap: (){
//
//                     setState(() => selectedIndex = index );
//                     ;
//                   },
//                   child: AnimatedSwitcher(
//
//                       duration: const Duration(milliseconds: 100),
//                       transitionBuilder: (child, animation) {
//                         return ScaleTransition(
//                           scale: Tween<double>(begin: 0.9, end: 1.0).animate(animation),
//                           child: FadeTransition(
//                             opacity: animation,
//                             child: child,
//                           ),
//                         );
//                       },
//                       child: NavigationBarItem(
//                         key: ValueKey(selectedIndex == index),
//                         isSelected: selectedIndex == index , bottomNavigationBarEntity: entity,))));
//
//         }).toList()
//         ,
//       ),
//     );
//   }
// }
//
//
// class NavigationBarItem extends StatelessWidget {
//   NavigationBarItem({ super.key, required this.isSelected , required this.bottomNavigationBarEntity});
//   bool isSelected ;
//   BottomNavigationBarEntity bottomNavigationBarEntity;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedScale(
//       duration: const Duration(milliseconds: 100),
//       scale: isSelected ? 1.03 : 1.0,
//       curve: Curves.easeOut,
//       child: isSelected ? ActiveNavigationBarItem(
//
//         text: bottomNavigationBarEntity.name,
//         image: bottomNavigationBarEntity.activeImage,
//       ) : InActiveNavigationBarItem(image: bottomNavigationBarEntity.inActiveImage)
//     );
//
//   }
// }
//
//
// //
