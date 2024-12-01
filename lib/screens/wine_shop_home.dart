import 'package:flutter/material.dart';
import '../models/wine.dart';
import '../models/wine_category.dart';
import '../widgets/wine_card.dart';
import '../widgets/wine_category_card.dart';
import '../widgets/filter_button.dart';
import '../services/wine_data_provider.dart';

class WineShopHome extends StatefulWidget {
  const WineShopHome({super.key});

  @override
  _WineShopHomeState createState() => _WineShopHomeState();
}

class _WineShopHomeState extends State<WineShopHome> {
  String criteria = '';
  List<WineCategory> wineTypes = [];
  List<Wine> wines = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final categories = await WineDataProvider.fetchWineCategories();
    final winesData = await WineDataProvider.fetchWines();

    setState(() {
      wineTypes = categories;
      wines = winesData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wine Shop"),
      ),
      body: wineTypes.isEmpty || wines.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      FilterButton(type: 'Type', selectedCriteria: criteria, onPressed: (type) => setState(() => criteria = type)),
                      FilterButton(type: 'Style', selectedCriteria: criteria, onPressed: (type) => setState(() => criteria = type)),
                      FilterButton(type: 'Countries', selectedCriteria: criteria, onPressed: (type) => setState(() => criteria = type)),
                      FilterButton(type: 'Grapes', selectedCriteria: criteria, onPressed: (type) => setState(() => criteria = type)),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: wineTypes.length,
                      itemBuilder: (context, index) => WineCategoryCard(category: wineTypes[index]),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: wines.length,
                    itemBuilder: (context, index) => WineCard(wine: wines[index]),
                  ),
                ],
              ),
            ),
    );
  }
}
