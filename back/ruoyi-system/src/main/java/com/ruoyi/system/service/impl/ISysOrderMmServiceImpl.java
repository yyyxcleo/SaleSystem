package com.ruoyi.system.service.impl;


import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.Order;
import com.ruoyi.system.domain.Query;
import com.ruoyi.system.domain.SysOrderMm;
import com.ruoyi.system.mapper.OrderMapper;
import com.ruoyi.system.mapper.SysOrderMmMapper;
import com.ruoyi.system.mapper.SysUserPostMapper;
import com.ruoyi.system.service.ISysOrderMmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ISysOrderMmServiceImpl implements ISysOrderMmService {


    @Autowired
    private SysOrderMmMapper sysOrderMmMapper;

    @Override
    public List<SysOrderMm> selectOrderMmList(SysOrderMm sysOrderMm) {
        return sysOrderMmMapper.selectOrderMmList(sysOrderMm);
    }


    @Override
    public SysOrderMm selectOrderMmById(Long omId) {
        return sysOrderMmMapper.selectOrderMmById(omId);
    }


    @Override
    public int deleteOrderMmByIds(Long[] omIds) {
        return sysOrderMmMapper.deleteOrderMmByIds(omIds);
    }

    @Override
    public int insertOrderMm(SysOrderMm sysOrderMm) {
        sysOrderMmMapper.insertOrderMm(sysOrderMm);
        return sysOrderMm.getOmId();
    }


    @Override
    public int updateOrderMm(SysOrderMm sysOrderMm) {
        return sysOrderMmMapper.updateOrderMm(sysOrderMm);
    }
}
