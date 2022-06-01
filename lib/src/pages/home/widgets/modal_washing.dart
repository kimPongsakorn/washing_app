import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washing_app/src/constants/asset.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/models/home_model.dart';
import 'package:washing_app/src/utils/services/network_service.dart';
import 'package:washing_app/src/widgets/custom_flushbar.dart';

class ModalWashing extends StatefulWidget {
  final Datum _model;
  final String? coin;
  const ModalWashing(this._model, {this.coin, Key? key}) : super(key: key);

  @override
  State<ModalWashing> createState() => _ModalWashingState();
}

class _ModalWashingState extends State<ModalWashing> {
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
          _buildTitle(widget._model.number),
          const SizedBox(height: 50),
          _buildStatus(widget._model.idUser),
          const SizedBox(height: 80),
        ],
      ),
    ));
  }

  FutureBuilder _buildStatus(String? id) => FutureBuilder<String>(
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
            if (widget._model.status != '0') {
              return _buildMessage(
                  'เครื่องนี้มีคนจองแล้ว \nลองหาเครื่องใหม่ดูนะ');
            }
            return _buildBtn(
              'จองเครื่องซัก',
              status: widget._model.status,
              onPressed: () => payment(),
            );
          }

          return _buildBtn(
            'ยกเลิกการจอง',
            status: widget._model.status,
            onPressed: () => cancel(),
          );
        },
      );

  Column _buildMessage(String? title) => Column(
        children: [
          Image.asset(
            Asset.oopImage,
            height: 150,
          ),
          const SizedBox(
            height: 10,
          ),
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

  Container _buildBtn(String? title, {String? status, Function()? onPressed}) =>
      Container(
        width: 220,
        color: status != '0' ? Colors.amber : Colors.green,
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.transparent,
          ),
          onPressed: onPressed,
          child: Text(
            title ?? '',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
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

  void payment() {
    NetworkService()
        .payment('${widget._model.price}', '${widget._model.id}')
        .then((data) async {
      await Future.delayed(const Duration(seconds: 1));
      if (data.status == 'ok') {
        if (!mounted) return;
        Navigator.pop(context);
        CustomFlushbar.showSuccess(context, message: data.message ?? '');
        NetworkService().setNotifyLine(
            'มีคนจองเครื่องซัก หมายเลข${widget._model.number} แล้วน้า');
        setState(() {});
        return;
      } else if (data.status == 'error') {
        if (!mounted) return;
        CustomFlushbar.showError(context, message: data.message ?? '');
        return;
      }
    }).catchError((onError) async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      CustomFlushbar.showError(context, message: 'error');
    });
  }

  void cancel() {
    NetworkService()
        .cancel('${widget._model.price}', '${widget._model.id}')
        .then((data) async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      Navigator.pop(context);
      NetworkService().setNotifyLine(
          'เครื่องซักหมายเลข ${widget._model.number} ถูกยกเลิกแล้วน้า มีใครอยากจองมั้ย');
      CustomFlushbar.showSuccess(context, message: data.message ?? '');
      setState(() {});
      return;
    }).catchError((onError) async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      CustomFlushbar.showError(context, message: 'error');
    });
  }
}
