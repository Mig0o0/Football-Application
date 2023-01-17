import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kora_test_app/competitions/presentation/controllers/competition_events.dart';
import 'package:kora_test_app/competitions/presentation/screens/CompetitionsScreen.dart';
import 'package:kora_test_app/core/services/service_locator.dart';
import 'package:kora_test_app/seasons/presentation/controllers/season_bloc.dart';

import 'competitions/presentation/controllers/competition_bloc.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CompetitionBloc>()
            ..add(
              GetAllCompetitionsEvent(),
            ),
        ),
        BlocProvider(create: (context) => getIt<SeasonBloc>())
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: CompetitionsScreen(),
      ),
    );
  }
}
