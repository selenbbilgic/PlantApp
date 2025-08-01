part of '../home_view.dart';

class QuestionsCarousel extends StatelessWidget {
  const QuestionsCarousel();

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // handle error, e.g. show a snackbar
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionBloc, QuestionState>(
      builder: (context, state) {
        if (state is QuestionLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is QuestionLoadFailure) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is QuestionLoadSuccess) {
          return LayoutBuilder(
            builder: (context, bc) {
              final cardWidth = bc.maxWidth * 0.7;
              final cardHeight = cardWidth * (164 / 240);

              return SizedBox(
                height: cardHeight,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.questions.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, idx) {
                    final q = state.questions[idx];
                    return SizedBox(
                      width: cardWidth,
                      height: cardHeight,
                      child: InkWell(
                        onTap: () => _openUrl(q.url),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.network(
                                  q.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 6,
                                child: Container(
                                  height: cardHeight * 0.38,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    q.title,
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleSmall?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
          ;
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
