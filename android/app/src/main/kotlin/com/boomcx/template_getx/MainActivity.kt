package com.boomcx.template_getx


import android.content.Intent
import android.os.Bundle
import android.text.TextUtils
import android.util.Log
import com.mob.MobSDK
import com.mob.moblink.MobLink
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugins.GeneratedPluginRegistrant
import com.mob.OperationCallback;

class MainActivity: FlutterActivity() {

    private val METHOD_CHANNEL = "private.flutter.io/method_channel"
    private val METHOD_CHANNEL_SUBMIT_PRIVATE = "private.flutter.io/method_channel_submit_private"

    override  fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(
            getFlutterEngine()!!.dartExecutor.binaryMessenger,
            METHOD_CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getPrivateContent") {
                val para = call.arguments as Int
                val content = getPrivateContent(para)
                if (!TextUtils.isEmpty(content)) {
                    result.success(content)
                } else {
                    result.error("UNAVAILABLE", "not get private content", null)
                }
            } else {
                result.notImplemented()
            }
        }
        MethodChannel(
            getFlutterEngine()!!.dartExecutor.binaryMessenger,
            METHOD_CHANNEL_SUBMIT_PRIVATE
        ).setMethodCallHandler { call, result ->
            if (call.method == "submitPrivacyGrantResult") {
                val para = call.arguments as Boolean
                Log.e("WWW", " para==$para")
                submitPrivacyGrantResult(para, result)
            } else {
                result.notImplemented()
            }
        }
    }

    /**
     * 获取隐私协议的内容
     */
//    var text: String? = null
    private fun getPrivateContent(i: Int): String? {
//        MobSDK.getPrivacyPolicyAsync(i, new PrivacyPolicy.OnPolicyListener() {
//            @Override
//            public void onComplete(PrivacyPolicy data) {
//                if (data != null) {
//                    // 富文本内容
//                    text = data.getContent();
//                    Log.e("WWW", " 隐私协议内通==" + text);
//                }
//            }
//
//            @Override
//            public void onFailure(Throwable t) {
//                // 请求失败
//                //Log.e(TAG, "隐私协议查询结果：失败 " + t);
//            }
//        });
        return "获取隐私协议的内容"
    }

    /**
     * 同意隐私协议
     */
    private fun submitPrivacyGrantResult(granted: Boolean, result: Result) {

//        MobSDK.submitPolicyGrantResult(granted)

        MobSDK.submitPolicyGrantResult(granted, object : OperationCallback<Void>() {
            override fun onComplete(data: Void) {
                Log.e("WWW", "隐私协议授权结果提交：成功 $data")
                result.success("true")
            }

            override fun onFailure(t: Throwable) {
                Log.e("WWW", "隐私协议授权结果提交：失败: $t")
                result.error(t.message!!, "提交失败", "failed")
            }
        })
    }


    // 必须重写该方法，防止MobLink在某些情景下无法还原
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent);
        MobLink.updateNewIntent(getIntent(), this)
    }

}
