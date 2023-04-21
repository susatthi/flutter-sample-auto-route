import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logger.dart';

const _logPrefix = '[RIVERPOD]';

/// Riverpod の各 Provider のライフサイクルをログ出力するためのオブザーバー
///
/// ログ出力したい場合は Provider に name プロパティを設定すること
class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<dynamic> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (name != null) {
      final message = '$_logPrefix[ADD][${provider.hashCode}] $name: '
          'value = ${value?.toDebugString()}';
      if (value is AsyncError) {
        logger.w(message);
      } else {
        logger.v(message);
      }
    }
  }

  @override
  void providerDidFail(
    ProviderBase<dynamic> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (name != null) {
      logger.w(
        '$_logPrefix[ERROR][${provider.hashCode}] $name',
        error,
        stackTrace,
      );
    }
  }

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (name != null) {
      final message = '$_logPrefix[UPDATE][${provider.hashCode}] $name: '
          'newValue = ${newValue?.toDebugString()}';
      if (newValue is AsyncError) {
        logger.w(message);
      } else {
        logger.v(message);
      }
    }
  }

  @override
  void didDisposeProvider(
    ProviderBase<dynamic> provider,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (name != null) {
      logger.v(
        '$_logPrefix[DISPOSE][${provider.hashCode}] $name',
      );
    }
  }
}

extension _ObjectEx on Object {
  /// 通常の AsyncValue.toString() だとスタックトレースが変に
  /// 出力されるのでスタックトレースは出力しない
  String toDebugString() {
    if (this is AsyncValue) {
      final asyncValue = this as AsyncValue;
      final content = [
        if (asyncValue.isLoading) 'isLoading: ${asyncValue.isLoading}',
        if (asyncValue.hasValue) 'value: ${asyncValue.value}',
        if (asyncValue.hasError) ...[
          'error: ${asyncValue.error?.toString().replaceAll('\n', ' ')}',
        ]
      ].join(', ');

      return '$runtimeType($content)';
    }
    return toString();
  }
}
