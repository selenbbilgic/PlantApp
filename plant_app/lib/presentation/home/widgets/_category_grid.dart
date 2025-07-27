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
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (ctx, idx) {
              final cat = categories[idx];
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      cat.image.url,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) => Container(color: Colors.grey[200]),
                    ),
                    Container(color: Colors.white.withOpacity(0.5)),
                    Center(
                      child: Text(
                        cat.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          // initial or other states
          return const SizedBox.shrink();
        }
      },
    );
  }
}
