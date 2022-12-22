import 'dart:io';

// function to create directories
createDirectory(var directory) {
  Directory('$directory/videos').createSync(recursive: true);
  Directory('$directory/music').createSync(recursive: true);
  Directory('$directory/images').createSync(recursive: true);
  Directory('$directory/documents').createSync(recursive: true);
}

moveFiles() {
  // specify the directory containing the files
  final directory = "/c/Users/USER/Downloads";
  // final directory = ".\\bin";

  // checking if directories exist if they dont they are created
  if (!Directory('$directory/videos').existsSync() &&
      !Directory('$directory/music').existsSync() &&
      !Directory('$directory/images').existsSync() &&
      !Directory('$directory/documents').existsSync()) {
    createDirectory(directory);
  }

  // iterate through all the files in the directory
  for (var file in Directory(directory).listSync()) {
    print(file);

    // skip directories
    if (file is Directory) continue;

    // get the file extension
    final fileExtension = file.path.split('.').last;

    // move the file to the appropriate directory
    if (fileExtension == 'dart') {
      print("we dont move .dart files");
    } else if (fileExtension == 'mp4' || fileExtension == 'mkv') {
      file.renameSync('$directory/videos/${file.path.split('/').last}');
    } else if (fileExtension == 'mp3' || fileExtension == 'wav') {
      file.renameSync('$directory/music/${file.path.split('/').last}');
    } else if (fileExtension == 'jpg' ||
        fileExtension == 'png' ||
        fileExtension == 'gif') {
      file.renameSync('$directory/images/${file.path.split('/').last}');
    } else {
      file.renameSync('$directory/documents/${file.path.split('/').last}');
    }
  }
}

// main() {
//   moveFiles();
// }
