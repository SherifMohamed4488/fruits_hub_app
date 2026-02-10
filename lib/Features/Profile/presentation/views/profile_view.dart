import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/services/database_service.dart';
import 'package:fruits_hub/Features/Profile/presentation/view_model/cubits/update_cubit.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/widgets/profile_view_body.dart';

import '../../../../Core/constants/textStyles.dart';
import '../../../../Core/services/get_it_service.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return



       Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'حسابي',
            textAlign: TextAlign.center,
            style: TextStyles.bold19.copyWith(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: const ProfileViewBody(),

    );
  }
}

