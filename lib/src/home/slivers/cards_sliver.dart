import 'package:animations/core/extensions_methods.dart';
import 'package:animations/gen/assets.gen.dart';
import 'package:animations/models/movie_models.dart';
import 'package:card_stack_swiper/card_stack_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:like_button/like_button.dart';

class CardsSliver extends StatelessWidget {
  const CardsSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "3D Product Card",
            style: context.themeText.headlineSmall,
          ),
        ),
        SizedBox(
          height: 300,
          child: Product3DCard(
            modelUrl: 'assets/3d_models/medium-couch-877.glb',
            title: 'Premium Couch',
            price: 500,
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("Stack  Cards", style: context.themeText.headlineSmall),
        ),
        SizedBox(height: 8),
        MenuWidget(),
        SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("Animated Cards", style: context.themeText.headlineSmall),
        ),
        SizedBox(height: 8),
        Expanded(child: ExpandableCardsExample()),
        SizedBox(height: 16),
      ],
    );
  }
}

/// 3d Model Product Card
class Product3DCard extends StatefulWidget {
  const Product3DCard({
    super.key,
    required this.modelUrl,
    required this.title,
    required this.price,
  });

  final String modelUrl;
  final String title;
  final double price;

  @override
  State<Product3DCard> createState() => _Product3DCardState();
}

class _Product3DCardState extends State<Product3DCard> {
  late Flutter3DController controller;
  bool isModelLoaded = false;
  String? currentAnimation;

  @override
  void initState() {
    super.initState();
    controller = Flutter3DController();
    // Listen for model load
    controller.onModelLoaded.addListener(() {
      if (controller.onModelLoaded.value) {
        setState(() => isModelLoaded = true);
        controller.playAnimation(); // Auto play first animation
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card.filled(
        color: Theme.of(context).colorScheme.surfaceContainer,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Flutter3DViewer(
                      controller: controller,
                      activeGestureInterceptor: true,
                      progressBarColor: Colors.grey,
                      enableTouch: true, // User can rotate
                      src: widget.modelUrl,
                    ),
                  ),
                ),
                Positioned(top: 8, right: 0, child: LikeButton()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: .topLeft,
                    child: Icon(Icons.threed_rotation_rounded),
                  ),
                ),

                Align(
                  alignment: .bottomCenter,
                  child: Column(
                    mainAxisAlignment: .end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          crossAxisAlignment: .end,
                          children: [
                            Text(
                              widget.title,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Icon(Icons.star_rate, color: Colors.amber.shade600),
                            Text(
                              '4.8',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0, left: 8.0),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              '\$${widget.price.toStringAsFixed(0)}',
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            IconButton.filled(
                              focusColor: Colors.black,
                              highlightColor: Colors.black,
                              hoverColor: Colors.black,
                              color: Colors.white,
                              tooltip: "Details",
                              onPressed: () {
                                // Add to cart action
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final CardStackSwiperController _controller = CardStackSwiperController();
  late String title;
  late String description;
  late bool isAddedToWishList;
  int index = 0;

  List<Widget> cards = [];
  final List<MovieModels> movieList = [
    MovieModels(
      title: "The Starlight Voyager",
      description:
          "A young adventurer and her robot companion set sail on a journey through the cosmos.",
      cardData: Assets.images.a1.image(
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    MovieModels(
      title: "The Lost Melody",
      description:
          "A musical prince discovers the secrets of an ancient, magical forest.",
      cardData: Assets.images.a2.image(
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    MovieModels(
      title: "The Clockwork Kingdom",
      description:
          "A princess from a steampunk city embarks on a journey with her mechanical owl.",
      cardData: Assets.images.a3.image(
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    MovieModels(
      title: "The Coral Crown",
      description:
          "A young mermaid princess explores her vibrant and colorful underwater kingdom.",
      cardData: Assets.images.a4.image(
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    MovieModels(
      title: "The Secret of the Whispering Woods",
      description:
          "Two young siblings follow a magical map into a glowing, mysterious forest.",
      cardData: Assets.images.a5.image(
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    MovieModels(
      title: "The Dragon's Ember",
      description:
          "A brave young knight and his loyal dragon companion set out on an epic quest.",
      cardData: Assets.images.a6.image(
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    MovieModels(
      title: "The Cloud Captain",
      description:
          "A young pilot sails a whimsical airship through a world of clouds and adventure.",
      cardData: Assets.images.a7.image(
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    MovieModels(
      title: "The Moonlit Masquerade",
      description:
          "A mysterious young woman in a mask watches a royal ball from a moonlit balcony.",
      cardData: Assets.images.a8.image(
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    MovieModels(
      title: "The Forgotten Toybox",
      description:
          "A heartwarming tale about a group of old toys that come to life in a dusty attic.",
      cardData: Assets.images.a9.image(
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    MovieModels(
      title: "The Last Starfighter",
      description:
          "A young hero in a futuristic suit stands ready for a cosmic battle in this sci-fi adventure.",
      cardData: Assets.images.a10.image(
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
  ];

  @override
  void initState() {
    cards = [
      for (int i = 0; i < 10; i++)
        Card(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: movieList[i].cardData,
        ),
    ];
    title = movieList.first.title;
    description = movieList.first.description;
    isAddedToWishList = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Flexible(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  height: 230,
                  child: Column(
                    crossAxisAlignment: .center,
                    children: [
                      SizedBox(height: 12),
                      Text(
                        title,
                        style: context.themeText.headlineSmall!.copyWith(
                          color: Colors.black,
                        ),
                        textAlign: .center,
                        overflow: .ellipsis,
                        maxLines: 2,
                      ),
                      Spacer(),
                      Text(
                        description,
                        maxLines: 5,
                        textAlign: .center,
                        style: context.themeText.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                        overflow: .ellipsis,
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: .end,
                        children: [
                          LikeButton(
                            isLiked: isAddedToWishList,
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Colors.deepPurpleAccent,
                              dotSecondaryColor: Color(0xff0099cc),
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                isAddedToWishList
                                    ? Icons.bookmark_added_rounded
                                    : Icons.bookmark_rounded,
                                color: isAddedToWishList
                                    ? Colors.deepPurpleAccent
                                    : Colors.grey,
                              );
                            },
                            onTap: (isLiked) async {
                              setState(() {
                                movieList[index].isWishListed = !isLiked;
                                isAddedToWishList =
                                    movieList[index].isWishListed;
                              });
                              return !isLiked;
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 24),
          Padding(
            padding: const EdgeInsets.only(right: 32),
            child: SizedBox(
              width: 150,
              height: 200,
              child: CardStackSwiper(
                controller: _controller,
                cardsCount: cards.length,
                initialIndex: 0,
                isLoop: true,
                backCardOffset: Offset(30, 0),
                onSwipe: (previousIndex, currentIndex, direction) {
                  setState(() {
                    title = movieList[currentIndex ?? 0].title;
                    description = movieList[currentIndex ?? 0].description;
                    isAddedToWishList =
                        movieList[currentIndex ?? 0].isWishListed;
                    index = currentIndex ?? 0;
                  });
                  return true;
                },

                cardBuilder:
                    (context, index, horizontalPercentage, verticalPercentage) {
                      return cards[index];
                    },
              ),
            ),
          ),
          //INFO: This contains how to controllers how to access cards pragmatically
          // const SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(
          //       icon: const Icon(Icons.undo),
          //       onPressed: _controller.undo,
          //     ),
          //     IconButton(
          //       icon: const Icon(Icons.arrow_forward),
          //       onPressed: () =>
          //           _controller.swipe(CardStackSwiperDirection.right),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class ExpandableCardsExample extends StatefulWidget {
  const ExpandableCardsExample({super.key});

  @override
  State<ExpandableCardsExample> createState() => _ExpandableCardsExampleState();
}

class _ExpandableCardsExampleState extends State<ExpandableCardsExample> {
  // -1 means no card is expanded
  int _selectedIndex = -1;

  final List<MovieModels> imageData = [
    MovieModels(
      title: "The Wasteland Drifter",
      description:
          "A lone survivor navigating a desolate, post-apocalyptic world with his loyal companion.",
      cardData: Assets.images.char1.image(),
    ),
    MovieModels(
      title: "The Forest Sentinel",
      description:
          "An elven archer who protects the ancient forests, guided by a mystical wisp.",
      cardData: Assets.images.char2.image(),
    ),
    MovieModels(
      title: "The Cyberpunk Mercenary",
      description:
          "A technologically enhanced soldier of fortune in a neon-drenched futuristic city.",
      cardData: Assets.images.char3.image(),
    ),
    MovieModels(
      title: "The Summit Explorer",
      description:
          "A rugged mountaineer conquering the highest peaks with the help of high-tech gear.",
      cardData: Assets.images.char4.image(),
    ),
    MovieModels(
      title: "The Pirate Lord",
      description:
          "A charismatic captain with a glowing cutlass and a parrot, ruling the tropical seas.",
      cardData: Assets.images.char5.image(),
    ),
    MovieModels(
      title: "The Desert Nomad",
      description:
          "A skilled warrior traversing the endless sand dunes with her camel and a magical amulet.",
      cardData: Assets.images.char6.image(),
    ),
    MovieModels(
      title: "The City Vanguard",
      description:
          "A battle-hardened soldier in power armor, a guardian of the sprawling futuristic metropolis.",
      cardData: Assets.images.char7.image(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen width to calculate exact 1/4 size
    final double screenWidth = MediaQuery.of(context).size.width;

    // 1/4 of screen, minus a little bit for padding/spacing
    final double collapsedWidth = (screenWidth / 4) - 12;
    final double expandedWidth = screenWidth * 0.7;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: imageData.length,
      itemBuilder: (context, index) {
        bool isExpanded = index == _selectedIndex;

        return GestureDetector(
          onTap: () {
            setState(() {
              // Toggle: if clicking same card, close it. Else open it.
              if (_selectedIndex == index) {
                _selectedIndex = -1;
              } else {
                _selectedIndex = index;
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn, // Smooth expansion curve
            // Animate Width
            width: isExpanded ? expandedWidth : collapsedWidth,

            margin: const EdgeInsets.only(right: 12),

            // Animate Decoration (Image expands automatically)
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: imageData[index].cardData.image,
                fit: BoxFit.cover, // Image stretches to fill new width
                // Darken image when collapsed to focus on the expanded one
              ),
            ),

            // Child content (Text)
            child: Stack(
              children: [
                // Collapsed State: Vertical Text or Number
                // if (!isExpanded)
                //   Center(
                //     child: Text(
                //       "${index + 1}",
                //       style: const TextStyle(
                //         color: Colors.white,
                //         fontSize: 24,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),

                // Expanded State: Detailed Info
                // AnimatedOpacity makes text fade in nicely
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isExpanded ? 1.0 : 0.0,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black87],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            imageData[index].title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow
                                .ellipsis, // Prevent overflow during anim
                            maxLines: 1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            imageData[index].description,
                            style: TextStyle(color: Colors.white70),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
