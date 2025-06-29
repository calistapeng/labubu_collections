#!/bin/bash

echo "===== 准备在iOS模拟器上重新构建并运行NFT应用 ====="
echo ""

# 清理项目
echo "1. 清理项目..."
flutter clean
flutter pub get

# 确保模拟器运行
echo "2. 启动iPhone 16 Pro模拟器..."
xcrun simctl boot "iPhone 16 Pro" || true
open -a Simulator

# 提示
echo "3. 模拟器配置..."
echo "在模拟器中，请前往:"
echo "设置 > Safari > 高级 > 网页检查器 > 打开"
echo "设置 > 隐私与安全性 > 本地网络 > 确保Flutter允许访问本地网络"
echo ""
echo "等待5秒钟..."
sleep 5

# 重新运行应用
echo "4. 在模拟器上运行应用..."
echo "运行过程中请注意观察终端输出的任何错误信息"
echo ""

# 设置环境变量，启用详细日志
export VERBOSE_SCRIPT_LOGGING=true
flutter run -d "iPhone 16 Pro" --verbose 