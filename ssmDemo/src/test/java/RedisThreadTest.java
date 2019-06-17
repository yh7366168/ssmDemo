import com.yh.util.JedisPoolUtil;
import lombok.extern.slf4j.Slf4j;
import redis.clients.jedis.Jedis;

import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;

/**
 * Redis多线程并发测试: fail
 * */
public class RedisThreadTest {

    public static void main(String[] args) {
        Runnable taskTemp = new Runnable() {
            private int icount;
            @Override
            public void run() {
                icount++;
                System.out.println("icount = " + icount);
//                Jedis jedis = JedisPoolUtil.getOnePoolJedis();
//                System.out.println( jedis.get("yh") );
//                JedisPoolUtil.jedisClose(jedis);
            }
        };
        RedisThreadTest rtt = new RedisThreadTest();
        rtt.startNThreadsByBarrier(10, taskTemp);
    }

    public void startNThreadsByBarrier(int threadNum, Runnable finishTask){
        CyclicBarrier barrier = new CyclicBarrier(threadNum, finishTask);
        for(int i=0; i<threadNum; i++){
            try{
                Thread.sleep(100);
            }catch (Exception e){
                e.printStackTrace();
            }
            new Thread(new CounterTask(barrier)).start();
        }
        System.out.println(Thread.currentThread().getName() + " out over...");
    }
}




class CounterTask implements Runnable{
    /**
     * CyclicBarrier详解：
     * */
    private CyclicBarrier barrier;

    public CounterTask(final CyclicBarrier barrier){
        this.barrier = barrier;
    }

    @Override
    public void run(){
        System.out.println(Thread.currentThread().getName() + " - " + System.currentTimeMillis() + "is ready!");
        try{
            barrier.await();
        }catch (InterruptedException e){
            e.printStackTrace();
        }catch (BrokenBarrierException e){
            e.printStackTrace();
        }
        System.out.println(Thread.currentThread().getName() + " - " + System.currentTimeMillis() + "is start!");
    }
}
