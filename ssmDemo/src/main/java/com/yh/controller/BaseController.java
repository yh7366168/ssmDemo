package com.yh.controller;

import com.yh.util.exception.YhSimpleException;
import com.yh.util.exception.YhSystemException;
import org.apache.http.HttpRequest;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;

/**
 * @author yh create on 2019/8/21
 */
public abstract class BaseController {

    @ExceptionHandler
    public String exp(HttpServletRequest request, Exception ex){
        request.setAttribute("ex", ex);
        if(ex instanceof YhSimpleException){
            return "error/simpleException";
        }else if(ex instanceof YhSystemException){
            return "error/systemException";
        }else{
            return "error/error";
        }
    }
}
