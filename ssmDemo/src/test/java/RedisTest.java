import com.yh.util.JedisPoolUtil;
import com.yh.util.RedisUtil;
import redis.clients.jedis.Jedis;

/**
 * Redis初识
 * */
public class RedisTest {

    public static void main(String[] args) {
        for(int i=0; i<10; i++){
            Runnable r = new Runnable() {
                @Override
                public void run() {
                    Jedis jedis = JedisPoolUtil.getOnePoolJedis();
                    String key = jedis.get("yh");
                    System.out.println(Thread.currentThread().getId() + ":" + key);
                    JedisPoolUtil.jedisClose(jedis);
                }
            };
            r.run();
        }
    }

    public static void testJedis(){
        Jedis jedis = RedisUtil.getJedis();
        Jedis jedisTwo = RedisUtil.getJedis();
        System.out.println( jedis.get("yh") );
    }

    public static void testJedisPool(){
        Jedis jedis = JedisPoolUtil.getOnePoolJedis();
        System.out.println( jedis.get("yh") );
        JedisPoolUtil.jedisClose(jedis);
    }

}