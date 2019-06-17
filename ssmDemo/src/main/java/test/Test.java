package test;

import java.util.concurrent.*;

public class Test {

    public static void main(String[] args) {
        ExecutorService pool = Executors.newFixedThreadPool(5);
        for(int i=0; i<12; i++){
            pool.execute(new Runnable() {
                Integer sleepTime = 0;
                @Override
                public void run() {
                    try{
                        sleepTime = (int)(Math.random()*1000);
                        Thread.sleep(sleepTime);
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                    System.out.println( Thread.currentThread().getName() + " - " + System.currentTimeMillis() + " 执行了" + sleepTime);
                }
            });
        }
    }
}
