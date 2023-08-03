import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/Login/login_cubit.dart';
import 'package:nuri/ui/screen/login/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<LoginCubit>().checkAutoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if(state.loginStatus == LoginStatus.finish) {
          return NuriScaffold(
            isInBottomNavigation: true,
          );
        }
        if(state.loginStatus == LoginStatus.loading) {
          return Container();
        }
        return NuriScaffold(isInAppbar: false, child: const LoginScreen());
      },
    );
  }
}
