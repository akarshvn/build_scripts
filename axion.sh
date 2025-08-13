rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86
rm -rf packages/apps/Updater/

repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.0 --git-lfs

/opt/crave/resync.sh

echo "----------------"
echo Sync Successful
echo "----------------"

rm -rf packages/apps/Updater/
git clone -b lineage-22.2 https://github.com/akarshvn/android_packages_apps_Updater.git packages/apps/Updater/

mkdir -p out/target/product/dubai/obj/KERNEL_OBJ/usr
echo "---------------"
echo "created folder: out/target/product/dubai/obj/KERNEL_OBJ/usr"
echo "---------------"

rm -rf out/target/product/emu64a/obj/PACKAGING/superimage_debug_intermediates

source build/envsetup.sh

echo "----------------"
echo envsetup.sh done
echo "----------------"

echo "----------------"
echo Starting Build
echo "----------------"

breakfast sdk_phone_arm64 eng
mka emu_img_zip
