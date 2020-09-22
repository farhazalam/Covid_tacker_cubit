import 'package:bloc/bloc.dart';
import 'package:covid_tracker/Data/country_repository.dart';
import 'package:covid_tracker/Model/Country.dart';
import 'package:meta/meta.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final CountryRepository _countryRepository;
  CountryCubit(this._countryRepository) : super(CountryInitial());
  Future<void> getCountryData() async {
    emit(CountryLoading());

    Country country = await _countryRepository.fetchCountryData();

    if (country == null) {
      emit(CountryError('Some Error'));
    } else {
      emit(CountryLoaded(country));
    }
  }
}
