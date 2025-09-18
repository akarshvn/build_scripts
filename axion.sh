rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86
rm -rf packages/apps/Updater/

git clone -b axion https://github.com/akarshvn/local_manifests .repo/local_manifests

echo "----------------------------------"
echo Local Manifest Cloning Successful
echo "----------------------------------"

repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.0 --git-lfs

/opt/crave/resync.sh

echo "----------------"
echo Sync Successful
echo "----------------"

rm -rf packages/apps/Updater/
git clone -b lineage-23.0 https://github.com/akarshvn/android_packages_apps_Updater.git packages/apps/Updater/

source build/envsetup.sh

echo "----------------"
echo envsetup.sh done
echo "----------------"

echo "----------------"
echo Starting Build
echo "----------------"

axion dubai gms core
ax -br
