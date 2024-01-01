part of 'coupon_bloc.dart';

abstract class CouponEvent {}

final class CouponSelectEvent extends CouponEvent {
  final bool select;
  final int index;
  CouponSelectEvent({required this.select,required this.index});
}
