import 'package:church_navigation/data/models/location_model.dart';
import 'package:church_navigation/data/providers/location_provider.dart';
import 'package:church_navigation/data/providers/map_provider.dart';
import 'package:church_navigation/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:church_navigation/config/routes.dart';
import 'package:church_navigation/presentation/widgets/search_bar.dart';
import 'package:church_navigation/presentation/widgets/bottom_navigation.dart';
import 'package:church_navigation/presentation/widgets/hotspot_overlay.dart';
import 'package:church_navigation/presentation/widgets/loading_indicator.dart';

class MainMapScreen extends ConsumerWidget {
  const MainMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapData = ref.watch(mapDataProvider);

    return Scaffold(
      appBar: AppBar(title: Text('hello'.tr())),
      body: mapData.when(
        data: (data) {
          final String mapImageUrl = data["map_image_url"];
          final List<dynamic> hotspots = data["hotspots"];
          return LayoutBuilder(
            builder: (context, constraints) {
              final double imageWidth = constraints.maxWidth;
              final double imageHeight = constraints.maxHeight;

              return Column(
                children: [
                  const SearchBar(),
                  Expanded(
                    child: Stack(
                      children: [
                        PhotoView(
                          imageProvider: NetworkImage(mapImageUrl),
                          minScale: PhotoViewComputedScale.contained,
                          maxScale: 4.0,
                          backgroundDecoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          enableRotation: false,
                        ),
                        ...hotspots.map((hotspot) {
                          final Location location = Location.fromJson(hotspot);
                          final pixelPosition = Helper.getPixelPosition(
                            location.xRatio,
                            location.yRatio,
                            imageWidth,
                            imageHeight,
                          );
                          return HotspotOverlay(
                            location: location,
                            x: pixelPosition['x'],
                            y: pixelPosition['y'],
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.locationDetail,
                                arguments: location.id,
                              );
                            },
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
        error: (error, stack) {
          return Center(child: Text("Error: $error"));
        },
        loading: () => const LoadingIndicator(),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
