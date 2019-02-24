package com.springMVC.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CommonUtils {

    public static boolean isEmpty(String str) {
        if (null != str && !"".equals(str.trim())) {
            return false;
        }
        return true;
    }

    public static String MD5crypt(String str) {
        StringBuffer hexString = new StringBuffer();
        try{
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(str.getBytes());
            byte[] hash = messageDigest.digest();
            for (int i : hash) {
                if ((0xff & i) < 0x10) {
                    hexString.append("0" + Integer.toHexString((0xff & i)));
                }else {
                    hexString.append(Integer.toHexString(0xff & i));
                }
            }
        }catch (NoSuchAlgorithmException e) {
            //TODO 打印日志
        }
        return hexString.toString();
    }

    public static void main(String[] args) {
        //System.out.print(isEmpty("asd"));
        System.out.print(MD5crypt("0912"));
        System.out.print(MD5crypt("0911"));
    }
}
