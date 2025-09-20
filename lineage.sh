rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/LineageOS/android.git -b lineage-22.2 --git-lfs --no-clone-bundle
echo -e "\n---------------\nrepo initialised\n---------------\n"

/opt/crave/resync.sh
echo -e "\n---------------\nrepo synced successfully\n---------------\n"

source build/envsetup.sh
echo -e "\n---------------\nenvsetup.sh completed\n---------------\n"

breakfast sdk_phone_arm64
echo -e "\n---------------\nbreakfast completed\n---------------\n"

echo -e "\n---------------\nstart build\n---------------\n"
mka
echo -e "\n---------------\nbuild ended\n---------------\n"

echo -e "\n---------------\nexport for avd\n---------------\n"
mka emu_img_zip
echo -e "\n---------------\nexport done\n---------------\n"
