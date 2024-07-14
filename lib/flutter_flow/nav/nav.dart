import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? RedirectionWidget() : Auth2LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? RedirectionWidget()
              : Auth2LoginWidget(),
        ),
        FFRoute(
          name: 'auth_2_CreateAccount',
          path: '/auth2CreateAccount',
          builder: (context, params) => Auth2CreateAccountWidget(
            role: params.getParam(
              'role',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'auth_2_Login',
          path: '/auth2Login',
          builder: (context, params) => Auth2LoginWidget(),
        ),
        FFRoute(
          name: 'auth_2_ForgotPassword',
          path: '/auth2ForgotPassword',
          builder: (context, params) => Auth2ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'auth_2_createStudentProfile',
          path: '/auth2CreateStudentProfile',
          requireAuth: true,
          builder: (context, params) => Auth2CreateStudentProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_Profile',
          path: '/auth2Profile',
          requireAuth: true,
          builder: (context, params) => Auth2ProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_EditStudentProfile',
          path: '/auth2EditStudentProfile',
          requireAuth: true,
          builder: (context, params) => Auth2EditStudentProfileWidget(),
        ),
        FFRoute(
          name: 'studentDashboard',
          path: '/studentDashboard',
          requireAuth: true,
          builder: (context, params) => StudentDashboardWidget(),
        ),
        FFRoute(
          name: 'redirection',
          path: '/redirection',
          requireAuth: true,
          builder: (context, params) => RedirectionWidget(),
        ),
        FFRoute(
          name: 'auth_2_createTeacherProfile',
          path: '/auth2CreateTeacherProfile',
          requireAuth: true,
          builder: (context, params) => Auth2CreateTeacherProfileWidget(),
        ),
        FFRoute(
          name: 'teacherDashboard',
          path: '/teacherDashboard',
          requireAuth: true,
          builder: (context, params) => TeacherDashboardWidget(),
        ),
        FFRoute(
          name: 'adminTeacherList',
          path: '/adminTeacherList',
          requireAuth: true,
          builder: (context, params) => AdminTeacherListWidget(),
        ),
        FFRoute(
          name: 'teacherMySchedulesPage',
          path: '/teacherMySchedulesPage',
          requireAuth: true,
          builder: (context, params) => TeacherMySchedulesPageWidget(),
        ),
        FFRoute(
          name: 'adminSubjectList',
          path: '/adminSubjectList',
          requireAuth: true,
          builder: (context, params) => AdminSubjectListWidget(),
        ),
        FFRoute(
          name: 'studentMySessions',
          path: '/studentMySessions',
          requireAuth: true,
          builder: (context, params) => StudentMySessionsWidget(),
        ),
        FFRoute(
          name: 'teacherMySessionsPage',
          path: '/teacherMySessionsPage',
          requireAuth: true,
          builder: (context, params) => TeacherMySessionsPageWidget(),
        ),
        FFRoute(
          name: 'auth_2_EditTeacherProfile',
          path: '/auth2EditTeacherProfile',
          requireAuth: true,
          builder: (context, params) => Auth2EditTeacherProfileWidget(),
        ),
        FFRoute(
          name: 'quizTakeForm',
          path: '/quizTakeForm',
          requireAuth: true,
          asyncParams: {
            'quiz': getDoc(['quiz'], QuizRecord.fromSnapshot),
            'quizTaker': getDoc(
                ['QuizSession', 'QuizTaker'], QuizTakerRecord.fromSnapshot),
            'session': getDoc(['sessions'], SessionsRecord.fromSnapshot),
          },
          builder: (context, params) => QuizTakeFormWidget(
            quiz: params.getParam(
              'quiz',
              ParamType.Document,
            ),
            quizTaker: params.getParam(
              'quizTaker',
              ParamType.Document,
            ),
            session: params.getParam(
              'session',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'teacherQuizPage',
          path: '/teacherQuizPage',
          requireAuth: true,
          builder: (context, params) => TeacherQuizPageWidget(),
        ),
        FFRoute(
          name: 'QuizCreateForm',
          path: '/quizCreateForm',
          requireAuth: true,
          builder: (context, params) => QuizCreateFormWidget(),
        ),
        FFRoute(
          name: 'QuizEditForm',
          path: '/quizEditForm',
          requireAuth: true,
          asyncParams: {
            'quizToEdit': getDoc(['quiz'], QuizRecord.fromSnapshot),
          },
          builder: (context, params) => QuizEditFormWidget(
            quizToEdit: params.getParam(
              'quizToEdit',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_Details',
          path: '/chat2Details',
          requireAuth: true,
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_main',
          path: '/chat2Main',
          builder: (context, params) => Chat2MainWidget(),
        ),
        FFRoute(
          name: 'chat_2_InviteUsers',
          path: '/chat2InviteUsers',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2InviteUsersWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'image_Details',
          path: '/imageDetails',
          asyncParams: {
            'chatMessage':
                getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsWidget(
            chatMessage: params.getParam(
              'chatMessage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'studentInSession',
          path: '/studentInSession',
          requireAuth: true,
          asyncParams: {
            'chatDoc': getDoc(['chats'], ChatsRecord.fromSnapshot),
            'schedule': getDoc(['schedules'], SchedulesRecord.fromSnapshot),
            'session': getDoc(['sessions'], SessionsRecord.fromSnapshot),
          },
          builder: (context, params) => StudentInSessionWidget(
            chatDoc: params.getParam(
              'chatDoc',
              ParamType.Document,
            ),
            schedule: params.getParam(
              'schedule',
              ParamType.Document,
            ),
            session: params.getParam(
              'session',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'teacherInSession',
          path: '/teacherInSession',
          requireAuth: true,
          asyncParams: {
            'chatDoc': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => TeacherInSessionWidget(
            chatDoc: params.getParam(
              'chatDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'student_skill_rating',
          path: '/studentSkillRating',
          requireAuth: true,
          builder: (context, params) => StudentSkillRatingWidget(),
        ),
        FFRoute(
          name: 'teacherAttendancePage',
          path: '/teacherAttendancePage',
          requireAuth: true,
          builder: (context, params) => TeacherAttendancePageWidget(),
        ),
        FFRoute(
          name: 'studentAttendancePage',
          path: '/studentAttendancePage',
          requireAuth: true,
          builder: (context, params) => StudentAttendancePageWidget(),
        ),
        FFRoute(
          name: 'adminSubscriptions',
          path: '/adminSubscriptions',
          requireAuth: true,
          builder: (context, params) => AdminSubscriptionsWidget(),
        ),
        FFRoute(
          name: 'adminPaymentHistory',
          path: '/adminPaymentHistory',
          requireAuth: true,
          builder: (context, params) => AdminPaymentHistoryWidget(),
        ),
        FFRoute(
          name: 'adminSettingsPage',
          path: '/adminSettingsPage',
          requireAuth: true,
          builder: (context, params) => AdminSettingsPageWidget(),
        ),
        FFRoute(
          name: 'teacherRefundPage',
          path: '/teacherRefundPage',
          requireAuth: true,
          builder: (context, params) => TeacherRefundPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/auth2Login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/449502482_1493667721236596_6565879501599912661_n.png',
                      width: 128.0,
                      height: 128.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
