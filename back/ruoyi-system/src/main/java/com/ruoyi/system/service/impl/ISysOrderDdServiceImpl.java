package com.ruoyi.system.service.impl;


import com.ruoyi.system.domain.SysOrderDd;
import com.ruoyi.system.domain.SysOrderDd;
import com.ruoyi.system.mapper.SysOrderDdMapper;
import com.ruoyi.system.mapper.SysOrderDdMapper;
import com.ruoyi.system.service.ISysOrderDdService;
import com.ruoyi.system.service.ISysOrderDdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ISysOrderDdServiceImpl implements ISysOrderDdService {


    @Autowired
    private SysOrderDdMapper sysOrderDdMapper;

    @Override
    public List<SysOrderDd> selectOrderDdList(SysOrderDd sysOrderDd) {
        return sysOrderDdMapper.selectOrderDdList(sysOrderDd);
    }


    @Override
    public int deleteOrderDdByIds(Long[] odIds) {
        return sysOrderDdMapper.deleteOrderDdByIds(odIds);
    }

    @Override
    public int insertOrderDd(SysOrderDd sysOrderDd) {
        return sysOrderDdMapper.insertOrderDd(sysOrderDd);
    }


    @Override
    public int updateOrderDd(SysOrderDd sysOrderDd) {
        return sysOrderDdMapper.updateOrderDd(sysOrderDd);
    }
}
