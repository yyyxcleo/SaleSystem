package com.ruoyi.system.domain;


import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

@Data
public class Query {
    private String omCustomer;
    private Integer omId;
    private Integer  pageNum;
    private  Integer pageSize;
}
