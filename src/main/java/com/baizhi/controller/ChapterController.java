package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.entity.Result;
import com.baizhi.service.ChapterService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/chapter")
public class ChapterController {
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/delete")
    @ResponseBody
    public Map<String,Object>  deleteChapter(String id){
        HashMap<String, Object> map = new HashMap<>();
        try {
            chapterService.deleteChapterById(id);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("删除失败！",false);
        }
        return map;
    }



    @RequestMapping("/save")
    @ResponseBody
    public Result save(Chapter chapter, MultipartFile downPaths,String album_id) throws IOException {
        try {
            String upload=upload(downPaths);
            chapter.setAlbum_id(album_id);
            chapter.setId(UUID.randomUUID().toString());
            chapter.setDownPath(upload);
        } catch (IOException e) {
            e.printStackTrace();
        }
        chapterService.saveChapter(chapter);
        return new Result(true,"添加成功！");
    }
    public String upload( MultipartFile downPaths) throws IOException {
        //原始图片名称
        String originalFilename = downPaths.getOriginalFilename();
        String newFileName=null;
        if(downPaths!=null&&originalFilename!=null&&originalFilename.length()>0){
            //定义文件保存的本地路径
            String localPath="E:\\IDEAcode\\chimingfazhou_lix\\src\\main\\webapp\\back\\banner\\bannerImg\\";
            newFileName=originalFilename+originalFilename.substring(originalFilename.lastIndexOf("."));
            File newFile = new File(localPath+newFileName);
           // File newFile = new File(localPath,originalFilename);
                //上传
            downPaths.transferTo(newFile);
        }
        return newFileName;

    }
@RequestMapping("/download")


public ResponseEntity<byte[]> download(HttpServletRequest request, String filename,
                                       Model model,String filepath)throws Exception {
    //下载文件路径
    //String realPath = request.getSession().getServletContext().getRealPath("/files");
    String realPath="E:\\IDEAcode\\chimingfazhou_lix\\src\\main\\webapp\\back\\banner\\bannerImg";
    File file = new File(realPath + File.separator + filepath);
    HttpHeaders headers = new HttpHeaders();
    //下载显示的文件名，解决中文名称乱码问题
    String downloadFielName = filename+filepath.substring(filepath.lastIndexOf("."));
    System.out.println(downloadFielName);
    String s = new String(downloadFielName.getBytes("utf-8"), "iso-8859-1");
    //通知浏览器以attachment（下载方式）打开图片
    headers.setContentDispositionFormData("attachment", s);
    //application/octet-stream ： 二进制流数据（最常见的文件下载）。
    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
    return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
            headers, HttpStatus.CREATED);
}
}
