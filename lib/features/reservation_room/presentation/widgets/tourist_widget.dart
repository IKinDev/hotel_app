import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/tourist_counter/tourist_counter_bloc.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';

import 'tourist_item_widget.dart';

class TouristWidget extends StatefulWidget {
  const TouristWidget({super.key});

  @override
  State<TouristWidget> createState() => _TouristWidgetState();
}

class _TouristWidgetState extends State<TouristWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TouristCounterBloc, int>(
      builder: (context, count) {
        return Column(
          children: [
            Column(
              children: List.generate(count, (index) {
                return TouristItemWidget(
                  index: index,
                );
              }),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(255, 255, 255, 1)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(AppSettings.addTourisTitleText,
                          style: TextStyles.titleTextStyle),
                    ),
                    _ButtonWidget(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color.fromRGBO(13, 114, 255, 1),
      ),
      child: Center(
        child: IconButton(
            color: const Color.fromRGBO(13, 114, 255, 1),
            onPressed: () =>
                context.read<TouristCounterBloc>().add(Increment()),
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.add,
              size: 24,
              color: Colors.white,
            )),
      ),
    );
  }
}
