package com.springMVC.utils;

import com.auth0.jwt.JWTSigner;
import com.auth0.jwt.JWTVerifier;
import org.codehaus.jackson.map.ObjectMapper;

import java.util.HashMap;
import java.util.Map;

public class TokenUtils {
    private static final String SECRET = "XX#$%()(#*!()!KL<><MQLMNQNQJQK sdfkjsdrow32234545fdf>?N<:{LWPW";

    private static final String EXP = "exp";

    private static final String PAYLOAD = "payload";

    /**
     * 加密生成Token
     * @param object
     * @param maxAge
     * @param <T>
     * @return
     */
    public static <T> String sign(T object, long maxAge){
        try{
            final JWTSigner signer = new JWTSigner(SECRET);
            final Map<String, Object> claims = new HashMap<String, Object>();
            ObjectMapper mapper = new ObjectMapper();
            String jsonString = mapper.writeValueAsString(object);
            claims.put(PAYLOAD, jsonString);
            claims.put(EXP, System.currentTimeMillis() + maxAge);
            return signer.sign(claims);
        }catch (Exception e){
            //TODO 添加日志打印
            return null;
        }
    }

    public static <T> T unsign(String token, Class<T> classT){
        final JWTVerifier verifier = new JWTVerifier(SECRET);
        try{
            final Map<String, Object> claims = verifier.verify(token);
            if (claims.containsKey(EXP) && claims.containsKey(PAYLOAD)){
                long exp = (Long)claims.get(EXP);
                long currentTimeMillis = System.currentTimeMillis();
                if (exp > currentTimeMillis){
                    String json = (String)claims.get(PAYLOAD);
                    ObjectMapper objectMapper = new ObjectMapper();
                    return objectMapper.readValue(json, classT);
                    //TODO 添加错误码信息
                }
            }
            return null;
        }catch (Exception e){
            //TODO 添加日志打印
            return null;
        }
    }
}
