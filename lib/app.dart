import 'package:animations_app/pages/custom/animated_builder_page.dart';
import 'package:animations_app/pages/custom/animated_switcher_page.dart';
import 'package:animations_app/pages/custom/animated_widget_page.dart';
import 'package:animations_app/pages/custom/animation_controller_set_state_enhanced2_page.dart';
import 'package:animations_app/pages/custom/animation_controller_set_state_enhanced_page.dart';
import 'package:animations_app/pages/custom/animation_controller_set_state_page.dart';
import 'package:animations_app/pages/custom/custom_page.dart';
import 'package:animations_app/pages/custom/implicitly_animated_widget_page.dart';
import 'package:animations_app/pages/flare/apple_lock_page.dart';
import 'package:animations_app/pages/flare/flare_page.dart';
import 'package:animations_app/pages/flight_search/flight_search_page.dart';
import 'package:animations_app/pages/home/home_page.dart';
import 'package:animations_app/pages/implicitly_animated/animated_align.dart';
import 'package:animations_app/pages/implicitly_animated/animated_container.dart';
import 'package:animations_app/pages/implicitly_animated/animated_cross_fade.dart';
import 'package:animations_app/pages/implicitly_animated/animated_default_text_style.dart';
import 'package:animations_app/pages/implicitly_animated/animated_icon.dart';
import 'package:animations_app/pages/implicitly_animated/animated_list.dart';
import 'package:animations_app/pages/implicitly_animated/animated_modal_barrier.dart';
import 'package:animations_app/pages/implicitly_animated/animated_opacity.dart';
import 'package:animations_app/pages/implicitly_animated/animated_padding.dart';
import 'package:animations_app/pages/implicitly_animated/animated_physical_model.dart';
import 'package:animations_app/pages/implicitly_animated/animated_positioned.dart';
import 'package:animations_app/pages/implicitly_animated/animated_positioned_directional.dart';
import 'package:animations_app/pages/implicitly_animated/animated_size_page.dart';
import 'package:animations_app/pages/implicitly_animated/animated_switcher_page.dart';
import 'package:animations_app/pages/implicitly_animated/animated_theme_page.dart';
import 'package:animations_app/pages/implicitly_animated/fade_in_image_page.dart';
import 'package:animations_app/pages/implicitly_animated/hero_page.dart';
import 'package:animations_app/pages/implicitly_animated/implicitly_animated_page.dart';
import 'package:animations_app/pages/transition/align_transition_page.dart';
import 'package:animations_app/pages/transition/decorated_box_transition_page.dart';
import 'package:animations_app/pages/transition/default_text_style_transition_page.dart';
import 'package:animations_app/pages/transition/fade_transition_page.dart';
import 'package:animations_app/pages/transition/positioned_transition_page.dart';
import 'package:animations_app/pages/transition/relative_positioned_transition_page.dart';
import 'package:animations_app/pages/transition/rotation_transition_page.dart';
import 'package:animations_app/pages/transition/scale_transition_page.dart';
import 'package:animations_app/pages/transition/size_transition_page.dart';
import 'package:animations_app/pages/transition/slide_transition_page.dart';
import 'package:animations_app/pages/transition/transition_page.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootNavigatorKey,
      title: 'Animations',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: const HomePage(),
      routes: {
        // Animated
        ImplicitlyAnimatedPage.routeName: (context) =>
            const ImplicitlyAnimatedPage(),
        AnimatedAlignPage.routeName: (context) => const AnimatedAlignPage(),
        AnimatedContainerPage.routeName: (context) =>
            const AnimatedContainerPage(),
        AnimatedCrossFadePage.routeName: (context) =>
            const AnimatedCrossFadePage(),
        AnimatedDefaultTextStylePage.routeName: (context) =>
            const AnimatedDefaultTextStylePage(),
        AnimatedIconPage.routeName: (context) => const AnimatedIconPage(),
        AnimatedListPage.routeName: (context) => const AnimatedListPage(),
        AnimatedModalBarrierPage.routeName: (context) =>
            const AnimatedModalBarrierPage(),
        AnimatedOpacityPage.routeName: (context) => const AnimatedOpacityPage(),
        AnimatedPaddingPage.routeName: (context) => const AnimatedPaddingPage(),
        AnimatedPhysicalModelPage.routeName: (context) =>
            const AnimatedPhysicalModelPage(),
        AnimatedPositionedPage.routeName: (context) =>
            const AnimatedPositionedPage(),
        AnimatedPositionedDirectionalPage.routeName: (context) =>
            const AnimatedPositionedDirectionalPage(),
        AnimatedThemePage.routeName: (context) => const AnimatedThemePage(),
        AnimatedSwitcherPage.routeName: (context) =>
            const AnimatedSwitcherPage(),
        AnimatedSizePage.routeName: (context) => const AnimatedSizePage(),
        HeroPage.routeName: (context) => const HeroPage(),
        FadeInImagePage.routeName: (context) => const FadeInImagePage(),
        // Transition
        TransitionPage.routeName: (context) => const TransitionPage(),
        SlideTransitionPage.routeName: (context) => const SlideTransitionPage(),
        ScaleTransitionPage.routeName: (context) => const ScaleTransitionPage(),
        RotationTransitionPage.routeName: (context) =>
            const RotationTransitionPage(),
        SizeTransitionPage.routeName: (context) => const SizeTransitionPage(),
        FadeTransitionPage.routeName: (context) => const FadeTransitionPage(),
        PositionedTransitionPage.routeName: (context) =>
            const PositionedTransitionPage(),
        RelativePositionedTransitionPage.routeName: (context) =>
            const RelativePositionedTransitionPage(),
        DecoratedBoxTransitionPage.routeName: (context) =>
            const DecoratedBoxTransitionPage(),
        AlignTransitionPage.routeName: (context) => const AlignTransitionPage(),
        DefaultTextStyleTransitionPage.routeName: (context) =>
            const DefaultTextStyleTransitionPage(),
        // ここ配下に別テーマを適用させるためにMaterialAppを使ったが問題あり
        // - ナビゲーションで戻れない(とりあえずグローバルなrootNavigatorKeyで暫定対処)
        // - インスペクターがエラーになる
        FlightSearchPage.routeName: (context) => MaterialApp(
              theme: ThemeData(primarySwatch: Colors.red),
              home: const FlightSearchPage(),
            ),
        CustomPage.routeName: (context) => const CustomPage(),
        AnimationControllerSetStatePage.routeName: (context) =>
            const AnimationControllerSetStatePage(),
        AnimationControllerSetStateEnhancedPage.routeName: (context) =>
            const AnimationControllerSetStateEnhancedPage(),
        AnimationControllerSetStateEnhanced2Page.routeName: (context) =>
            const AnimationControllerSetStateEnhanced2Page(),
        AnimatedWidgetPage.routeName: (context) => const AnimatedWidgetPage(),
        AnimatedBuilderPage.routeName: (context) => const AnimatedBuilderPage(),
        AnimatedSwitcher2Page.routeName: (context) =>
            const AnimatedSwitcher2Page(),
        ImplicitlyAnimatedWidgetPage.routeName: (context) =>
            const ImplicitlyAnimatedWidgetPage(),
        FlarePage.routeName: (context) => const FlarePage(),
        AppleLockPage.routeName: (context) => const AppleLockPage(),
      },
    );
  }
}
