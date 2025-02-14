package com.allever.flutter.projects.flutterprojects

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class LayoutTextView(private val context: Context) : PlatformView {
    override fun getView(): View {
        val textView = LayoutInflater.from(context).inflate(R.layout.layout_text_view, null)
        return textView
    }

    override fun dispose() {
    }
}

class LayoutTextViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return LayoutTextView(context)
    }
}

class LayoutTextViewPlugin : FlutterPlugin {
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        binding
            .platformViewRegistry
            .registerViewFactory("viewTypeLayoutTextView", LayoutTextViewFactory())
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    }

}