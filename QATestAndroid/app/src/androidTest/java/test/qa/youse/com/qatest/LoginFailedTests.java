package test.qa.youse.com.qatest;

import android.support.test.rule.ActivityTestRule;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;

import br.com.youse.qa.test.views.login.LoginActivity;
import test.qa.youse.com.qatest.Utils.Helpers;
import test.qa.youse.com.qatest.Utils.TestConstants;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.clearText;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.typeText;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.containsString;

/**
 * Created by julia on 06/02/17.
 */
public class LoginFailedTests {
    @Rule
    public ActivityTestRule<LoginActivity> activityRule = new ActivityTestRule<>(LoginActivity.class);

    @Before
    public void setUp() {
        activityRule.getActivity();
    }

    @Test
    public void wrongEmail() {
        String[] emailValue = {"acasinha@aol.com", "3458302", "youser2youse.com.br", ""};

        for (String email : emailValue) {
            onView(withId(R.id.email))
                    .perform(typeText(email));
            onView(withId(R.id.nextBtn))
                .perform(click());
            onView(withText(R.string.email_error_msg))
                    .check(matches(isDisplayed()));
            onView(withId(R.id.email))
                    .perform(clearText());
        }
    }
}
