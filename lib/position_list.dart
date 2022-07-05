import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdartgooglemap/rxdart.dart';
import 'database.dart';

class LocationList extends StatelessWidget {
  const LocationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Saved Data'),
      ),
      body: StreamBuilder<List<LocationData>>(
          stream: Provider.of<RXDart>(context).behaviorSubject.stream,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onDoubleTap: () {
                      Provider.of<RXDart>(context, listen: false)
                          .delete(snapshot.data?[index].id as int);
                    },
                    child: Card(
                      elevation: 8,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                                "id: ${snapshot.data?[index].id.toString()}"),
                          ),
                          ListTile(
                            title: Text(
                                "longitude: ${snapshot.data?[index].longitude.toString()}"),
                          ),
                          ListTile(
                            title: Text(
                                "latitude: ${snapshot.data?[index].latitude.toString()}"),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
