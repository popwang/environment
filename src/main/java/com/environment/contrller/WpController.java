package com.environment.contrller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.environment.mypuls.entity.TWpOrderBuffer;
import com.environment.mypuls.service.IOrderBufferService;
import com.environment.utils.CommandUtil;

@Controller
@RequestMapping("/wp")
public class WpController {
	
	@Autowired
	private IOrderBufferService orderBufferService;
	
	@RequestMapping("/command")
	@ResponseBody
	public Map<String,Object> offonHandler(String command,String name,String status,String sets){
		Map<String,Object> map = new HashMap<>();
		TWpOrderBuffer order = new TWpOrderBuffer();
		String cmd = CommandUtil.getCommand(command, name, status, sets);
		order.setiSendFlag(0);
		order.setvEquipmentName(name);
		order.setvOrderContent(cmd);
		orderBufferService.insertOrderBuffer(order);
		map.put("msg", "success");
		return map;
	}
}
