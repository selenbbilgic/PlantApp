part of '../home_view.dart';

class QuestionsCarousel extends StatelessWidget {
  const QuestionsCarousel();

  @override
  Widget build(BuildContext context) {
    final placeholderArticles = List.generate(
      3,
      (i) => ONBOARDING_1_IMAGE, // 'assets/images/article_$i.png',
    );

    return BlocBuilder<QuestionBloc, QuestionState>(
      builder: (context, state) {
        if (state is QuestionLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is QuestionLoadFailure) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is QuestionLoadSuccess) {
          return SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.questions.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, idx) {
                return SizedBox(
                  width: 280,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          state.questions[idx].imageUrl,
                          fit: BoxFit.cover,
                        ),
                        Container(color: Colors.black26),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              state.questions[idx].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
