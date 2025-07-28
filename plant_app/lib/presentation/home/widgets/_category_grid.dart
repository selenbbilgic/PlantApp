part of '../home_view.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryLoadFailure) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is CategoryLoadSuccess) {
          final categories = state.categories;

          return LayoutBuilder(
            builder: (context, constraints) {
              // If wider than 600dp, use 3 columns
              final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (ctx, idx) {
                  final cat = categories[idx];
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: Theme.of(
                          context,
                        ).colorScheme.secondary.withAlpha(80),
                        width: 0.5,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        Image.network(
                          cat.image.url,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) => Container(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 130,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                            child: Text(
                              cat.title,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
