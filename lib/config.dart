
import 'package:reqresz/core/constant/lbl_text.dart';
import 'package:reqresz/core/theme/app_css.dart';
import 'package:reqresz/core/theme/app_theme.dart';

export 'package:reqresz/core/constant/lbl_text.dart';
export 'package:reqresz/core/theme/app_css.dart';
export 'package:reqresz/core/theme/app_theme.dart';

export 'package:flutter/material.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:reqresz/core/extension/text_style_extensions.dart';


AppCss appCss = AppCss();
LblText lblText = LblText();

AppTheme _appTheme = AppTheme.defaultType();
AppTheme get appTheme => _appTheme;
