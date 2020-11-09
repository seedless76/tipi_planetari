package it.robertomento.tipi_planetari

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}
val crashButton = Button(this)
crashButton.text = "Crash!"
crashButton.setOnClickListener {
    throw RuntimeException("Test Crash") // Force a crash
}

addContentView(crashButton, ViewGroup.LayoutParams(
ViewGroup.LayoutParams.MATCH_PARENT,
ViewGroup.LayoutParams.WRAP_CONTENT))