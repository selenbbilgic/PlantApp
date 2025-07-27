// lib/presentation/home/home_view.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/blocs/category/category_bloc.dart';
import 'package:plant_app/blocs/category/category_event.dart';
import 'package:plant_app/blocs/category/category_state.dart';
import 'package:plant_app/blocs/question/question_bloc.dart';
import 'package:plant_app/blocs/question/question_event.dart';
import 'package:plant_app/blocs/question/question_state.dart';
import 'package:plant_app/core/constants/images.dart';
import 'package:plant_app/core/widgets/primary_button.dart';
import 'package:plant_app/core/constants/images.dart';
import 'package:plant_app/data/repositories/category_repository.dart';
import 'package:plant_app/data/repositories/question_repository.dart';
import 'package:plant_app/data/sources/category_data_source.dart';
import 'package:plant_app/data/sources/question_data_source.dart';
part 'widgets/_home_header.dart';
part 'widgets/_search_bar.dart';
part 'widgets/_premium_banner.dart';
part 'widgets/_questions_carousel.dart';
part 'widgets/_category_grid.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final CategoryBloc _categoryBloc;
  late final QuestionBloc _questionBloc;

  @override
  void initState() {
    super.initState();

    _categoryBloc = CategoryBloc(
      CategoryRepository(CategoryRemoteDataSource(http.Client())),
    )..add(CategoryRequested());

    _questionBloc = QuestionBloc(
      QuestionRepository(QuestionRemoteDataSource(http.Client())),
    )..add(QuestionRequested());
  }

  @override
  void dispose() {
    _categoryBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>.value(value: _categoryBloc),
        BlocProvider<QuestionBloc>.value(value: _questionBloc),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HomeHeader(), // “Hi, plant lover! Good Afternoon! ☁️”
                SizedBox(height: 24),
                SearchBar(), // the rounded search TextField
                SizedBox(height: 24),
                PremiumBanner(), // “FREE Premium Available” card
                SizedBox(height: 24),
                QuestionsCarousel(), // horizontal list of articles
                SizedBox(height: 24),
                CategoryGrid(), // 2×2 grid of categories
              ],
            ),
          ),
        ),
      ),
    );
  }
}
