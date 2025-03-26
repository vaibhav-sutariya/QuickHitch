import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_hitch/model/rides/booking_request/get_booking_request_model.dart';

class RiderDetailsWidget extends StatelessWidget {
  final BookingRequestData request;
  const RiderDetailsWidget({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(request.rider!.picture ?? ''),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(request.rider!.firstName!),
                  Text(DateFormat('dd/MM/yyyy | hh:mm a')
                      .format(DateTime.parse(request.ride!.departureDate!))),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${request.totalAmount}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Seats: ${request.noOfSeats}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
