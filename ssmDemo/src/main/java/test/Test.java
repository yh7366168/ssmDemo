package test;

import com.yh.util.exception.YhSimpleException;

import java.util.concurrent.*;

public class Test {

    public static void main(String[] args) {
        try{
            throw new YhSimpleException("ces1");
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
}
