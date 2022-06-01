import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washing_app/src/constants/asset.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/models/home_model.dart';

class ModalWashing extends StatelessWidget {
  final Datum _model;
  const ModalWashing(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildBtnColse(context),
          const SizedBox(height: 50),
          _buildTitle(_model.number),
          const SizedBox(height: 50),
          _buildStatus(_model.idUser),
          const SizedBox(height: 80),
        ],
      ),
    ));
  }

  FutureBuilder _buildStatus(String? id) => FutureBuilder(
        future: _check(id ?? '0'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.data;

          if (data == '0') {
            if (_model.status != '0') {
              return _buildMessage(
                  'เครื่องนี้มีคนจองแล้ว \nลองหาเครื่องใหม่ดูนะ');
            }
            return _buildBtn('จองเครื่องซัก', status: _model.status);
          }

          return _buildBtn('ยกเลิกการจอง', status: _model.status);
        },
      );

  Column _buildMessage(String? title) => Column(
        children: [
          Image.asset(
            Asset.oopImage,
            height: 150,
          ),
          SizedBox(height: 10,),
          const Text('เครื่องนี้มีคนจองแล้ว \nลองหาเครื่องใหม่ดูนะ')
        ],
      );

  Future<String> _check(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('token');
    String idToken = value!.toString();
    if (idToken == id) {
      return '1';
    }
    return '0';
  }

  Container _buildBtn(String? title, {String? status}) => Container(
        width: 220,
        color: status != '0' ? Colors.amber : Colors.green,
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {},
          child: Text(title ?? ''),
        ),
      );

  Column _buildTitle(String? title) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'เครื่องซัก หมายเลข $title',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Constant.BLACK_COLOR,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      );

  Align _buildBtnColse(BuildContext context) => Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 35,
          icon: const Icon(Icons.close_rounded),
        ),
      );
}
