package test.qa.youse.com.qatest.Utils;

import android.content.Context;
import android.support.test.InstrumentationRegistry;

/**
 * Created by julia on 06/02/17.
 */
public class Helpers {
    public static String getResourceString(int id) {
        Context targetContext = InstrumentationRegistry.getTargetContext();
        return targetContext.getResources().getString(id);
    }
}
