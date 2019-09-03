package test;

import com.yh.util.exception.YhSimpleException;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.*;

public class Test {

    public static void main(String[] args) {
        String str = "10000-10001-1;10000-10001-2;10000-10002-1;10000-10002-2;10000-10003-1;10000-10003-3;";
        String[] strArr = str.split(";");
        for(int i=0; i<strArr.length; i++){
            System.out.println(i+" : "+ strArr[i]);
        }
    }

}
