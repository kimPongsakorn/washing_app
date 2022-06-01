import 'package:flutter/material.dart';
import 'package:washing_app/src/models/home_model.dart';
import 'package:washing_app/src/pages/home/view/washing_list.dart';
import 'package:washing_app/src/pages/home/widgets/widget.dart';
import 'package:washing_app/src/utils/services/network_service.dart';
import 'package:washing_app/src/widgets/title_custom.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HomeModel>>(
        future: NetworkService().getHome(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final homeData = snapshot.data;
          if (homeData!.isEmpty) {
            return const Text('empty');
          }
          return RefreshIndicator(
            onRefresh: () async => setState(() {}),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarCustom(homeData),
                const SizedBox(height: 10),
                const TitleCustom('เครื่องว่าง'),
                Expanded(
                    child: WashingList(
                  homeData.first.data,
                  coin: homeData.first.coin,
                )),
              ],
            ),
          );
        });
  }
}
