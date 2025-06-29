#!/bin/bash

echo "===== 准备在iOS真机上部署NFT应用 ====="
echo "确保您已经连接iPhone设备到Mac电脑上"
echo "确保您已经安装了最新版本的Xcode"
echo ""

# 确保Flutter配置正常
echo "1. 配置Flutter环境..."
flutter pub get

# 确保Flutter iOS设置正确
echo "2. 设置iOS环境..."
flutter precache --ios
flutter devices

# 运行flutter build以生成必要的文件
echo "3. 构建iOS配置文件..."
flutter build ios --debug --no-codesign

# 安装Pod依赖
echo "4. 安装iOS依赖..."
cd ios
pod install
cd ..

# 打开Xcode项目
echo "5. 正在打开Xcode项目..."
echo "在Xcode中，请执行以下操作："
echo "  a. 点击左侧导航栏中的'Runner'项目"
echo "  b. 在'Signing & Capabilities'标签下，勾选'Automatically manage signing'"
echo "  c. 选择您的开发者账号"
echo "  d. 可能需要修改Bundle Identifier为唯一值，例如：com.yourname.nft"
echo "  e. 在顶部设备选择器中选择您连接的iPhone设备"
echo "  f. 点击运行按钮（三角形）部署到设备"
echo ""
echo "注意：首次在设备上运行时，iOS可能需要您信任开发者证书。"
echo "在iPhone上，请前往：设置 > 通用 > 设备管理/VPN与设备管理，找到您的开发者证书并信任它。"
echo ""
echo "若遇到'无法验证APP，未能取得该开发人员的信任评分'报错，请前往设置 > 通用 > 设备管理，点击开发者名称进行信任。"
echo ""

open ios/Runner.xcworkspace 