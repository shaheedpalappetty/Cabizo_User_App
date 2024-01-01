part of 'coupon_bloc.dart';

abstract class CouponState {}

final class CouponInitial extends CouponState {}

final class CouponSelectedState extends CouponState {
  bool select;
  int index;
  CouponSelectedState({required this.select,required this.index});
}
