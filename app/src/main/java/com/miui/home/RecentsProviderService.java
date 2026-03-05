package com.miui.home;
import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

public class RecentsProviderService extends Service {
    @Override
    public IBinder onBind(Intent intent) { return null; }
}
