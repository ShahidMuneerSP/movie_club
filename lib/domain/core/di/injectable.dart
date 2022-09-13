import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_club/domain/core/di/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> confingureInjection() async{
await $initGetIt(getIt,environment: Environment.prod);
}