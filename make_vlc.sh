#!/bin/sh

rm -rf build/ || true
rm -rf *.xcframework/ || true
rm LICENSE || true

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
    -framework "$IOS_LOCATION/ios-arm64_armv7_armv7s/MobileVLCKit.framework" \
    -output build/MobileVLCKit.xcframework
    
mv build/MobileVLCKit.xcframework Sources
rm -rf build/
zip -r MobileVLCKit.zip Sources/MobileVLCKit.xcframework/

echo "Done!"
