package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Order;
import com.ruoyi.system.domain.SysOrderMm;

import java.util.List;


public interface SysOrderMmMapper {

    public List<SysOrderMm> selectOrderMmList(SysOrderMm sysOrderMm);


    public SysOrderMm selectOrderMmById(Long omId);


    public int deleteOrderMmByIds(Long[] omIds);


    public int updateOrderMm(SysOrderMm sysOrderMm);


    public int insertOrderMm(SysOrderMm sysOrderMm);

}
