import 'package:coffee_market_prices/features/feature_prices/domain/repositories/prices_repository.dart';
import 'package:coffee_market_prices/features/feature_prices/domain/usecases/get_all_spice_prices.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:coffee_market_prices/features/feature_prices/domain/entities/spice_prices.dart';


class MockSpicePricesRepository extends Mock implements SpicePricesRepository {}

void main() {
  GetAllSpicePrices usecase;
  MockSpicePricesRepository spicePricesRepository;

  setUp(() {
    spicePricesRepository = MockSpicePricesRepository();
    usecase = GetAllSpicePrices(spicePricesRepository);
  });

  final mondayPrices = new List<SpicePrice>();
  mondayPrices.add(SpicePrice(spiceName: "Coffee",spicePrice: "1000-2000 / 50KG"));
  mondayPrices.add(SpicePrice(spiceName: "Pepper",spicePrice: "100-200 / 50KG"));

  final tuesdayPrices = new List<SpicePrice>();
  tuesdayPrices.add(SpicePrice(spiceName: "Coffee",spicePrice: "2500-3000 / 50KG"));
  tuesdayPrices.add(SpicePrice(spiceName: "Pepper",spicePrice: "200-300 / 50KG"));

  final mockResponse = new List<List<SpicePrice>>();
  mockResponse.add(mondayPrices);
  mockResponse.add(tuesdayPrices);
  
  test('should get all price of spices from the repo', () async {
    // arrange
    when(spicePricesRepository.getAllPrices())
        .thenAnswer((_) async => Right(mockResponse));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(mockResponse));
    verify(spicePricesRepository.getAllPrices());
    verifyNoMoreInteractions(spicePricesRepository);
  },);
}