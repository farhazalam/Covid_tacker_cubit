part of 'country_cubit.dart';

@immutable
abstract class CountryState {
  const CountryState();
}

class CountryInitial extends CountryState {
  const CountryInitial();
}

class CountryLoading extends CountryState {
  const CountryLoading();
}

class CountryLoaded extends CountryState {
  final Country country;
  const CountryLoaded(this.country);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CountryLoaded && o.country == country;
  }

  @override
  int get hashCode => country.hashCode;
}

class CountryError extends CountryState {
  final String message;
  const CountryError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CountryError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
