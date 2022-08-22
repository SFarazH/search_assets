import 'package:flutter/material.dart';
import 'package:test1111/MongoDBMain.dart';
import 'package:test1111/dbHelper/mongodb.dart';

class QueryDatabase extends StatefulWidget {
  QueryDatabase({Key? key}) : super(key: key);

  @override
  _QueryDatabaseState createState() => _QueryDatabaseState();
}

class _QueryDatabaseState extends State<QueryDatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: FutureBuilder(
                future: MongoDatabase.getQueryData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return displayData(
                              MongoDbModel.fromJson(snapshot.data[index]));
                        },
                      );
                    } else {
                      return Center(
                        child: Text("Data not found"),
                      );
                    }
                  }
                })));
  }

  Widget displayData(MongoDbModel data) {
    return Card(
      child: Column(
        children: [
          Text("${data.Block}"),
          Text("${data.District}"),
          Text("${data.Panchayat}"),
          Text("${data.Stage}"),
          Text("${data.State}"),
          Text("${data.AssetCategory}"),
          Text("${data.AssetSub}"),
        ],
      ),
    );
  }
}
