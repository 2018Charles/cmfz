package com.baizhi.controller;

import com.baizhi.entity.Album;

import com.baizhi.entity.Result;
import com.baizhi.service.AlbumService;
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
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    private AlbumService albumService;
    @RequestMapping("/queryone")
    @ResponseBody
    public Object queryone(String id){
        Album albumById = albumService.findAlbumById(id);
        return albumById;
    }


    @RequestMapping("/findAll")
    public @ResponseBody Map<String,Object> findAll(){
        HashMap<String, Object> result = new HashMap<>();
        List<Album> allAlbum = albumService.findAllAlbum();
        result.put("rows",allAlbum);
        System.out.println(allAlbum);
        return result;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map<String,Object>  deleteAlbum(String id){
        HashMap<String, Object> map = new HashMap<>();
        try {
           albumService.removeAlbumById(id);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("删除失败！",false);
        }
        return map;
    }

    @RequestMapping("/allName")
    @ResponseBody
    public List<Album> findAllName(){
        List<Album> allName = albumService.findAllName();
        return allName;
    }

    @RequestMapping("/save")
    public @ResponseBody Result save(Album album, MultipartFile coverImgs, HttpServletRequest request){
        //原始图片名称
        String originalFilename = coverImgs.getOriginalFilename();
        if(coverImgs!=null&&originalFilename!=null&&originalFilename.length()>0){
            //定义文件保存的本地路径
            String localPath="E:\\IDEAcode\\chimingfazhou_lix\\src\\main\\webapp\\back\\banner\\bannerImg\\";
            String newFileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
            File newFile = new File(localPath+newFileName);
            try {
                //上传
                coverImgs.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
                return new Result(false,"上传失败！");
            }
            album.setCoverImg(newFileName);
        }
        albumService.addAlbumDAO(album);
        return new Result(true,"添加成功！");

    }
}
