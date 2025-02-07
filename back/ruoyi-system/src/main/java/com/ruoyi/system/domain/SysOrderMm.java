package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;


@Data
public class SysOrderMm extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private Integer omId;
    private String omCustomer;
    private Date createTime;
    private Integer status;
    private Double omTotalPrice;
}
