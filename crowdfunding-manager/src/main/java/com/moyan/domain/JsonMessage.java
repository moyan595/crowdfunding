package com.moyan.domain;

import lombok.Data;

/**
 * 用户 ：莫言<br>
 * 类名 ：JsonMessage<br>
 * 包名 ：com.moyan.domain<br>
 * 工程名 ：crowdfunding<br>
 * 日期 ：2018年12月04日 时间 17:27<br>
 *
 * 返json数据对象
 * @author 莫言
 */
@Data
public class JsonMessage {
    /**
     * 返回成功提示.
     */
    private boolean success;
    /**
     * 内容.
     */
    private String content;
    /**
     * Obj.
     */
    private Object obj;
}
