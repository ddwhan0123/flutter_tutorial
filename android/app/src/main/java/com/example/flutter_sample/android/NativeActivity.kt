package com.example.flutter_sample.android

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.widget.TextView

import com.example.flutter_sample.R
import com.example.flutter_sample.route.PageRouter

class NativeActivity : AppCompatActivity(), View.OnClickListener {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_native)
        val openNativePage = findViewById<TextView>(R.id.openNativePage)
        val openFlutterPage = findViewById<TextView>(R.id.openFlutterPage)
        val closePage = findViewById<TextView>(R.id.closePage)
        openFlutterPage.setOnClickListener(this)
        openNativePage.setOnClickListener(this)
        closePage.setOnClickListener(this)
    }


    override fun onClick(view: View) {
        when (view.id) {
            R.id.openNativePage ->
                //直接intent强跳
                this.startActivity(Intent(this, NativeSonActivity::class.java))
            R.id.openFlutterPage -> PageRouter.openPageByUrl(this, PageRouter.FLUTTER_HOME_PAGE_URL)
            R.id.closePage -> this.finish()
        }
    }
}
