rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86
rm -rf packages/apps/Updater/

rm -rf device/motorola/dubai
rm -rf device/motorola/sm7325-common
rm -rf kernel/motorola/sm7325
rm -rf vendor/motorola/dubai
rm -rf vendor/motorola/sm7325-common
rm -rf hardware/motorola

repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.0 --git-lfs

/opt/crave/resync.sh

echo "----------------"
echo Sync Successful
echo "----------------"

rm -rf packages/apps/Updater/
git clone -b lineage-23.0 https://github.com/akarshvn/android_packages_apps_Updater.git packages/apps/Updater/

# mkdir -p out/target/product/dubai/obj/KERNEL_OBJ/usr
# echo "---------------"
# echo "created folder: out/target/product/dubai/obj/KERNEL_OBJ/usr"
# echo "---------------"

# rm -rf out/target/product/emu64a/obj/PACKAGING/superimage_debug_intermediates

source build/envsetup.sh

echo "----------------"
echo envsetup.sh done
echo "----------------"

echo "----------------"
echo Starting Build
echo "----------------"

breakfast sdk_phone_arm64
mka
mka emu_img_zip
