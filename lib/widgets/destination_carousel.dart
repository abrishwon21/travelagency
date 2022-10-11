import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/models/tour_model.dart';
import 'package:travel_app/services/Provider/tour_provider.dart';
import '../models/destination_model.dart';
import '../screens/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TourProvider>(context, listen: false);
// final provider = Provider.of<ArtistProvider>(context, listen: false);
    // const getProportionateScreenWidth = MediaQuery.of(context).size.width;
    // const getProportionateScreenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: provider.getTour(),
      builder: (context, AsyncSnapshot<List<Tour>> snapshot) {
        if (snapshot.hasData) {
          List<Tour> tours = snapshot.data!;
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            itemCount: tours.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: MediaQuery.of(context).size.width / 10,
                mainAxisSpacing: MediaQuery.of(context).size.height / 10),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 10,
                vertical: MediaQuery.of(context).size.height / 10),
            itemBuilder: (context, index) {
              // return ArtistCard(artist: artists[index]);
              Tour destination = tours[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationScreen(destination: destination),


                  ),
                ),

                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 210.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 15.0,
                          child: Container(
                              height: 120.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${destination.tour_activity!=null?destination.tour_activity!.length:0} activities',
                                        style: const TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      Text(
                                        destination.content,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                              )),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0,
                                  ),
                                ]),
                            child: Stack(
                              children: <Widget>[
                                Hero(
                                  tag: destination.image,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      height: 180.0,
                                      width: 180.0,
                                      fit: BoxFit.cover,
                                      image: AssetImage(destination.image),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10.0,
                                  bottom: 10.0,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(destination.destination,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.2)),
                                        Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.locationArrow,
                                              size: 10.0,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 5.0),
                                            Text(destination.creator,
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ]),
                                )
                              ],
                            ))
                      ],
                    )),
              );
              // end of builder
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
