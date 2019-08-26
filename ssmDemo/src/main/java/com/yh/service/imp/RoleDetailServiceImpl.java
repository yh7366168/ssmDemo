package com.yh.service.imp;

import com.alibaba.fastjson.JSON;
import com.yh.dao.RoleDetailDao;
import com.yh.dao.RoleMenuDao;
import com.yh.pojo.RoleDetail;
import com.yh.pojo.RoleMenu;
import com.yh.pojo.vo.ButtonVO;
import com.yh.pojo.vo.RoleDetailVO;
import com.yh.pojo.vo.SecondMenuVO;
import com.yh.service.RoleDetailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author yh create on 2019/8/19
 */
@Slf4j
@Service("roleDetailService")
public class RoleDetailServiceImpl implements RoleDetailService {

    @Autowired
    private HttpSession session;
    @Autowired
    private RoleMenuDao roleMenuDao;
    @Autowired
    private RoleDetailDao roleDetailDao;

    /**
     * sys_role_detail 存角色详情页面显示的信息；sys_role_menu，存该角色的菜单和按钮信息；
     * （1）查询sys_role_detail，用于显示页面的组件信息。
     * （2）查询sys_role_menu，查询该角色权限按钮；存在就“选中”。
     */
    @Override
    public List<RoleDetailVO> spellRoleDetailVoList(Integer roleId) {
        //当前角色信息
        List<RoleMenu> roleMenuList = roleMenuDao.selectByRoleIdAndMeneId(roleId, null);
        List<RoleDetailVO> roleDetailVOList = new ArrayList<>();
        List<RoleDetail> roleDetailList = roleDetailDao.selectAll();
        //通过一级菜单分组
        Map<String, List<RoleDetail>> firstMenuMap = roleDetailList.stream().collect(Collectors.groupingBy(RoleDetail::getFirstMenuName));
        for (String firstKey : firstMenuMap.keySet()) {
            RoleDetailVO vo = new RoleDetailVO();
            List<SecondMenuVO> secondMenuVOList = new ArrayList<>();
            List<RoleDetail> firstList = firstMenuMap.get(firstKey);
            //通过二级菜单分组
            Map<String, List<RoleDetail>> secondMenuMap = firstList.stream().collect(Collectors.groupingBy(RoleDetail::getSceondMenuName));
            for (String sceondKey : secondMenuMap.keySet()) {
                SecondMenuVO secondMenuVO = new SecondMenuVO();
                List<ButtonVO> buttonVOList = new ArrayList<>();
                for (RoleDetail roleDetail : secondMenuMap.get(sceondKey)) {
                    ButtonVO buttonVO = new ButtonVO();
                    buttonVO.setButtonName(roleDetail.getButtonName());
                    buttonVO.setButtonAlias(roleDetail.getButtonAlias());
                    //确认当前角色的当前按钮是否“选中”
                    List<RoleMenu> curRoleMenuList = roleMenuList.stream().filter(x -> x.getMenuId().equals(roleDetail.getSceondMenuId())).collect(Collectors.toList());
                    A:for (RoleMenu roleMenu : curRoleMenuList) {
                        if (roleMenu.getButtonId().equals(roleDetail.getButtonId())) {
                            buttonVO.setIsChecked(true);
                            break A;
                        } else {
                            buttonVO.setIsChecked(false);
                        }
                    }
                    if(curRoleMenuList == null || curRoleMenuList.size()<1){
                        buttonVO.setIsChecked(false);
                    }
                    buttonVOList.add(buttonVO);
                }
                secondMenuVO.setSecondMenuName(sceondKey);
                secondMenuVO.setButtonList(buttonVOList);
                secondMenuVOList.add(secondMenuVO);
            }
            vo.setFirstMenuName(firstKey);
            vo.setSecondMenuList(secondMenuVOList);
            roleDetailVOList.add(vo);
        }
        log.info("spellRoleDetailVoList-入参roleId:{},结果:{}", roleId, JSON.toJSONString(roleDetailVOList));
        return roleDetailVOList;
    }
}
