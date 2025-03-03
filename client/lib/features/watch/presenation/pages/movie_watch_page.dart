import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/app/app_bar_widget.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/watch/presenation/widgets/video_player_widget.dart';
import 'package:movie_app/features/watch/presenation/widgets/video_release_date_widget.dart';
import 'package:movie_app/features/watch/presenation/widgets/video_title_widget.dart';
import 'package:movie_app/features/watch/presenation/widgets/video_vote_average_widget.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(hideBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayerWidget(id: movieEntity.id!),
            const SizedBox(height: 20),
            VideoTitleWidget(title: movieEntity.title!),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDateWidget(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverageWidget(
                  videoVoteAverage: movieEntity.voteAverage!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
