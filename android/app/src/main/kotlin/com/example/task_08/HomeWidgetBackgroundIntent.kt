import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import android.net.Uri

object HomeWidgetBackgroundIntent {
    fun getBroadcast(context: Context, uri: Uri): PendingIntent {
        val intent = Intent(context, HomeScreenWidgetProvider::class.java)
        intent.action = AppWidgetManager.ACTION_APPWIDGET_UPDATE
        intent.data = uri
        return PendingIntent.getBroadcast(context, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT)
    }
}
