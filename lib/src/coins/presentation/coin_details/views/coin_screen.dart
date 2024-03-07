import 'dart:math';
import 'package:crypto_app/core/extensions/util_extensions.dart';
import 'package:crypto_app/core/utils/number_utils.dart';
import 'package:crypto_app/src/coins/domain/models/value_style.dart';
import 'package:crypto_app/src/coins/presentation/coin_details/cubit/coin_cubit.dart';
import 'package:crypto_app/src/coins/presentation/coin_details/cubit/history_cubit.dart';
import 'package:crypto_app/src/coins/presentation/coin_details/navigation/coin_details_args.dart';
import 'package:crypto_app/src/coins/presentation/components/circular_image.dart';
import 'package:crypto_app/src/coins/presentation/components/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../components/progress_loading.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  static const routeName = "/coin";

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as CoinDetailsScreenArguments;
    context.read<CoinCubit>().getCoinById(args.id);
    context.read<HistoryCubit>().getOneDayHistory(args.id);

    return Scaffold(
        appBar: AppBar(
          title: Text(args.name),
          leading: const BackButton(),
        ),
        body: Column(children: [
          BlocConsumer<CoinCubit, CoinState>(listenWhen: (context, state) {
            return state is CoinLoaded;
          }, listener: (BuildContext context, CoinState state) {
            if (state is CoinLoaded) {}
          }, builder: (BuildContext context, CoinState state) {
            if (state is GettingCoin) {
              return const Center(
                child: ProgressLoader(),
              );
            }

            if (state is CoinLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                    // this row has full width
                    width: double.maxFinite,
                    child: Column(children: [
                      CircularImage(
                        image: state.coin.imageUrl,
                        width: 60.0,
                        height: 60.0,
                      ),
                      Text(
                        "\$${state.coin.usdPrice}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32.0),
                      ),
                    ])),
              );
            }

            return const Placeholder();
          }),
          const SmallHorizontalSpacer(),
          BlocConsumer<HistoryCubit, HistoryState>(
              listener: (BuildContext context, HistoryState state) {},
              builder: (BuildContext context, HistoryState state) {
                if (state is GettingHistory) {
                  return const SizedBox(
                    width: double.infinity,
                    height: 248.0,
                    child: Center(child: ProgressLoader()),
                  );
                }
                if (state is HistoryLoaded) {
                  var values = state.history.map((e) => e.priceUsd).toList();

                  var percent =
                      calculatePercentageDifference(values.first, values.last);

                  return SizedBox(
                    child: Opacity(
                      opacity: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                height: 24.0,
                                child: PercentText(value: percent),
                              ),
                            ),
                            const LargeHorizontalSpacer(),
                            SizedBox(
                              width: double.infinity,
                              height: 200.0,
                              child: LineChart(
                                mainData(values),
                                swapAnimationDuration:
                                    const Duration(seconds: 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return const Placeholder();
              }),
          const LargeHorizontalSpacer(),
          ToggleSwitch(
            minWidth: double.infinity,
            activeBgColor: const [Colors.green],
            inactiveBgColor: Colors.green.shade50,
            inactiveFgColor: Colors.green,
            initialLabelIndex: 0,
            totalSwitches: 5,
            labels: const ['1D', '1W', '1M', '6M', '1Y'],
            onToggle: (index) {
              switch (index) {
                case 0:
                  context.read<HistoryCubit>().getOneDayHistory(args.id);
                case 1:
                  context.read<HistoryCubit>().getOneWeekHistory(args.id);
                case 2:
                  context.read<HistoryCubit>().getOneMonthHistory(args.id);
                case 3:
                  context.read<HistoryCubit>().getSixMonthHistory(args.id);
                case 4:
                  context.read<HistoryCubit>().getOneYearHistory(args.id);
              }
            },
          ),
        ]));
  }

  LineChartData mainData(List<double> data) {
    var color = data.first.toDouble() < data.last.toDouble()
        ? Colors.green
        : Colors.red;

    var colorGbBar = data.first.toDouble() < data.last.toDouble()
        ? Colors.greenAccent
        : Colors.redAccent;

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: false,
        horizontalInterval: 4,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: data.length.toDouble() - 1,
      minY: data.reduce(min).toDouble(),
      maxY: data.reduce(max).toDouble(),
      lineBarsData: [
        LineChartBarData(
          isCurved: true,
          spots: listData(data),
          color: color,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorGbBar, // Start color
                colorGbBar.withOpacity(0.0), // End color (transparent)
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<FlSpot> listData(List<double> data) {
    return data
        .mapIndexed((e, i) => FlSpot(i.toDouble(), e.toDouble()))
        .toList();
  }
}

class PercentText extends StatelessWidget {
  final double value;

  const PercentText({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    var valueStyle =
        (value < 0) ? ValueStyle.negative() : ValueStyle.positive();

    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            valueStyle.icon,
            color: valueStyle.color,
            size: 20.0,
            semanticLabel: '',
          ),
          Text(
            "${value.toString()}%",
            style: TextStyle(
                color: valueStyle.color,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
