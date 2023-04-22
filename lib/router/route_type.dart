import 'package:auto_route/auto_route.dart';

/// アニメーション無しのRouteType
class NoAnimationRouteType extends CustomRouteType {
  const NoAnimationRouteType()
      : super(
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
        );
}
