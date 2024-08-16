package com.fff.aaa

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger

/** AaaPlugin */
class AaaPlugin : FlutterPlugin, AaaPluginApi.AaaApi {

    private lateinit var binaryMessagener:  io.flutter.plugin.common.BinaryMessenger

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        binaryMessagener = flutterPluginBinding.binaryMessenger
        AaaPluginApi.AaaApi.setUp(binaryMessagener, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        AaaPluginApi.AaaApi.setUp(binding.binaryMessenger, null)
    }

    override fun bbb(name: String, result: AaaPluginApi.Result<String>) {
        val pluginF: AaaPluginFlutter =  AaaPluginFlutter(binaryMessagener)
        pluginF.callFlutterMetod_ccc()
        result.success("bbb: $name")
    }

}

class Result : AaaPluginApi.VoidResult {
    override fun success() {
    }

    override fun error(error: Throwable) {
    }

}

private class AaaPluginFlutter {
    var pluginFlutter: AaaPluginApi.AaaFlutterApi? = null

    constructor(binding: BinaryMessenger) {
        pluginFlutter = AaaPluginApi.AaaFlutterApi(binding)
    }

    fun callFlutterMetod_ccc() {
        pluginFlutter!!.ccc(Result())
    }
}