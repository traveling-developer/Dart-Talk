import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;

import 'package:path/path.dart' as path;

typedef HelloWorldFunction = ffi.Void Function();
typedef HelloWorld = void Function();

void interop() {
  var libraryPath =
      path.join(Directory.current.path, 'lib/cLibrary', 'libhello.so');

  if (Platform.isMacOS) {
    libraryPath =
        path.join(Directory.current.path, 'lib/cLibrary', 'libhello.dylib');
  } else if (Platform.isWindows) {
    libraryPath =
        path.join(Directory.current.path, 'lib/cLibrary', 'Debug', 'hello.dll');
  }

  final dynamicLibrary = ffi.DynamicLibrary.open(libraryPath);

  // Look up the C function 'hello_world'
  final HelloWorld hello = dynamicLibrary
      .lookup<ffi.NativeFunction<HelloWorldFunction>>('hello_world')
      .asFunction();

  // Call the function
  hello();
}
