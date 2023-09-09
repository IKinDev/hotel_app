import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/features/reservation_room/domain/entity/invalid_textfield.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/touris_validation/tourist_validation_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/touris_validation/tourist_validation_event.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';
import 'package:hotel_app/resources/resources.dart';

import '../bloc/touris_validation/tourist_validation_state.dart';

class TouristItemWidget extends StatefulWidget {
  final int index;

  const TouristItemWidget({
    super.key,
    required this.index,
  });

  @override
  State<TouristItemWidget> createState() => _TouristItemWidgetState();
}

class _TouristItemWidgetState extends State<TouristItemWidget> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    final index = widget.index;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(255, 255, 255, 1)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppSettings.touristCounter[widget.index],
                  style: TextStyles.titleTextStyle),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color.fromRGBO(13, 114, 255, 0.1),
                ),
                height: 32,
                width: 32,
                child: Center(
                    child: IconButton(
                  color: const Color.fromRGBO(13, 114, 255, 0.1),
                  onPressed: () {
                    setState(() {
                      _visible = !_visible;
                    });
                  },                  
                  icon: _visible
                      ? SvgPicture.asset(
                          CustomIcons.vector55,
                          height: 12,
                          width: 6,
                        )
                      : Transform.rotate(
                          angle: 3.14 ,
                          child: SvgPicture.asset(
                            CustomIcons.vector55,
                            height: 12,
                            width: 6,
                          )),
                )),
              ),
            ],
          ),
          Visibility(
              visible: _visible,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  _TextFieldWidget(
                    hintText: AppSettings.textFiledNameText,
                    index: index,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _TextFieldWidget(
                    hintText: AppSettings.textFiledSurnameText,
                    index: index,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _TextFieldWidget(
                    hintText: AppSettings.textFiledBornDateText,
                    index: index,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _TextFieldWidget(
                    hintText: AppSettings.textFiledNationalityText,
                    index: index,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _TextFieldWidget(
                    hintText: AppSettings.textFiledInternationalPassportText,
                    index: index,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _TextFieldWidget(
                    hintText:
                        AppSettings.textFiledValidInternationalPassportText,
                    index: index,
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}

class _TextFieldWidget extends StatefulWidget {
  final String hintText;
  final int index;

  const _TextFieldWidget(
      {super.key, required this.hintText, required this.index});

  @override
  State<_TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<_TextFieldWidget> {
  final TextEditingController controller = TextEditingController();
  String savedText = '';
  Color color = const Color.fromRGBO(246, 246, 249, 1);

  bool hasElementWithIndexAndName(
      List<TextFieldData> list, int index, String name) {
    return list.any((element) =>
        element.indexTourist == index && element.textFiledName == name);
  }

  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<TouristValidateBloc>(context);
    controller.text =
        bloc.repository.getTouristItem(widget.index, widget.hintText).text;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TouristValidateBloc>(context);

    return BlocBuilder<TouristValidateBloc, TouristValidateState>(
      builder: (context, state) {
        if (state is TouristValidateInvalidState) {
          bool isValid = hasElementWithIndexAndName(
              state.invalidList, widget.index, widget.hintText);
          if (isValid) {
            color = const Color.fromRGBO(235, 87, 87, 0.15);
          } else {
            color = const Color.fromRGBO(246, 246, 249, 1);
          }
        } else {
          color = const Color.fromRGBO(246, 246, 249, 1);
        }

        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              controller.text = value;
              bloc.add(ChangeElementAtIndexEvent(
                  index: widget.index, name: widget.hintText, value: value));
            },
            style: TextStyles.textFieldMainTextStyle,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                label: Text(
                  widget.hintText,
                  style: TextStyles.texFieldLabelTextStyle,
                ),
                filled: true,
                fillColor: color,
                border: InputBorder.none),
          ),
        );
      },
    );
  }
}
