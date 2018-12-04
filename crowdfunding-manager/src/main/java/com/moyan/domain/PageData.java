package com.moyan.domain;

import lombok.Data;

import java.util.List;

/**
 * 用户 ：莫言<br>
 * 类名 ：PageData<br>
 * 包名 ：com.moyan.domain<br>
 * 工程名 ：crowdfunding<br>
 * 日期 ：2018年12月04日 时间 17:29<br>
 * <p>
 * 分页显示设置
 *
 * @param <T> the type parameter
 * @author 莫言
 */
@Data
public class PageData<T> {

    /**
     * 分页总数.
     */
    private long total;
    /**
     * 页面显示行数.
     */
    private List<T> rows;
}
