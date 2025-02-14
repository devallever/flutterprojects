package com.allever.flutter.projects.flutterprojects

import androidx.lifecycle.lifecycleScope
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class MainActivity : FlutterActivity() {
    private val CHANNEL_APP = "platformChannel/app"
    private val CHANNEL_CALL_FLUTTER_FROM_ANDROID = "CHANNEL_CALL_FLUTTER_FROM_ANDROID"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.plugins.add(CodeTextViewPlugin())
        flutterEngine.plugins.add(LayoutTextViewPlugin())
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_APP
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "getVersionName" -> {
                    result.success("v1.0.0")
                }
                "startCallFromAndroid" -> {
                    lifecycleScope.launch {
                        var progress = 0
                        while (progress <= 100) {
                            callFlutterMethod(flutterEngine, "onProgress", progress)
                            delay(200)
                            progress++
                        }
                    }
                }
            }
        }

    }

    private fun callFlutterMethod(
        flutterEngine: FlutterEngine,
        methodName: String,
        argument: Any? = null,
        cb: ((any: Any?) -> Unit)? = null
    ) {
        lifecycleScope.launch {
            MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                CHANNEL_CALL_FLUTTER_FROM_ANDROID
            ).invokeMethod(methodName,
                argument,
                object : MethodChannel.Result {
                    override fun success(result: Any?) {
                        cb?.invoke(result)
                    }

                    override fun error(
                        errorCode: String, errorMessage: String?, errorDetails: Any?
                    ) {
//                        logger("Android调用Flutter方法: ${methodName}失败，错误：$errorMessage")
//                        toast("Android调用Flutter方法失败，错误：$errorMessage")
                    }

                    override fun notImplemented() {
//                        logger("Android调用Flutter方法未实现: $methodName")
                    }
                })
        }


    }
}
