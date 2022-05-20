import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_news/managers/app_state_manager.dart';
import 'package:flutter_news/screens/loginscreen/login_screen.dart';
import 'package:flutter_news/screens/onboardingScreen/intro_screen.dart';
import 'package:flutter_news/screens/splashscreen/splashscreen.dart';
import 'package:go_router/go_router.dart';

import '../home.dart';
import '../screens/SignUpPage/sign_up_page.dart';
import '../screens/categories_tab/categoryPage/category_page.dart';
import '../screens/detailsScreen/details_screen.dart';
import '../screens/news_site_screen/news_site_page.dart';
import '../screens/onboardingScreen/onboarding_screen.dart';
import '../screens/searchPage/search_page.dart';

final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => Home(), routes: [
        GoRoute(
            path: 'details/someID',
            builder: (context, state) => DetailsScreen()),
        GoRoute(
            path: 'source/someSourceID',
            builder: (context, state) => NewsSitePage()),
        GoRoute(
            path: 'categoryID', builder: (context, state) => CategoryPage()),
        GoRoute(path: 'search', builder: (context, state) => SearchPage())
      ]),
      GoRoute(
          path: '/splash',
          builder: (context, state) => Splashscreen(),
          name: 'splash'),
      GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
                path: 'signup',
                builder: (context, state) => SignUpPage(),
                name: 'signup'),
          ]),
      GoRoute(path: '/boarding', builder: (context, state) => BoardingPage())
    ],
    initialLocation: '/splash',
    refreshListenable: appStateManager,
    redirect: (GoRouterState state) {
      //code is executed from top to bottom..
      if (!appStateManager.isInitialized) {
        //deep linking
        if (state.subloc != '/splash') {
          return '/splash' + '?next=${state.location}';
        }
        return null;
      }

      if (!appStateManager.isBoarded) {
        if (state.subloc != '/boarding') {
          return '/boarding';
        }
        return null;
      }

      if (!appStateManager.isLoggedin) {
        if (state.subloc == '/login/signup') {
          return null;
        }

        if (state.subloc != '/login') {
          return '/login';
        }
        return null;
      }

      if (state.subloc == '/splash' || state.subloc == '/login') {
        if (state.queryParams.containsKey('next')) {
          //deep linking
          return state.queryParams['next']!;
        }
        return '/';
      }
      return null;
    });
