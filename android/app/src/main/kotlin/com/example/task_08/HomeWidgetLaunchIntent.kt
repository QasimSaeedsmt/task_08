import android.app.PendingIntent
import android.content.Context
import android.content.Intent

object HomeWidgetLaunchIntent {
    fun getActivity(context: Context, targetActivity: Class<*>): PendingIntent {
        val intent = Intent(context, targetActivity)
        return PendingIntent.getActivity(context, 0, intent, 0)
    }
}
