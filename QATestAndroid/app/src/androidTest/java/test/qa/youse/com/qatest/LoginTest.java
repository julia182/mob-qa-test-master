package test.qa.youse.com.qatest;

import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import br.com.youse.qa.test.views.login.LoginActivity;
import br.com.youse.qa.test.views.main.MainActivity;
import test.qa.youse.com.qatest.Utils.ActivityHelpers;
import test.qa.youse.com.qatest.Utils.TestConstants;
import test.qa.youse.com.qatest.Utils.Helpers;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.typeText;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.assertThat;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.instanceOf;

//@RunWith(AndroidJUnit4.class)
public class LoginTest {

    @Rule
    public ActivityTestRule<LoginActivity> activityRule = new ActivityTestRule<>(LoginActivity.class);

    @Before
    public void setUp() {
        activityRule.getActivity();
        onView(withId(R.id.email))
                .perform(typeText(TestConstants.User.ACCOUNT_EMAIL));
        onView(withId(R.id.nextBtn))
                .perform(click());
        onView(withId(R.id.password))
                .perform(typeText(TestConstants.User.ACCOUNT_PASSWORD));
        onView(withId(R.id.loginBtn))
                .perform(click());
    }

    @Test
    public void performSuccessfullyLogin() {
        assertThat(ActivityHelpers.getActivityInstance(), instanceOf(MainActivity.class));
    }

    @Test
    public void hasWelcomeMessage() {
        onView(withId(R.id.welcome))
                .check(matches(withText(containsString(Helpers.getResourceString(R.string.welcome_msg)))));
    }

    @Test
    public void hasUserEmail() {
        onView(withId(R.id.welcome))
                .check(matches(withText(containsString(TestConstants.User.ACCOUNT_EMAIL))));
    }
}