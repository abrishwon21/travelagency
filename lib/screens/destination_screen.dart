import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/models/tour_model.dart';
import 'package:travel_app/services/Provider/tour_provider.dart';
import '../models/activity.dart';
import '../models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Tour destination;

  const DestinationScreen({Key? key, required this.destination})
      : super(key: key);

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TourProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.destination.image,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        iconSize: 30.0,
                        color: Colors.black,
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context)),
                    Row(
                      children: <Widget>[
                        IconButton(
                            iconSize: 30.0,
                            color: Colors.black,
                            icon: const Icon(Icons.search),
                            onPressed: () => Navigator.pop(context)),
                        IconButton(
                            iconSize: 30.0,
                            color: Colors.black,
                            icon:
                                const Icon(FontAwesomeIcons.arrowDownWideShort),
                            onPressed: () => Navigator.pop(context))
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.destination.destination,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2)),
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 15.0,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 5.0),
                          Text(widget.destination.creator,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                              )),
                        ],
                      ),
                    ]),
              ),
              const Positioned(
                  right: 20.0,
                  bottom: 20.0,
                  child: Icon(Icons.location_on,
                      color: Colors.white70, size: 25.0))
            ],
         
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: widget.destination.tour_activity?.length??0,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.destination.tour_activity![index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 120.0,
                                  child: Text(
                                    activity.title,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${activity.avgCost}',
                                      style: const TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Text(
                                      'per pax',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              activity.star,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            // _buildRatingStars(activity.star),
                            const SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text('9:00AM'),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text('10:00AM'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                            width: 110.0,
                            image: AssetImage(activity.image),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    
    );
  }
}
