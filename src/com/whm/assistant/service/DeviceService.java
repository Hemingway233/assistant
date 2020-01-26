package com.whm.assistant.service;

import com.whm.assistant.dao.DeviceDao;
import com.whm.assistant.entity.Device;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: com.whm.assistant.service
 * @ClassName: DeviceService
 * @Date: 2019/12/20 20:33
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Service("deviceService")
@Transactional(rollbackFor = Exception.class)
public class DeviceService {

    @Autowired
    private DeviceDao deviceDao;

    public void add(Device device) {
        deviceDao.add(device);
    }

    public List<Device> page(int page, int limit) {
        return deviceDao.findPage(page, limit);
    }

    public int findCount() {
        return deviceDao.findCount();
    }
}
