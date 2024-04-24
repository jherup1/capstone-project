// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:fl_chart/fl_chart.dart';

class CustomLineChart extends StatefulWidget {
  final double? width;
  final double? height;
  final int daysInThePast;

  const CustomLineChart({
    Key? key,
    this.width,
    this.height,
    required this.daysInThePast,
  }) : super(key: key);

  @override
  _CustomLineChartState createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  late List<FlSpot> _spots;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DateTime now = DateTime.now();
    DateTime startDate = now.subtract(Duration(days: widget.daysInThePast));

    Map<DateTime, int> countMap = {};
    try {
      // Initialize all dates with zero
      for (int i = 0; i <= widget.daysInThePast; i++) {
        DateTime date = startDate.add(Duration(days: i));
        countMap[DateTime(date.year, date.month, date.day)] = 0;
      }

      var snapshot = await firestore
          .collection('users')
          .where('last_active_time',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
          .get();

      for (var doc in snapshot.docs) {
        var lastActive = (doc.data()['last_active_time'] as Timestamp).toDate();
        DateTime dateKey =
            DateTime(lastActive.year, lastActive.month, lastActive.day);
        if (countMap.containsKey(dateKey)) {
          countMap[dateKey] = countMap[dateKey]! + 1;
        }
      }

      setState(() {
        print("Spots: $_spots");
        _spots = countMap.entries.map((entry) {
          int daysAgo = startDate.difference(entry.key).inDays;
          return FlSpot(daysAgo.toDouble(), entry.value.toDouble());
        }).toList();
      });
    } catch (e) {
      print("Error fetching or processing data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? 200,
      child: _spots.isNotEmpty
          ? LineChart(
              LineChartData(
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(show: false),
                gridData: FlGridData(show: false),
                lineBarsData: [
                  LineChartBarData(spots: _spots),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
