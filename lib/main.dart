import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft/pages/home_page.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 打印可用资源列表，用于调试
  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  print('Available assets: $manifestContent');
  
  // 添加更多调试信息
  try {
    final assetsList = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> assets = json.decode(assetsList);
    
    print('资源清单加载成功，共有 ${assets.length} 个资源');
    
    // 尝试加载每个Labubu模型
    for (int i = 1; i <= 6; i++) {
      final modelName = 'assets/Labubu$i.glb';
      try {
        final byteData = await rootBundle.load(modelName);
        print('✓ 成功加载模型: $modelName (${byteData.lengthInBytes} 字节)');
      } catch (e) {
        print('✗ 无法加载模型: $modelName - 错误: $e');
      }
    }
  } catch (e) {
    print('加载资源清单时出错: $e');
  }
  
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.lime),
    );
  }
}
