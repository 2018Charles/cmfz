package com.baizhi.entity;

public class Result {
    private boolean bool;
    private String msg;

    public Result() {
    }

    public Result(boolean bool, String msg) {
        this.bool = bool;
        this.msg = msg;
    }

    public boolean isBool() {
        return bool;
    }

    public void setBool(boolean bool) {
        this.bool = bool;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "Result{" +
                "bool=" + bool +
                ", msg='" + msg + '\'' +
                '}';
    }
}
