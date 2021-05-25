import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: const Text("Got no data. Start adding some!"),
                builder: (context, greatPlaces, ch) =>
                    greatPlaces.items.length <= 0
                        ? ch
                        : ListView.builder(
                            itemBuilder: (context, index) => ListTile(
                              title: Text(greatPlaces.items[index].title),
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlaces.items[index].image),
                              ),
                              onTap: () {},
                            ),
                            itemCount: greatPlaces.items.length,
                          ),
              ),
      ),
    );
  }
}
