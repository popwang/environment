package com.environment.contrller;

import com.baomidou.mybatisplus.plugins.Page;
import com.environment.mypuls.entity.User;
import com.environment.mypuls.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author niuchen
 * @since 2017-10-25
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserService user;

	/**
	 * 分页 PAGE
	 */
	@GetMapping("/test")
	@ResponseBody
	public Page<User> test() {
		System.out.println("test");
		Page<User> p = null;
		try {
//			p = user.selectPage(new Page<User>(0, 12));
//			System.out.println(p.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	/**
	 * 分页 PAGE
	 */
	@GetMapping("/test2")
	@ResponseBody
	public User test2() {
		System.out.println("test");
		User u = null;
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
}
