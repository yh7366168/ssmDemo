import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class Test {

    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-","");
    }

    public static void main(String[] args) {
        String sysDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        System.out.println(sysDate.length());
    }
}
