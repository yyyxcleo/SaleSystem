package com.ruoyi.system.service;


import com.ruoyi.system.domain.Order;
import com.ruoyi.system.domain.Query;
import com.ruoyi.system.domain.SysOrderDd;
import com.ruoyi.system.domain.SysOrderMm;

import java.util.List;
import java.util.Queue;

public interface ISysOrderMmService {


    public List<SysOrderMm> selectOrderMmList(SysOrderMm sysOrderMm);

    public SysOrderMm selectOrderMmById(Long omId);

    public int deleteOrderMmByIds(Long[] omIds);

    public int insertOrderMm(SysOrderMm sysOrderMm);

    public int updateOrderMm(SysOrderMm sysOrderMm);
}
