// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:json_serializable/builder.dart' as _i2;
import 'package:built_value_generator/builder.dart' as _i3;
import 'package:source_gen/builder.dart' as _i4;
import 'package:injectable_generator/builder.dart' as _i5;
import 'package:auto_route_generator/builder.dart' as _i6;
import 'package:build_resolvers/builder.dart' as _i7;
import 'dart:isolate' as _i8;
import 'package:build_runner/build_runner.dart' as _i9;
import 'dart:io' as _i10;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
    r'json_serializable:json_serializable',
    [_i2.jsonSerializable],
    _i1.toDependentsOf(r'json_serializable'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'built_value_generator:built_value',
    [_i3.builtValue],
    _i1.toDependentsOf(r'built_value_generator'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'source_gen:combining_builder',
    [_i4.combiningBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
    appliesBuilders: const [r'source_gen:part_cleanup'],
  ),
  _i1.apply(
    r'injectable_generator:injectable_builder',
    [_i5.injectableBuilder],
    _i1.toDependentsOf(r'injectable_generator'),
    hideOutput: true,
  ),
  _i1.apply(
    r'injectable_generator:injectable_config_builder',
    [_i5.injectableConfigBuilder],
    _i1.toDependentsOf(r'injectable_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'auto_route_generator:auto_route_generator',
    [_i6.autoRouteBuilder],
    _i1.toDependentsOf(r'auto_route_generator'),
    hideOutput: true,
  ),
  _i1.apply(
    r'auto_route_generator:auto_router_module_generator',
    [_i6.autoRouterModuleBuilder],
    _i1.toDependentsOf(r'auto_route_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'auto_route_generator:auto_router_generator',
    [_i6.autoRouterBuilder],
    _i1.toDependentsOf(r'auto_route_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'build_resolvers:transitive_digests',
    [_i7.transitiveDigestsBuilder],
    _i1.toAllPackages(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [r'build_resolvers:transitive_digest_cleanup'],
  ),
  _i1.applyPostProcess(
    r'build_resolvers:transitive_digest_cleanup',
    _i7.transitiveDigestCleanup,
  ),
  _i1.applyPostProcess(
    r'source_gen:part_cleanup',
    _i4.partCleanup,
  ),
];
void main(
  List<String> args, [
  _i8.SendPort? sendPort,
]) async {
  var result = await _i9.run(
    args,
    _builders,
  );
  sendPort?.send(result);
  _i10.exitCode = result;
}
