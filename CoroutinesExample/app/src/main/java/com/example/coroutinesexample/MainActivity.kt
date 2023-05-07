package com.example.coroutinesexample

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import kotlinx.coroutines.*
import kotlinx.coroutines.Dispatchers.IO
import kotlinx.coroutines.Dispatchers.Main

class MainActivity : AppCompatActivity() {
    private val RESULT_1 ="Result #1"
    private val RESULT_2 ="Result #2"
    private val JOB_TIMEOUT = 2200L
    lateinit var  text : TextView
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        text = findViewById<TextView>(R.id.text)
        findViewById<Button>(R.id.button).setOnClickListener {
            setNewText("Click...")
//IO,main,default
            CoroutineScope(IO).launch {
                fakeApiRequest()
            }
        }
    }
    private fun setNewText(input :String){
        val newText = text.text.toString() + "\n$input"
        text.text = newText
    }

    private suspend fun setTextOnMainThread(input: String){
        withContext(Main){
            setNewText(input)
        }
    }

    private suspend fun fakeApiRequest(){
        withContext(IO){
            val job = withTimeoutOrNull(JOB_TIMEOUT) {
                val result1 = getResult1Api()
                println("debug: result #1: $result1")
                setTextOnMainThread("Got $result1")

                val result2 = getResult2Api()
                setTextOnMainThread("Got $result2")

            }
            if (job == null){
                val cancelMessage =  "Cancelling job.... Job took longer than  $JOB_TIMEOUT ms"
                println("debug : $cancelMessage")
                setTextOnMainThread(cancelMessage)
            }
        }



    }

    private suspend fun getResult1Api() : String{
        logThread("getResult1Api")
        delay(1000)
       // Thread.sleep(1000)
        return RESULT_1
    }
    private suspend fun getResult2Api() : String{
        logThread("getResult2Api")
        delay(2000)
        return RESULT_2
    }
    private fun logThread(methodName : String){
        println("debug : ${methodName} : ${Thread.currentThread().name}")
    }
}