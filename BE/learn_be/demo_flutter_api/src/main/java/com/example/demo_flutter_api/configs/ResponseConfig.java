package com.example.demo_flutter_api.configs;

import com.example.demo_flutter_api.configs.consts.StatusCode;

public class ResponseConfig<T> {
    private String errorCode;
    private String errorMessage;
    private T data;

    public ResponseConfig() {
    }

    public ResponseConfig(String errorCode, String errorMessage, T data) {
        this.errorCode = errorCode;
        this.errorMessage = errorMessage;
        this.data = data;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(StatusCode.Status status) {this.errorCode = status.name();}
    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }


}
