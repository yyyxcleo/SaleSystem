package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.Customer;
import com.ruoyi.system.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


@RestController
@RequestMapping("/system/customer")
public class CustomerController extends BaseController {

    @Autowired
    private ICustomerService iCustomerService;

    /**
     * 获取岗位列表
     */
    @PreAuthorize("@ss.hasPermi('monitor:customer:list')")
    @GetMapping("/list")
    public TableDataInfo list(Customer customer)
    {
        startPage();
        List<Customer> list = iCustomerService.selectPostList(customer);
        return getDataTable(list);
    }

    @Log(title = "岗位管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('monitor:customer:list')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, Customer post)
    {
        List<Customer> list = iCustomerService.selectPostList(post);
        ExcelUtil<Customer> util = new ExcelUtil<Customer>(Customer.class);
        util.exportExcel(response, list, "岗位数据");
    }

    /**
     * 根据岗位编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('monitor:customer:list')")
    @GetMapping(value = "/{postId}")
    public AjaxResult getInfo(@PathVariable Long postId)
    {
        return success(iCustomerService.selectPostById(postId));
    }

    /**
     * 新增岗位
     */
    @PreAuthorize("@ss.hasPermi('monitor:customer:post')")
    @PostMapping
    public AjaxResult add(@RequestBody Customer customer)
    {
        customer.setCreateBy(getUsername());
        return toAjax(iCustomerService.insertPost(customer));
    }

    /**
     * 修改岗位
     */
    @PreAuthorize("@ss.hasPermi('monitor:customer:list')")
    @PutMapping
    public AjaxResult edit(@RequestBody Customer post)
    {
        if (!iCustomerService.checkPostNameUnique(post))
        {
            return error("修改岗位'" + post.getCusName() + "'失败，岗位名称已存在");
        }
        else if (!iCustomerService.checkPostCodeUnique(post))
        {
            return error("修改岗位'" + post.getCusName() + "'失败，岗位编码已存在");
        }
        post.setUpdateBy(getUsername());
        return toAjax(iCustomerService.updatePost(post));
    }

    /**
     * 删除岗位
     */
    @PreAuthorize("@ss.hasPermi('monitor:customer:list')")
    @Log(title = "岗位管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{postIds}")
    public AjaxResult remove(@PathVariable Long[] postIds)
    {
        return toAjax(iCustomerService.deletePostByIds(postIds));
    }

    /**
     * 获取岗位选择框列表
     */
    @GetMapping("/optionselect")
    public AjaxResult optionselect()
    {
        List<Customer> posts = iCustomerService.selectPostAll();
        return success(posts);
    }
}
