import 'dart:math';
import 'dart:ui';

import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:crypto_app/src/coins/domain/models/history.dart';
import 'package:crypto_app/src/coins/presentation/coin_details/cubit/coin_cubit.dart';
import 'package:crypto_app/src/coins/presentation/coin_details/cubit/history_cubit.dart';
import 'package:crypto_app/src/coins/presentation/coin_details/navigation/coin_details_args.dart';
import 'package:crypto_app/src/coins/presentation/components/circular_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  static const routeName = "/coin";

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  List<Color> gradientColors = [
    Colors.blueAccent,
    Colors.blue,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as CoinDetailsScreenArguments;
    context.read<CoinCubit>().getCoinById(args.id);
    context.read<HistoryCubit>().getOnDayHistory(args.id);

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
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context.theme.colorScheme.secondary,
                  ),
                ),
              );
            }

            if (state is CoinLoaded) {
              return SizedBox(
                  // this row has full width
                  width: double.maxFinite,
                  child: Column(children: [
                    CircularImage(
                      image: state.coin.imageUrl,
                      width: 100.0,
                      height: 100.0,
                    ),
                    Text(
                      "\$${state.coin.usdPrice}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.0),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (state.coin.changePercent24Hr.startsWith("-"))
                          Icon(
                            Icons.trending_down,
                            color: Colors.red.shade400,
                            size: 20.0,
                            semanticLabel: 'down',
                          ),
                        if (state.coin.changePercent24Hr.startsWith("-"))
                          Text(
                            "${state.coin.changePercent24Hr}%",
                            style: TextStyle(
                                color: Colors.red.shade400, fontSize: 20.0),
                          ),
                        if (!state.coin.changePercent24Hr.startsWith("-"))
                          Icon(
                            Icons.trending_up_rounded,
                            color: Colors.green.shade400,
                            size: 20.0,
                            semanticLabel: 'up',
                          ),
                        if (!state.coin.changePercent24Hr.startsWith("-"))
                          Text(
                            "${state.coin.changePercent24Hr}%",
                            style: TextStyle(
                                color: Colors.green.shade400, fontSize: 20.0),
                          )
                      ],
                    ),
                  ]));
            }

            return const Placeholder();
          }),
          const SizedBox(
            height: 16,
          ),
          BlocConsumer<HistoryCubit, HistoryState>(
              listener: (BuildContext context, HistoryState state) {},
              builder: (BuildContext context, HistoryState state) {
                if (state is GettingCoin) {
                  return const CircularProgressIndicator();
                }
                if (state is HistoryLoaded) {
                  return SizedBox(
                    child: Opacity(
                      opacity: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 200.0,
                              child: LineChart(
                                mainData(state.history
                                    .map((e) => double.tryParse(e.priceUsd)!)
                                    .toList()),
                                swapAnimationDuration: const Duration(seconds: 0),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            ToggleSwitch(
                              initialLabelIndex: 0,
                              totalSwitches: 5,
                              labels: const ['1D', '1W', '1M', '6M', '1Y'],
                              animate: true, // with just animate set to true, default curve = Curves.easeIn
                              curve: Curves.elasticOut, //
                              onToggle: (index) {
                                print('switched to: $index');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return const Placeholder();
              })
        ]));
  }

  LineChartData mainData(List<double> data) {
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
          spots: listData(data),
          color: Colors.green,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
            color: Colors.greenAccent,
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

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}
