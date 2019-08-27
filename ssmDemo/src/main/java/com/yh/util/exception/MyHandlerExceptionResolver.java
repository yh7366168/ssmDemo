package com.yh.util.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author yh create on 2019/8/21 SpringMvc统一处理异常
 */
@Slf4j
public class MyHandlerExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex){
        ModelAndView model = new ModelAndView();
        log.info("myHandlerExceptionResolver-出现异常！");
        model.addObject("ex", ex);
        if(ex instanceof YhSimpleException){
            model.setViewName("error/simpleException");
        }else if (ex instanceof YhSystemException){
            model.setViewName("error/systemException");
        }else{
            model.setViewName("error/error");
        }
        return model;
    }
}
