import 'package:coffee_market_prices/core/error/failures.dart';
import 'package:coffee_market_prices/features/feature_prices/domain/entities/spice_prices.dart';
import 'package:dartz/dartz.dart';

abstract class SpicePricesRepository {
  Future<Either<Failure, List<List<SpicePrice>>>> getAllPrices();
  Future<Either<Failure, List<SpicePrice>>> getLatestPrices();
}