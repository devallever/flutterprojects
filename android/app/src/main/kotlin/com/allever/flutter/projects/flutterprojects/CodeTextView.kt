package com.allever.flutter.projects.flutterprojects

import android.content.Context
import android.view.View
import android.widget.TextView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformPlugin
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class CodeTextView(val context: Context) : PlatformView {
    override fun getView(): View {
        val textView = TextView(context)
        textView.text = "Android TextView"
        return textView
    }

    override fun dispose() {
    }
}

class CodeTextViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return CodeTextView(context)
    }
}

class CodeTextViewPlugin : FlutterPlugin {
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        binding
            .platformViewRegistry
            .registerViewFactory("viewTypeCodeTextView", CodeTextViewFactory())
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    }

}