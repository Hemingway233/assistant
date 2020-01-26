package com.whm.assistant.action;

import com.opensymphony.xwork2.Action;
import com.whm.assistant.entity.Device;
import com.whm.assistant.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * @program: com.whm.assistant.action
 * @ClassName: DeviceAction
 * @Date: 2019/12/20 20:33
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Controller("deviceAction")
@Scope("prototype")
public class DeviceAction extends BaseAction<Device> {

    @Autowired
    private DeviceService deviceService;

    public String add() throws Exception {
        deviceService.add(t);
        return Action.SUCCESS;
    }

    public String page() throws Exception {
        count = deviceService.findCount();
        list = deviceService.page(this.page, limit);
        //给json工具类封装数据
        this.jsonConvert(count, this.list);
        return "jsonData";
    }
}
