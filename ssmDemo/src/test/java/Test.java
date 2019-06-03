import com.alibaba.fastjson.JSON;
import com.yh.pojo.Menu;
import com.yh.pojo.User;
import com.yh.service.MenuService;
import com.yh.service.UserService;
import com.yh.util.PageUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Slf4j

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:spring-*.xml"})
public class Test {

    @Autowired
    private MenuService menuService;

    @Autowired
    private UserService userService;

    /**
     * 测试获取UUID
     * */
    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-","");
    }

    /**
     * 测试查询菜单列表
     * */
    @org.junit.Test
    public void testQueryMenuList(){
        User user = userService.queryByName("yh");
        log.info("");
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("menuLevel","1");
        List<Menu> menuList = menuService.queryListByParams(params);
        for(Menu menu : menuList){
            log.info("name-> {}" , menu.getMenuName());
        }
        log.info("menuList:{}", JSON.toJSONString(menuList));
    }

//    @org.junit.Test
//    public void testPageUtil(){
//        PageUtil<Menu> pageUtil = new PageUtil<>();
//        Menu menu = new Menu();
//        pageUtil.queryPageList(menu, 1);
//    }

    public static void main(String[] args) {

    }
}
