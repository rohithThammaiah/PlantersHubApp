import 'package:coffee_market_prices/core/error/failures.dart';
import 'package:coffee_market_prices/features/feature_prices/domain/entities/spice_prices.dart';
import 'package:coffee_market_prices/features/feature_prices/domain/repositories/prices_repository.dart';
import 'package:dartz/dartz.dart';

class GetLatestSpicePrices {
  final SpicePricesRepository repository;

  GetLatestSpicePrices(this.repository);

  Future<Either<Failure, List<SpicePrice>>> execute() async {
    return await repository.getLatestPrices();
  }
}