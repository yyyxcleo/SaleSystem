package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysOrderDd;
import com.ruoyi.system.domain.SysOrderDd;

import java.util.List;

public interface ISysOrderDdService {
    
    public List<SysOrderDd> selectOrderDdList(SysOrderDd sysOrderDd);

    public int deleteOrderDdByIds(Long[] odIds);

    public int insertOrderDd(SysOrderDd sysOrderDd);

    public int updateOrderDd(SysOrderDd sysOrderDd);
}
