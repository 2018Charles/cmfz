package com.baizhi.service;

import com.baizhi.entity.Banner;

import java.util.List;

public interface BannerService {
    List<Banner> findAllBanner();

    void addBanner(Banner banner);
    //通过id查询轮播图
    Banner findBannerById(String id);
    //修改轮播图
    void modifyBanner(Banner banner);
    //删除轮播图
    void removeBannerById(String id);
}
