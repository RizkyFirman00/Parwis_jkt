import 'package:flutter/material.dart';
import 'package:parwis_jkt/Data/data_class_parwis.dart';
import 'package:parwis_jkt/Data/data_pariwisata.dart';
import 'package:parwis_jkt/UI/detail_page.dart';
import 'package:parwis_jkt/UI/item_parwis.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pariwisata> filteredData = [];
  bool isSortedAscending = true;

  @override
  void initState() {
    sortData();
    filteredData = DataPariwisata.data;
    super.initState();
  }

  void filterData(String query) {
    setState(() {
      filteredData = DataPariwisata.data
          .where((pariwisata) =>
              pariwisata.nama.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void sortData() {
    setState(() {
      if (isSortedAscending) {
        // Sort in ascending order
        DataPariwisata.data.sort((a, b) => a.nama.compareTo(b.nama));
      } else {
        // Sort in descending order
        DataPariwisata.data.sort((a, b) => b.nama.compareTo(a.nama));
      }
      isSortedAscending = !isSortedAscending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pariwisata Jakarta"),
        backgroundColor: Colors.blue[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(
                  filterFunction: filterData,
                  filteredData: filteredData,
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              sortData();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            left: 20,
            right: 20,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(pariwisata: filteredData[index]),
                    ),
                  );
                },
                child: ItemParwis(pariwisata: filteredData[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final Function(String) filterFunction;
  final List<Pariwisata> filteredData;

  DataSearch({required this.filterFunction, required this.filteredData});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // You can customize the search results UI here
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Filter the data based on the current query
    final suggestionList = filteredData
        .where((pariwisata) =>
            pariwisata.nama.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(pariwisata: suggestionList[index]),
                ),
              );
            },
            child: ItemParwis(pariwisata: suggestionList[index]),
          );
        },
      ),
    );
  }
}
