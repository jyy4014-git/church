import 'package:church_navigation/data/providers/search_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:church_navigation/config/routes.dart';
import 'package:church_navigation/data/models/location_model.dart';
import 'package:church_navigation/presentation/widgets/bottom_navigation.dart';

class SearchModalScreen extends ConsumerStatefulWidget {
  const SearchModalScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchModalScreen> createState() => _SearchModalScreenState();
}

class _SearchModalScreenState extends ConsumerState<SearchModalScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
              ),
              suggestionsCallback: (pattern) async {
                if (pattern.isEmpty) {
                  return [];
                }
                final searchResult = await ref.read(
                  searchProvider(pattern).future,
                );
                if (searchResult['suggestions'] == null) {
                  return [];
                }
                return searchResult['suggestions'];
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                  onTap: () {
                    Location location = Location(
                      id: 0,
                      name: suggestion,
                      description: '',
                      category: '',
                      floor: '',
                      xRatio: 0,
                      yRatio: 0,
                    );
                    ref.refresh(searchProvider(suggestion));
                    Navigator.pushNamed(
                      context,
                      AppRoutes.locationDetail,
                      arguments: location.id,
                    );
                  },
                );
              },
              onSuggestionSelected: (suggestion) {
                Location location = Location(
                  id: 0,
                  name: suggestion,
                  description: '',
                  category: '',
                  floor: '',
                  xRatio: 0,
                  yRatio: 0,
                );
                ref.refresh(searchProvider(suggestion));
                Navigator.pushNamed(
                  context,
                  AppRoutes.locationDetail,
                  arguments: location.id,
                );
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder(
                future: ref.watch(searchProvider("").future),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return const SizedBox.shrink();
                  } else {
                    final data = snapshot.data as Map<String, dynamic>;
                    if (data['recent_searches'] == null) {
                      return const SizedBox.shrink();
                    }
                    final recentSearches =
                        data['recent_searches'] as List<dynamic>?;
                    if (recentSearches == null || recentSearches.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return ListView.builder(
                      itemCount:
                          recentSearches.length > 3 ? 3 : recentSearches.length,
                      itemBuilder: (context, index) {
                        final recentSearch = recentSearches[index];
                        return ListTile(
                          title: Text(recentSearch),
                          onTap: () {
                            ref.refresh(searchProvider(recentSearch));
                            _searchController.text = recentSearch;
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
