// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
    @EnviedField(varName: 'BASE_URL',obfuscate: true)
    static  String baseUrl = _Env.baseUrl;
}
