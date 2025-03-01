import 'package:church_navigation/data/models/location_model.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final Location location;
  const LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
            location.thumbnail_url != null
                ? Image.network(location.thumbnail_url!)
                : const Icon(Icons.location_on),
        title: Text(location.name),
        subtitle: Text(location.category),
      ),
    );
  }
}
