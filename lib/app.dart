import 'package:animations/pages/custom/animated_builder_page.dart';
import 'package:animations/pages/custom/animated_switcher_page.dart';
import 'package:animations/pages/custom/animated_widget_page.dart';
import 'package:animations/pages/custom/animation_controller_set_state_enhanced2_page.dart';
import 'package:animations/pages/custom/animation_controller_set_state_enhanced_page.dart';
import 'package:animations/pages/custom/animation_controller_set_state_page.dart';
import 'package:animations/pages/custom/custom_page.dart';
import 'package:animations/pages/custom/implicitly_animated_widget_page.dart';
import 'package:animations/pages/flare/apple_lock_page.dart';
import 'package:animations/pages/flare/flare_page.dart';
import 'package:animations/pages/flight_search/flight_search_page.dart';
import 'package:animations/pages/home/home_page.dart';
import 'package:animations/pages/implicitly_animated/animated_align.dart';
import 'package:animations/pages/implicitly_animated/animated_container.dart';
import 'package:animations/pages/implicitly_animated/animated_cross_fade.dart';
import 'package:animations/pages/implicitly_animated/animated_default_text_style.dart';
import 'package:animations/pages/implicitly_animated/animated_icon.dart';
import 'package:animations/pages/implicitly_animated/animated_list.dart';
import 'package:animations/pages/implicitly_animated/animated_modal_barrier.dart';
import 'package:animations/pages/implicitly_animated/animated_opacity.dart';
import 'package:animations/pages/implicitly_animated/animated_padding.dart';
import 'package:animations/pages/implicitly_animated/animated_physical_model.dart';
import 'package:animations/pages/implicitly_animated/animated_positioned.dart';
import 'package:animations/pages/implicitly_animated/animated_positioned_directional.dart';
import 'package:animations/pages/implicitly_animated/animated_size_page.dart';
import 'package:animations/pages/implicitly_animated/animated_switcher_page.dart';
import 'package:animations/pages/implicitly_animated/animated_theme_page.dart';
import 'package:animations/pages/implicitly_animated/fade_in_image_page.dart';
import 'package:animations/pages/implicitly_animated/hero_page.dart';
import 'package:animations/pages/implicitly_animated/implicitly_animated_page.dart';
import 'package:animations/pages/transition/align_transition_page.dart';
import 'package:animations/pages/transition/decorated_box_transition_page.dart';
import 'package:animations/pages/transition/default_text_style_transition_page.dart';
import 'package:animations/pages/transition/fade_transition_page.dart';
import 'package:animations/pages/transition/positioned_transition_page.dart';
import 'package:animations/pages/transition/relative_positioned_transition_page.dart';
import 'package:animations/pages/transition/rotation_transition_page.dart';
import 'package:animations/pages/transition/scale_transition_page.dart';
import 'package:animations/pages/transition/size_transition_page.dart';
import 'package:animations/pages/transition/slide_transition_page.dart';
import 'package:animations/pages/transition/transition_page.dart';
import 'package:flutter/material.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootNavigatorKey,
      title: 'Animations',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
      routes: {
        // Animated
        ImplicitlyAnimatedPage.routeName: (_context) =>
            ImplicitlyAnimatedPage(),
        AnimatedAlignPage.routeName: (_context) => AnimatedAlignPage(),
        AnimatedContainerPage.routeName: (_context) => AnimatedContainerPage(),
        AnimatedCrossFadePage.routeName: (_context) => AnimatedCrossFadePage(),
        AnimatedDefaultTextStylePage.routeName: (_context) =>
            AnimatedDefaultTextStylePage(),
        AnimatedIconPage.routeName: (_context) => AnimatedIconPage(),
        AnimatedListPage.routeName: (_context) => AnimatedListPage(),
        AnimatedModalBarrierPage.routeName: (_context) =>
            AnimatedModalBarrierPage(),
        AnimatedOpacityPage.routeName: (_context) => AnimatedOpacityPage(),
        AnimatedPaddingPage.routeName: (_context) => AnimatedPaddingPage(),
        AnimatedPhysicalModelPage.routeName: (_context) =>
            AnimatedPhysicalModelPage(),
        AnimatedPositionedPage.routeName: (_context) =>
            AnimatedPositionedPage(),
        AnimatedPositionedDirectionalPage.routeName: (_context) =>
            AnimatedPositionedDirectionalPage(),
        AnimatedThemePage.routeName: (_context) => AnimatedThemePage(),
        AnimatedSwitcherPage.routeName: (_context) => AnimatedSwitcherPage(),
        AnimatedSizePage.routeName: (_context) => AnimatedSizePage(),
        HeroPage.routeName: (_context) => HeroPage(),
        FadeInImagePage.routeName: (_context) => FadeInImagePage(),
        // Transition
        TransitionPage.routeName: (_context) => TransitionPage(),
        SlideTransitionPage.routeName: (_context) => SlideTransitionPage(),
        ScaleTransitionPage.routeName: (_context) => ScaleTransitionPage(),
        RotationTransitionPage.routeName: (_context) =>
            RotationTransitionPage(),
        SizeTransitionPage.routeName: (_context) => SizeTransitionPage(),
        FadeTransitionPage.routeName: (_context) => FadeTransitionPage(),
        PositionedTransitionPage.routeName: (_context) =>
            PositionedTransitionPage(),
        RelativePositionedTransitionPage.routeName: (_context) =>
            RelativePositionedTransitionPage(),
        DecoratedBoxTransitionPage.routeName: (_context) =>
            DecoratedBoxTransitionPage(),
        AlignTransitionPage.routeName: (_context) => AlignTransitionPage(),
        DefaultTextStyleTransitionPage.routeName: (_context) =>
            DefaultTextStyleTransitionPage(),
        // ここ配下に別テーマを適用させるためにMaterialAppを使ったが問題あり
        // - ナビゲーションで戻れない(とりあえずグローバルなrootNavigatorKeyで暫定対処)
        // - インスペクターがエラーになる
        FlightSearchPage.routeName: (_context) => MaterialApp(
              theme: ThemeData(primarySwatch: Colors.red),
              home: const FlightSearchPage(),
            ),
        CustomPage.routeName: (_context) => CustomPage(),
        AnimationControllerSetStatePage.routeName: (_context) =>
            AnimationControllerSetStatePage(),
        AnimationControllerSetStateEnhancedPage.routeName: (_context) =>
            AnimationControllerSetStateEnhancedPage(),
        AnimationControllerSetStateEnhanced2Page.routeName: (_context) =>
            AnimationControllerSetStateEnhanced2Page(),
        AnimatedWidgetPage.routeName: (_context) => AnimatedWidgetPage(),
        AnimatedBuilderPage.routeName: (_context) => AnimatedBuilderPage(),
        AnimatedSwitcher2Page.routeName: (_context) => AnimatedSwitcher2Page(),
        ImplicitlyAnimatedWidgetPage.routeName: (_context) =>
            ImplicitlyAnimatedWidgetPage(),
        FlarePage.routeName: (_context) => FlarePage(),
        AppleLockPage.routeName: (_context) => AppleLockPage(),
      },
    );
  }
}
