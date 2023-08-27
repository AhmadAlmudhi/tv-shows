import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text.dart';

import '../../../shows/data/models/show.dart';
import '../../data/models/show_details.dart';
import 'details_text.dart';
import 'select_watching_status.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.showDetails,
    required this.show,
  });

  final ShowDetails showDetails;
  final Show show;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(data: "genres"),
                    DetailsText(
                      data: showDetails.genres.join(" | "),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(data: "rating"),
                      DetailsText(data: "${showDetails.rating} / 10"),
                      DetailsText(data: "(${showDetails.ratingCount})")
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(data: "network"),
                      DetailsText(data: showDetails.network),
                      DetailsText(data: "(${showDetails.country})")
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(data: "status"),
                      DetailsText(data: showDetails.status),
                      const DetailsText(data: ""),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: CustomText(data: "watched?"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SelectWatchingStatus(show: show),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const CustomText(data: "description"),
                  DetailsText(data: showDetails.description),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
          )
        ],
      ),
    );
  }
}
