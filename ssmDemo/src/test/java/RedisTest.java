import com.yh.util.RedisUtil;
import redis.clients.jedis.Jedis;

/**
 * Redis初识
 * */
public class RedisTest {

    public static void main(String[] args) {
        Jedis jedis = RedisUtil.getJedis();
        Jedis jedisTwo = RedisUtil.getJedis();
        System.out.println( jedis.get("yh") );
    }
}
