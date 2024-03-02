import 'package:crypto_app/src/coins/presentation/coin_list/cubit/coin_cubit.dart';
import 'package:crypto_app/src/coins/presentation/coin_list/views/coins_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CoinsScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<CoinsCubit>(),
          child: const CoinsScreen(),
        ),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const Center(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
