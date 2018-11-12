package com.baizhi.controller;

import com.baizhi.entity.Result;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/findAll")
    @ResponseBody
    public List<User> findAll(){
        List<User> allUser = userService.findAllUser();
        return allUser;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result updateUser(User user, MultipartFile headPics, HttpServletRequest request){
        String originalFilename = headPics.getOriginalFilename();
        if(headPics!=null&&originalFilename!=null&&originalFilename.length()>0){
            //定义文件保存的本地路径
            String localPath="E:\\IDEAcode\\chimingfazhou_lix\\src\\main\\webapp\\back\\banner\\bannerImg\\";
            String newFileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
            File newFile = new File(localPath+newFileName);
            try {
                //上传
                headPics.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
                return new Result(false,"图像上传失败！");
            }
            user.setHeadPic(newFileName);
        }
        userService.modifyUser(user);
        return new Result(true,"修改成功！");
    }
    @RequestMapping("/queryone")
    @ResponseBody
    public Object queryone(String id){
        User userById = userService.findUserById(id);
        return userById;

    }
}
