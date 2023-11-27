import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import android.widget.RemoteViews
import com.example.task_08.MainActivity
import com.example.task_08.R

class HomeScreenWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray, widgetData: SharedPreferences) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.widget_layout).apply {

                // Open App on Widget Click
                val pendingIntent = HomeWidgetLaunchIntent.getActivity(context,
                        MainActivity::class.java)
                setOnClickPendingIntent(R.id.widget_root, pendingIntent)

                val counter = widgetData.getInt("_counter", 0)
                val name = widgetData.getString("name", "name")
                val mail = widgetData.getString("mail", "mail")

                var counterText = "Your counter value is: $counter"
                setTextViewText(R.id.user_name, name)
                setTextViewText(R.id.user_name, name)



                if (counter == 0) {
                    counterText = "You have not pressed the counter button"
                }

//                setTextViewText(R.id.tv_counter, counterText)
                val backgroundIntent = HomeWidgetBackgroundIntent.getBroadcast(context, Uri.parse("myAppWidget://updatecounter"))
                setOnClickPendingIntent(R.id.bt_update, backgroundIntent)

                // Pending intent to update counter on button click
//                val backgroundIntent = HomeWidgetBackgroundIntent.kt.getBroadcast(context,
//                        Uri.parse("myAppWidget://updatecounter"))
//                setOnClickPendingIntent(R.id.bt_update, backgroundIntent)
            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}