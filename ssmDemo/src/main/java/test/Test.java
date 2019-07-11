package test;

import com.yh.util.exception.YhSimpleException;

import java.time.LocalDateTime;
import java.util.concurrent.*;

public class Test {

    public static void main(String[] args) {
        String dateTime = LocalDateTime.now().toString();
        System.out.println( dateTime);
    }
}
