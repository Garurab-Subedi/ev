import 'package:ev/app/model/station.dart';
import 'package:ev/app/widgets/consts.dart';
import 'package:flutter/material.dart';

class NearestLocationItem extends StatelessWidget {
  final RandomStation station;

  const NearestLocationItem({
    Key? key,
    required this.station,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(2.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      station.title!,
                      style: roboto.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: roboto.copyWith(
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'Rating: ${station.rating}',
                                style: roboto.copyWith(fontSize: 15),
                              ),
                              const TextSpan(
                                  text:
                                      '  '), // Add space between Rating and Available text
                              TextSpan(
                                text:
                                    'Available: ${station.isAvailable! ? "Yes" : "No"}',
                                style: roboto.copyWith(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.circle,
                          size: 2,
                          color: grey,
                        ),
                        const SizedBox(width: 10),
                        RichText(
                          text: TextSpan(
                            style: roboto.copyWith(
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'TotalPlug: ${station.availablePorts}',
                                style: roboto.copyWith(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 10,
              ),
              const SizedBox(width: 2.5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: roboto.copyWith(
                        color: black.withOpacity(0.5),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      station.address!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: roboto.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                  border: Border.all(color: black.withOpacity(.5)),
                ),
                child: const Icon(
                  Icons.share,
                  color: black,
                  size: 25,
                ),
              ),
              const SizedBox(width: 2.5),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: blue,
                  shape: BoxShape.circle,
                  border: Border.all(color: blue),
                ),
                child: const Icon(
                  Icons.directions,
                  color: white,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
