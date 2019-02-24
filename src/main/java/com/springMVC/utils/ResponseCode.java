package com.springMVC.utils;

public enum ResponseCode {
    SUCCESS(100, "SUCCESS"),
    FAIL(101, "FAILED"),
    TIMEOUT(102, "TOKEN OUT OF TIME");


    private int code;
    private String msg;

    ResponseCode(int code, String msg){
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
