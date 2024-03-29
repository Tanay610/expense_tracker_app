
import 'package:easy_expense/cubit/category_cubit.dart';
import 'package:easy_expense/cubit/expense_cubit.dart';
import 'package:easy_expense/cubit/total_cubit.dart';
import 'package:easy_expense/firebase_options.dart';
import 'package:easy_expense/presentation/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ExpenseCubit()),
        BlocProvider(create: (context)=>TotalCubit()),
        BlocProvider(create: (context)=>CategoryCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: SplashPage(),
      ),
    );
  }
}
