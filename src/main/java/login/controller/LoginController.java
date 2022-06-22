package login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @RequestMapping("/login")
    public String login(){
        return "/login/login";
    }

    @RequestMapping("/logout")
    public String logout(){
        return "/main/main";
    }

    @RequestMapping("/userMypage")
    public String userMypage(){
        return "/login/userMypage";
    }

    @RequestMapping("/userRegister")
    public String userRegister(){
        return "/login/userRegister";
    }
}
