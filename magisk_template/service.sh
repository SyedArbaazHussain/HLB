#!/system/bin/sh
until [ $(getprop sys.boot_completed) -eq 1 ]; do
  sleep 5
done
cmd package set-home-activity com.miui.home/.MainActivity
am force-stop com.android.systemui
