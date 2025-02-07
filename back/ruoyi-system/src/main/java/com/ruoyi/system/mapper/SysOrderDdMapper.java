package com.ruoyi.system.mapper;



import com.fasterxml.jackson.databind.ser.Serializers;
import com.ruoyi.system.domain.SysOrderDd;
import com.ruoyi.system.domain.SysOrderDd;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


public interface SysOrderDdMapper  {

    public List<SysOrderDd> selectOrderDdList(SysOrderDd sysOrderDd);



    public int deleteOrderDdByIds(Long[] omIds);


    public int updateOrderDd(SysOrderDd sysOrderDd);


    public int insertOrderDd(SysOrderDd sysOrderDd);
}
