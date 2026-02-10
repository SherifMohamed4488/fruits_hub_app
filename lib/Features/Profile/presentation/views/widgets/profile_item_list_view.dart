import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/favourite_view.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/personal_file_view.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/widgets/profile_item.dart';

class ProfileItemListView extends StatelessWidget {
   ProfileItemListView({super.key});

  List<String> names  = [
    "الملف الشخصي" , "طلباتي" , "المدفوعات" , "المفضلة"];

  List<IconData> icons = [Icons.person , CupertinoIcons.cube , Icons.payment_sharp,Icons.favorite_border_rounded ];
   List<String> routeNames = [PersonalFileView.routeName , PersonalFileView.routeName, PersonalFileView.routeName, FavouriteView.routeName];
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
      separatorBuilder: (context ,index) =>
      Divider(
      color: const Color(0xFFF2F3F3)),
        scrollDirection:Axis.vertical,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ProfileItem(icon: icons[index], text: names[index], onTap: (){

            Navigator.pushNamed(context, routeNames[index]);
          });
          // FruitItem(productEntity: ,\);
        },


      ),
    );
  }
}
