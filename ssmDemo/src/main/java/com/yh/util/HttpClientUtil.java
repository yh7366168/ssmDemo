package com.yh.util;

import com.yh.util.exception.YhSimpleException;
import com.yh.util.exception.YhSystemException;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.util.Assert;

import java.io.IOException;
import java.util.Map;

/**
 * @author yh create on 2019/6/28
 */
@Slf4j
public class HttpClientUtil {

    public static void main(String[] args) {
        //创建客户端
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        //常见httpGet请求
        HttpGet httpGet = new HttpGet("http://localhost:8080/ssmDemo/user/testHttpGet");
        CloseableHttpResponse response = null;
        try{
            //发送请求
            response = httpClient.execute(httpGet);
            //解析响应结果
            log.info("响应码：" + response.getStatusLine().getStatusCode());
            HttpEntity entity = response.getEntity();
            if(entity != null){
                log.info("响应体大小：" + entity.getContentLength());
                log.info("响应体:" + EntityUtils.toString(entity));
            }else{
                log.info("响应体为空！");
            }
        }catch (ClientProtocolException e){
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }finally {
            try{
                if(response != null){
                    response.close();
                }
                if(httpClient != null){
                    httpClient.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    /**
     *  发送带参数的httpClient请求
     * @param url
     * @param params 参数
     * */
    public static void get(String url, Map<String, Object> params) throws Exception{
        Assert.notNull(url, "URL不能为空！");
        Assert.notNull(params, "请求参数为空！");

        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        StringBuffer stringBuffer = new StringBuffer(url);
        stringBuffer.append("?");
        for(String key : params.keySet()){
            String value = (String)params.get(key);
            if(value.contains("&")){
                throw new YhSimpleException("参数含有特殊字符&");
            }
            if(value.contains("?")){
                throw new YhSimpleException("参数含有特殊字符?");
            }
            stringBuffer.append(key).append("=").append(value)
                    .append("&");
        }
        url = new String(stringBuffer.toString().getBytes(), "UTF-8");
        CloseableHttpResponse response = null;
        try{
            HttpGet httpGet = new HttpGet(url);
            //设置Http参数
            RequestConfig config = RequestConfig.custom()
                    //设置连接超时时间
                    .setConnectTimeout(6000)
                    //设置请求超时时间
                    .setConnectionRequestTimeout(6000)
                    //设置读写超时时间
                    .setSocketTimeout(6000)
                    //设置是否可以重定向
                    .setRedirectsEnabled(true)
                    .build();
            httpGet.setConfig(config);
            log.info("httpClient-get-开始执行！");
            long beginTime = System.currentTimeMillis();
            response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();
            int code = response.getStatusLine().getStatusCode();
            if(code == 200){
                log.info("httpClient-get--执行成功, 耗时{}ms，响应结果；{}", System.currentTimeMillis()-beginTime, EntityUtils.toString(entity));
            }else {
                log.info("httpClient-get--执行失败，返回响应码：{}, 响应结果{}", code, EntityUtils.toString(entity));
                return;
            }
        }catch ( Exception e ){
            log.error("httpClient-系统异常：{}", e);
            throw new YhSystemException("系统异常");
        }finally {
            try{
                if(response != null){
                    response.close();
                }
                if(httpClient != null){
                    httpClient.close();
                }
            }catch (Exception e){
                log.error("httpClient-释放资源失败：{}", e);
                throw new YhSystemException("释放资源失败");
            }
        }
    }
}
