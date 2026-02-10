import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/widgets/personal_file_widgets/personal_file_view_body.dart';

import '../../../../Core/constants/textStyles.dart';
import '../../../../Core/services/database_service.dart';
import '../../../../Core/services/get_it_service.dart';
import '../view_model/cubits/update_cubit.dart';

class PersonalFileView extends StatelessWidget {
  const PersonalFileView({super.key});

  static const routeName = "personal_file_view";

  @override
  Widget build(BuildContext context) {
    return
       GestureDetector(
         behavior: HitTestBehavior.translucent, // 👈 هذا هو المفتاح
         onTap: (){
           FocusScope.of(context).unfocus();
         },
         child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
             leading: GestureDetector(
               onTap: (){
                 Navigator.pop(context);
               },

                 child: Icon(Icons.arrow_back_ios)),
            centerTitle: true,
            title: Text(
              'الملف الشخصي',
              textAlign: TextAlign.center,
              style: TextStyles.bold19.copyWith(color: Colors.black),

            ),
          ),

          body: PersonalFileViewBody(),

             ),
       );
  }
}
