package com.ruoyi.system.domain;

import com.fasterxml.jackson.databind.ser.Serializers;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;


@Data
public class SysOrderDd extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private Integer odId;
    private String prName;
    private Integer prNum;
    private Double prUnitPrice;
    private Integer omId;
}
