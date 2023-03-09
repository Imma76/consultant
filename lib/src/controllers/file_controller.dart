import 'dart:io';

import 'package:consultant/src/utils/widgets/reusable_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();
class FileController{
  Future pickCv()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      //File file = File(result.files.single.path.toString());
      return result;
    } else {
      return null;
      // User canceled the picker
    }
  }

  pickMedicalLicense()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
     // File file = File(result.files.single.path.toString());
      return result;
    } else {
      return null;
      // User canceled the picker
    }
  }

  pickPhoto()async{
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image== null){
      return null;
    }
    return image!;
  }

  uploadFileToDb(File file,{String? filePath,String? fileName})async{
    final name = uuid.v4();
    try{
      final upload =await  FirebaseStorage.instance.ref('/$filePath').child(fileName.toString()
      ).putFile(file);
      showToast('file Uploaded');
      final url = await upload.ref.getDownloadURL();
      return url;
    }catch(e){
      print('error${e.toString()}');
    }

  }



}