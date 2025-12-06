import 'package:animations/src/home/slivers/accessability_slivers.dart';
import 'package:animations/src/home/slivers/cards_sliver.dart';
import 'package:animations/src/home/slivers/clip_art_widgets.dart';
import 'package:animations/src/home/slivers/custom_popups_slivers.dart';
import 'package:animations/src/home/slivers/header_sliver.dart';
import 'package:animations/src/home/slivers/loading_slivers.dart';
import 'package:animations/src/home/slivers/local_custom_notifications.dart';
import 'package:animations/src/home/slivers/parallax_effects.dart';
import 'package:animations/src/home/slivers/scrollable_layouts.dart';
import 'package:animations/src/home/slivers/thankyou_sliver.dart';
import 'package:animations/src/home/slivers/welcome_sliver.dart';
import 'package:animations/src/home/widgets/layout_widget.dart';
import 'package:animations/src/providers/title_animation_provider.dart';
import 'package:flutter/material.dart';

/// wrap a class around this file
///

/// Global keys for each sliver section
GlobalKey welcomeKey = GlobalKey();
GlobalKey headerKey = GlobalKey();
GlobalKey cardsKey = GlobalKey();
GlobalKey clipArtsKey = GlobalKey();
GlobalKey layoutsKey = GlobalKey();
GlobalKey loadersKey = GlobalKey();
GlobalKey popupsKey = GlobalKey();
GlobalKey accessabilityKey = GlobalKey();
GlobalKey parallaxKey = GlobalKey();
GlobalKey notificationsKey = GlobalKey();
GlobalKey liveActivitiesKey = GlobalKey();
GlobalKey thankYouKey = GlobalKey();

class SliverSections {
  /// A list of global keys corresponding to each sliver section.
  static List<GlobalKey> sliverKeys = [
    welcomeKey,
    headerKey,
    cardsKey,
    clipArtsKey,
    layoutsKey,
    loadersKey,
    popupsKey,
    accessabilityKey,
    parallaxKey,
    notificationsKey,
    thankYouKey,
  ];

  static List<String> titles = [
    "",
    "",
    "Cards",
    "Clip Art",
    "Scrollable",
    "Loaders",
    "Popup Keys",
    "Accessability",
    "Parallax Scrolling",
    "Notifications",
    "Thank You",
  ];

  static List<Color> titleColors = [
    Color(0xFFFFD6DD), // soft rose (works on dark + light)
    Color(0xFFBEE9FF), // soft sky blue
    Color(0xFFBBE2DE), // mint aqua
    Color(0xFFAED9DF), // muted teal
    Color(0xFF6BC4E2), // aqua blue
    Color(0xFF4E89DA), // steel blue
    Color(0xFF3F6FB2), // deep desaturated blue
    Color(0xFF5167D6), // cool saturated blue-purple
    Color(0xFFD9B3FF), // lavender (dark-safe)
    Color(0xFF7A63E8), // indigo violet
    Color(0xFF243A63), // dark navy (visible in light mode)
  ];

  /// A list of slivers used in the Home screen's CustomScrollView.
  static final List<Widget> sliverList = [
    /// Welcome Sliver
    WelcomeSliver(),

    /// Header Sliver
    HeaderSliver(),

    /// Cards and Hero animations
    CardsSliver(),

    /// Clips arts
    ClipArtWidgets(),

    /// layout animations (Grid or Staggered or Masonry or List) flutter_staggered_grid_view
    ScrollableLayouts(),

    /// Loaders all type of loaders
    LoadingSlivers(),

    /// Custom Toasts, Custom Cards, Custom Bottom Sheets, Alerts, Dialogs,Confetti
    CustomPopupsSlivers(),

    /// Accessability Features
    AccessabilitySlivers(),

    /// Parallax effects
    ParallaxEffects(),

    /// Custom Notifications, Dynamic isLand
    LocalCustomNotifications(),

    /// Thank you Sliver
    ThankyouSliver(),
  ];

  /// Generates a list of sliver widgets wrapped with their corresponding global keys.
  static List<Widget> generateSliverList() {
    final updatedSliverList = <Widget>[];
    for (int index = 0; index < sliverKeys.length; index++) {
      if (index > 1) {
        updatedSliverList.add(
          LayoutWidget(
            headerData: HeaderData(
              color: titleColors[index],
              title: titles[index],
            ),
            sectionKey: sliverKeys[index],
            child: sliverList[index],
          ),
        );
      } else {
        updatedSliverList.add(
          KeyedSubtree(key: sliverKeys[index], child: sliverList[index]),
        );
      }
    }
    return updatedSliverList;
  }

  static Future<void> scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx != null) {
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        alignment: 0, // 0 = top, 0.5 = center, 1.0 = bottom
        curve: Curves.easeInOut,
      );
    }
  }
}
