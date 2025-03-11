import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';

class PlaceEnterField extends StatefulWidget {
  final Color iconColor;
  final String hintText;
  final bool? isStop;
  final VoidCallback? onRemove;
  final Function(String, double, double)? onLocationSelected;

  const PlaceEnterField({
    super.key,
    required this.iconColor,
    required this.hintText,
    this.isStop,
    this.onRemove,
    this.onLocationSelected,
  });

  @override
  _PlaceEnterFieldState createState() => _PlaceEnterFieldState();
}

class _PlaceEnterFieldState extends State<PlaceEnterField> {
  late TextEditingController controller;
  late String apiKey;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    apiKey = dotenv.env['GOOGLE_PLACES_API_KEY'] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
      textEditingController: controller,
      googleAPIKey: apiKey,
      inputDecoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: widget.hintText,
        alignLabelWithHint: false,
        contentPadding: const EdgeInsets.only(top: 13),
        hintStyle: TextStyle(
          color: AppColors.blackColor,
          fontSize: 16,
          overflow: TextOverflow.ellipsis,
        ),
        prefixIcon: Icon(
          (widget.isStop ?? false)
              ? Icons.stop_circle_outlined
              : Icons.radio_button_checked,
          color: widget.iconColor,
        ),
        suffixIcon: widget.onRemove != null
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppColors.darkColor,
                ),
                onPressed: widget.onRemove,
              )
            : null,
      ),
      debounceTime: 400,
      countries: ["in", "ca"],
      isLatLngRequired: true,
      getPlaceDetailWithLatLng: (Prediction prediction) {
        widget.onLocationSelected!(
          prediction.description!,
          double.parse(prediction.lat!),
          double.parse(prediction.lng!),
        );
      },
      itemClick: (Prediction prediction) {
        controller.text = prediction.description!;
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: prediction.description!.length),
        );
      },
      itemBuilder: (context, index, Prediction prediction) {
        return Container(
          color: AppColors.whiteColor,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: widget.iconColor,
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(child: Text(prediction.description ?? "")),
            ],
          ),
        );
      },
      boxDecoration: BoxDecoration(
        color: AppColors.lightColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      isCrossBtnShown: false,
      containerHorizontalPadding: 10,
      placeType: PlaceType.geocode,
    );
  }
}
