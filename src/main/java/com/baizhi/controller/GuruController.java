package com.baizhi.controller;

import com.baizhi.entity.Guru;
import com.baizhi.entity.Result;
import com.baizhi.service.GuruService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/guru")
public class GuruController {
    @Autowired
    private GuruService guruService;


    @RequestMapping("findAll")
    public @ResponseBody List<Guru> findAll(){
        List<Guru> allDuru = guruService.findAllGuru();
        return allDuru;
    }

    @RequestMapping("/save")
    public @ResponseBody
    Result save(Guru guru, MultipartFile headPics, HttpServletRequest request){
        //原始图片名称
        String originalFilename = headPics.getOriginalFilename();
        if(headPics!=null&&originalFilename!=null&&originalFilename.length()>0){
            //定义文件保存的本地路径
            String localPath="E:\\IDEAcode\\chimingfazhou_lix\\src\\main\\webapp\\back\\banner\\bannerImg\\";
            File newFile = new File(localPath+originalFilename);
            try {
                //上传
                headPics.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
                return new Result(false,"上传失败！");
            }
            guru.setHeadPic(originalFilename);
        }
        guruService.addGuru(guru);
        return new Result(true,"添加成功！");

    }

    @RequestMapping("/queryoneById")
    public @ResponseBody Object  queryone(String id){
        Guru guruById = guruService.findGuruById(id);
        System.out.println(guruById);
        return guruById;
    }

    @RequestMapping("/update")
    public @ResponseBody
    Result update(Guru guru, MultipartFile headPics, HttpServletRequest request){
        //原始图片名称
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
                return new Result(false,"上传失败！");
            }
            guru.setHeadPic(newFileName);
        }
        guruService.modifyGuru(guru);
        return new Result(true,"添加成功！");

    }

    @RequestMapping("delete")
    public @ResponseBody
    Map<String,Object> deleteGuru(String id){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            guruService.removeGuruById(id);
            map.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }
}
