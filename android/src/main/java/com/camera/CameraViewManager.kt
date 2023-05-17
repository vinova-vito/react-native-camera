package com.camera

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

@ReactModule(name = CameraViewManager.NAME)
class CameraViewManager :
  CameraViewManagerSpec<CameraView>() {
  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): CameraView {
    return CameraView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: CameraView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  companion object {
    const val NAME = "CameraView"
  }
}
