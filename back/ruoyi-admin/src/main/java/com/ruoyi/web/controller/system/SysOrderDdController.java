
package com.ruoyi.web.controller.system;


import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Query;
import com.ruoyi.system.domain.SysOrderDd;
import com.ruoyi.system.domain.SysOrderDd;
import com.ruoyi.system.service.ISysOrderDdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/system/orderDd")
public class SysOrderDdController extends BaseController {

    @Autowired
    private ISysOrderDdService iSysOrderDdService;


//    @PreAuthorize("@ss.hasPermi('monitor:orderDd:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysOrderDd sysOrderDd) {
        startPage();
        List<SysOrderDd> list = iSysOrderDdService.selectOrderDdList(sysOrderDd);
        return getDataTable(list);
    }

//    @PreAuthorize("@ss.hasPermi('monitor:orderDd:list')")
    @Log(title = "总订单管理", businessType = BusinessType.INSERT)
    @PostMapping("/batch")
    public AjaxResult add(@Validated @RequestBody SysOrderDd sysOrderDd) {
        sysOrderDd.setCreateBy(getUsername());
        return toAjax(iSysOrderDdService.insertOrderDd(sysOrderDd));
    }

//    @PreAuthorize("@ss.hasPermi('monitor:orderDd:list')")
    @Log(title = "总订单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysOrderDd sysOrderDd) {
        sysOrderDd.setUpdateBy(getUsername());
        return toAjax(iSysOrderDdService.updateOrderDd(sysOrderDd));
    }

//    @PreAuthorize("@ss.hasPermi('monitor:orderDd:list')")
    @Log(title = "总订单管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{odId}")
    public AjaxResult remove(@PathVariable Long[] odId) {
        return toAjax(iSysOrderDdService.deleteOrderDdByIds(odId));
    }

}
