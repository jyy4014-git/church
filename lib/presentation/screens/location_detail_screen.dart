import 'package:church_navigation/data/models/location_model.dart';
import 'package:church_navigation/data/providers/bookmark_provider.dart';
import 'package:church_navigation/data/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:church_navigation/presentation/widgets/loading_indicator.dart';

class LocationDetailScreen extends ConsumerWidget {
  final int locationId;
  const LocationDetailScreen({Key? key, required this.locationId})
    : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationDetail = ref.watch(locationDetailProvider(locationId));

    if (locationId == 0) {
      return const Text('잘못된 경로 입니다.');
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Location Detail")),
      body: locationDetail.when(
        data: (location) {
          return _buildDetailView(context, ref, location);
        },
        error: (error, stack) => Center(child: Text("Error: $error")),
        loading: () => const LoadingIndicator(),
      ),
    );
  }

  Widget _buildDetailView(
    BuildContext context,
    WidgetRef ref,
    Location location,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 장소 이미지
          if (location.detail_image_url != null)
            Image.network(
              location.detail_image_url!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            )
          else
            const SizedBox.shrink(),
          const SizedBox(height: 16),
          // 장소 이름
          Text(
            location.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          // 장소 카테고리
          Text(
            "Category: ${location.category}",
            style: const TextStyle(fontSize: 16),
          ),
          // 장소 층
          Text(
            "Floor: ${location.floor}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          // 장소 설명
          Text(location.description, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          // 장소 내부 경로
          Text(
            "Directions: ${location.directions ?? 'Not Provided'}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          // 액션 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 길찾기 버튼 로직 구현
                },
                child: const Text("Get Directions"),
              ),
              ElevatedButton(
                onPressed: () async {
                  // 즐겨찾기 추가 로직
                  final userId = 1;
                  final result = await ref.read(
                    addBookmarkProvider({
                      'id': location.id,
                      'user_id': userId,
                    }).future,
                  );
                  // 즐겨찾기가 추가되었을 때 사용자에게 알림
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(result['message'])));
                },
                child: const Text("Add to Favorites"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
