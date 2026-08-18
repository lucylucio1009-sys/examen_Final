package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

    public class TestRunner {
        @Test
        void test(){
            Results results = Runner.path("classpath:features")
                .outputCucumberJson(true)
                .parallel(2);

            assertEquals(0,results.getFailCount(),results.getErrorMessages());

    }
}
