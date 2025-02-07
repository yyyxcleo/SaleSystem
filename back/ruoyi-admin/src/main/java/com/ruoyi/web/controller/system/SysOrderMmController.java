package com.ruoyi.web.controller.system;


import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Order;
import com.ruoyi.system.domain.Query;
import com.ruoyi.system.domain.SysOrderMm;
import com.ruoyi.system.service.ISysOrderMmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

import static com.ruoyi.common.utils.PageUtils.startPage;

@RestController
@RequestMapping("/system/orderMm")
public class SysOrderMmController extends BaseController {
    @Autowired
    private ISysOrderMmService iSysOrderMmService;


//    @PreAuthorize("@ss.hasPermi('monitor:orderMm:list')")
    @GetMapping(value = "/{omId}")
    public AjaxResult getInfo(@PathVariable Long omId) {
        return success(iSysOrderMmService.selectOrderMmById(omId));
    }


//    @PreAuthorize("@ss.hasPermi('monitor:orderMm:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysOrderMm sysOrderMm) {
        startPage();
        List<SysOrderMm> list = iSysOrderMmService.selectOrderMmList(sysOrderMm);
        return getDataTable(list);
    }

//    @PreAuthorize("@ss.hasPermi('monitor:orderMm:list')")
    @Log(title = "总订单管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysOrderMm sysOrderMm) {
        sysOrderMm.setCreateBy(getUsername());
        return toAjax(iSysOrderMmService.insertOrderMm(sysOrderMm));
    }

//    @PreAuthorize("@ss.hasPermi('monitor:orderMm:list')")
    @Log(title = "总订单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysOrderMm sysOrderMm) {
        sysOrderMm.setUpdateBy(getUsername());
        return toAjax(iSysOrderMmService.updateOrderMm(sysOrderMm));
    }

//    @PreAuthorize("@ss.hasPermi('monitor:orderMm:list')")
    @Log(title = "总订单管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{omId}")
    public AjaxResult remove(@PathVariable Long[] omId) {
        return toAjax(iSysOrderMmService.deleteOrderMmByIds(omId));
    }

}
