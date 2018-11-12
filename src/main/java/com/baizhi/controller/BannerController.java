package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.entity.Result;
import com.baizhi.service.BannerService;
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
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;
    @RequestMapping("/findAll")
    public @ResponseBody List<Banner> findAll(){
        List<Banner> banners = bannerService.findAllBanner();
        return  banners;
    }

    @RequestMapping("/save")
    public @ResponseBody Result save(Banner banner, MultipartFile imgsPath, HttpServletRequest request){
        //原始图片名称
        String originalFilename = imgsPath.getOriginalFilename();
        if(imgsPath!=null&&originalFilename!=null&&originalFilename.length()>0){
            //定义文件保存的本地路径
            String localPath="E:\\IDEAcode\\chimingfazhou_lix\\src\\main\\webapp\\back\\banner\\bannerImg\\";
            String newFileName=originalFilename+originalFilename.substring(originalFilename.lastIndexOf("."));
            File newFile = new File(localPath+newFileName);
            try {
                //上传
                imgsPath.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
                return new Result(false,"上传失败！");
            }
            banner.setImgPath(newFileName);
        }
           bannerService.addBanner(banner);
        return new Result(true,"添加成功！");

    }



    @RequestMapping("delete")
    public @ResponseBody Map<String,Object> deleteBanner(String id){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            bannerService.removeBannerById(id);
            map.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }

    @RequestMapping("/update")
    public @ResponseBody Result update(Banner banner, MultipartFile imgsPath, HttpServletRequest request){

        //原始图片名称
        String originalFilename = imgsPath.getOriginalFilename();
        if(imgsPath!=null&&originalFilename!=null&&originalFilename.length()>0){
            //定义文件保存的本地路径
            String localPath="E:\\IDEAcode\\chimingfazhou_lix\\src\\main\\webapp\\back\\banner\\bannerImg\\";
            String newFileName=originalFilename+originalFilename.substring(originalFilename.lastIndexOf("."));
            File newFile = new File(localPath+newFileName);

            try {
                //上传
                imgsPath.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
                return new Result(false,"修改失败！");
            }
            banner.setImgPath(newFileName);
        }
        bannerService.modifyBanner(banner);
        return new Result(true,"修改成功！");

    }

    @RequestMapping("/queryoneById")
    public @ResponseBody Object  queryone(String id){

        Banner bannerById = bannerService.findBannerById(id);
        System.out.println(bannerById);
        return bannerById;
    }
}
