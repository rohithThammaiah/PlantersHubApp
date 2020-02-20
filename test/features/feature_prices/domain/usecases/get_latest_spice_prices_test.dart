import 'package:coffee_market_prices/features/feature_prices/domain/entities/spice_prices.dart';
import 'package:coffee_market_prices/features/feature_prices/domain/usecases/get_latest_spice_prices.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'get_all_spice_prices_test.dart';

void main() {
  GetLatestSpicePrices usecase;
  MockSpicePricesRepository spicePricesRepository;

  setUp(() {
    spicePricesRepository = MockSpicePricesRepository();
    usecase = GetLatestSpicePrices(spicePricesRepository);
  });

  final spicePrices = new List<SpicePrice>();
  spicePrices.add(SpicePrice(spiceName: "Coffee",spicePrice: "2500-3000 / 50KG"));
  spicePrices.add(SpicePrice(spiceName: "Pepper",spicePrice: "200-300 / 50KG"));

  test('should get the latest prices for spices from repository', () async {
    // arrange
    when(spicePricesRepository.getLatestPrices())
        .thenAnswer((_) async => Right(spicePrices));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(spicePrices));
    verify(spicePricesRepository.getLatestPrices());
    verifyNoMoreInteractions(spicePricesRepository);
  },);
}