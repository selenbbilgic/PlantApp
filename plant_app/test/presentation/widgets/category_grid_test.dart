// test/presentation/widgets/category_grid_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/blocs/category/category_bloc.dart';
import 'package:plant_app/blocs/category/category_event.dart';
import 'package:plant_app/blocs/category/category_state.dart';
import 'package:plant_app/data/models/category.dart';
import 'package:plant_app/presentation/home/home_view.dart';

class MockCategoryBloc extends MockBloc<CategoryEvent, CategoryState>
    implements CategoryBloc {}

class FakeCategoryEvent extends Fake implements CategoryEvent {}

class FakeCategoryState extends Fake implements CategoryState {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeCategoryEvent());
    registerFallbackValue(FakeCategoryState());
  });

  late CategoryBloc bloc;

  setUp(() {
    bloc = MockCategoryBloc();
  });

  Widget buildTestable() {
    return MaterialApp(
      home: BlocProvider<CategoryBloc>.value(
        value: bloc,
        child: const CategoryGrid(),
      ),
    );
  }

  testWidgets('shows loading indicator when state is CategoryLoadInProgress', (
    tester,
  ) async {
    when(() => bloc.state).thenReturn(CategoryLoadInProgress());

    await tester.pumpWidget(buildTestable());
    // one frame for build
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows error text when state is CategoryLoadFailure', (
    tester,
  ) async {
    when(() => bloc.state).thenReturn(const CategoryLoadFailure('oops'));

    await tester.pumpWidget(buildTestable());
    await tester.pump();

    expect(find.text('Error: oops'), findsOneWidget);
  });

  testWidgets('shows grid of category titles on CategoryLoadSuccess', (
    tester,
  ) async {
    final cats = [
      Category(
        id: 1,
        name: 'fern',
        title: 'Ferns',
        rank: 0,
        image: CategoryImage(
          id: 1,
          url: 'https://example.com/fern.png',
          width: 100,
          height: 100,
        ),
        createdAt: DateTime(2023, 1, 1),
        updatedAt: DateTime(2023, 1, 2),
        publishedAt: DateTime(2023, 1, 3),
      ),
      Category(
        image: CategoryImage(
          id: 2,
          url: 'https://example.com/cactus.png',
          width: 100,
          height: 100,
        ),
        id: 2,
        name: 'cactus',
        title: 'Cacti',
        rank: 1,
        createdAt: DateTime(2023, 2, 1),
        updatedAt: DateTime(2023, 2, 2),
        publishedAt: DateTime(2023, 2, 3),
      ),
    ];
    when(() => bloc.state).thenReturn(CategoryLoadSuccess(cats));

    await tester.pumpWidget(buildTestable());
    await tester.pumpAndSettle();

    // We expect each title string to appear
    expect(find.text('Ferns'), findsOneWidget);
    expect(find.text('Cacti'), findsOneWidget);
  });
}
