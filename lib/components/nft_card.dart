import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'dart:io' show Platform;

class NftCard extends StatelessWidget {
  final String modelPath;
  const NftCard({Key? key, required this.modelPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 添加调试信息
    print('尝试加载3D模型: $modelPath');
    
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 320, // 降低高度，从400降到320
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15,
                spreadRadius: 2,
                offset: Offset(0, 5)
              )
            ]
          ),
          child: ModelViewer(
            backgroundColor: const Color(0xFFFBCEEF), // 更新的浅粉色背景
            src: modelPath,
            alt: '3D NFT Model',
            ar: !Platform.isIOS || _isRealDevice(),
            autoRotate: true,
            cameraControls: true,
            disableZoom: false,
            disablePan: false,
            touchAction: TouchAction.panY,
            autoPlay: true,
            // 添加加载器和错误处理
            loading: Loading.eager,
          ),
        ),
      ),
    );
  }
  
  // 检测是否为模拟器
  bool _isRealDevice() {
    if (Platform.isIOS) {
      // 在iOS上，模拟器通常会有特定的设备名称
      try {
        // 在模拟器中这个值通常包含"Simulator"
        return !Platform.environment.containsKey('SIMULATOR_DEVICE_NAME');
      } catch (e) {
        print('模拟器检测错误: $e');
        return false;
      }
    }
    return true;
  }
}
