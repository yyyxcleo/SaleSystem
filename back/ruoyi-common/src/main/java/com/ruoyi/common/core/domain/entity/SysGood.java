package com.ruoyi.common.core.domain.entity;

import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.xss.Xss;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

/**
 * 用户对象 sys_user
 *
 * @author ruoyi
 */

@Data
public class SysGood extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private Long prId;

    private Long deptId;

    private String prName;

    private Double prPrice;

    private Double oriPrice;

    private Integer prNum;

    private Integer status;

}
