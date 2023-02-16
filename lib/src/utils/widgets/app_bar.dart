
import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

AppBar PrimaryAppBar(BuildContext context) {
  return AppBar(leading: IconButton(icon:Icon(Icons.arrow_back_ios,color: AppTheme.black,),onPressed: (){
    Navigator.pop(context);
  },),backgroundColor: AppTheme.white,elevation: 0.0,);
}

