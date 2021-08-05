class DartUtils {
  ///判断值是否为null
  static bool isNull(dynamic value) => value == null;

  ///判断字符串或者集合是否为空
  static bool isEmpty(dynamic value) {
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is Iterable || value is Map) {
      return value.isEmpty;
    }
    return false;
  }

  ///value 是否有长度属性
  static bool hasLength(dynamic value) {
    return value is Iterable || value is String || value is Map;
  }

  ///判断value是null 或者为空集合或者空字符串
  static bool isNullOrBlank(dynamic value) {
    if (isNull(value)) {
      return true;
    }
    return isEmpty(value);
  }

  ///字符串是否符合正则表达式
  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  ///判断字符串是否为数字（int,double）
  static bool isNum(String? value) {
    if (value == null) {
      return false;
    }
    return num.tryParse(value) is num;
  }

  ///字符串中是否只包含数字
  static bool isNumericOnly(String? s) {
    if (s == null) {
      return false;
    }
    return hasMatch(s, r'^\d+$');
  }

  ///字符串中是否只包含字母
  static bool isAlphabetOnly(String? s) {
    if (s == null) {
      return false;
    }
    return hasMatch(s, r'^[a-zA-Z]+$');
  }

  ///字符串是否包含最少一个大写字母
  static bool hasCapitalletter(String? s) {
    if (s == null) {
      return false;
    }
    return hasMatch(s, r'[A-Z]');
  }

  ///是否是bool值
  static bool isBool(String? value) {
    if (value == null) {
      return false;
    }
    return (value == 'true' || value == 'false');
  }

  ///文件是否是视频
  static bool isVideo(String? filePath) {
    if (filePath == null) {
      return false;
    }
    var ext = filePath.toLowerCase();
    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  ///文件是否是图片
  static bool isImage(String? filePath) {
    if (filePath == null) {
      return false;
    }
    final ext = filePath.toLowerCase();
    return ext.endsWith(".jpg") ||
        ext.endsWith(".jpeg") ||
        ext.endsWith(".png") ||
        ext.endsWith(".gif") ||
        ext.endsWith(".bmp");
  }

  ///文件是否是音频
  static bool isAudio(String? filePath) {
    if (filePath == null) {
      return false;
    }
    final ext = filePath.toLowerCase();
    return ext.endsWith(".mp3") ||
        ext.endsWith(".wav") ||
        ext.endsWith(".wma") ||
        ext.endsWith(".amr") ||
        ext.endsWith(".ogg");
  }

  ///文件是否是PPT
  static bool isPPT(String? filePath) {
    if (filePath == null) {
      return false;
    }
    final ext = filePath.toLowerCase();
    return ext.endsWith(".ppt") || ext.endsWith(".pptx");
  }
}
