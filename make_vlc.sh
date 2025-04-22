#!/bin/sh

rm -rf build/ || true
rm *.xcframework
rm LICENSE

TAG_VERSION="3.6.0"
IOS_URL="https://download.videolan.org/pub/cocoapods/prod/MobileVLCKit-3.6.0-c73b779f-dd8bfdba.tar.xz"

mkdir build/

#Download and generate MobileVLCKit
wget -O build/MobileVLCKit.tar.xz $IOS_URL
tar -xf build/MobileVLCKit.tar.xz -C build/

IOS_LOCATION="build/MobileVLCKit-binary/MobileVLCKit.xcframework"

#Merge into one xcframework
xcodebuild -create-xcframework \
    -framework "$IOS_LOCATION/ios-arm64_i386_x86_64-simulator/MobileVLCKit.framework" \
    -debug-symbols "${PWD}/$IOS_LOCATION/ios-arm64_i386_x86_64-simulator/dSYMs/MobileVLCKit.framework.dSYM" \
    -framework "$IOS_LOCATION/ios-arm64_armv7_armv7s/MobileVLCKit.framework" \
    -debug-symbols "${PWD}/$IOS_LOCATION/ios-arm64_armv7_armv7s/dSYMs/MobileVLCKit.framework.dSYM" \
    -output build/MobileVLCKit.xcframework
    
ditto -c -k --sequesterRsrc --keepParent "build/MobileVLCKit.xcframework" "build/MobileVLCKit.xcframework.zip"

# cp -f build/MobileVLCKit-binary/COPYING.txt ./LICENSE
mv build/MobileVLCKit.xcframework Sources
rm -rf build/
zip -r MobileVLCKit.zip Sources/MobileVLCKit.xcframework/

echo "Done!"
