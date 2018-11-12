package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.entity.Result;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/admin")
public class AdminLoginController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("/login")
    public @ResponseBody Result login(String user_input_verifyCode, Admin admin, HttpServletRequest request) {
        Admin admin1 = adminService.login(admin);
        String codeValue = (String) request.getSession().getAttribute("verifyCodeValue");
        if (codeValue != null && codeValue.equalsIgnoreCase(user_input_verifyCode)) {
            if (admin1 != null) {
                request.getSession().setAttribute("login_admin", admin1);
                return new Result(true, "登录成功！");
            } else {
                return new Result(false, "账号或密码错误！");
            }
        } else {
            return new Result(false, "验证码错误");
        }
    }
    @RequestMapping("/changePwd")
    @ResponseBody
    public Result checkPwd(Admin admin,HttpServletRequest request){
        if (admin!=null) {
            adminService.changePassword(admin);
            request.getSession().removeAttribute("login_admin");
            return new Result(true, "修改成功！");
        }else {
            return new Result(false,"修改错误！");
        }
    }


@RequestMapping("/loginout")
    public String loginOut(HttpServletRequest request){
        request.getSession().removeAttribute("login_admin");
        return "redirect:/back/main/login.jsp";
    }
}
