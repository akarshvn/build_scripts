repo init -u https://github.com/LineageOS/android.git -b lineage-22.2 --git-lfs --no-clone-bundle
echo "\n---------------\nrepo initialised\n---------------\n"

/opt/crave/resync.sh
echo "\n---------------\nrepo synced successfully\n---------------\n"

source build/envsetup.sh
echo "\n---------------\nenvsetup.sh completed\n---------------\n"

breakfast sdk_phone_arm64
echo "\n---------------\nbreakfast completed\n---------------\n"

echo "\n---------------\nstart build\n---------------\n"
mka
echo "\n---------------\nbuild ended\n---------------\n"

echo "\n---------------\nexport for avd\n---------------\n"
mka emu_img_zip
echo "\n---------------\nexport done\n---------------\n"
