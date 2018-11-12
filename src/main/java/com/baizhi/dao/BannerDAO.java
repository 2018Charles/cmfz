package com.baizhi.dao;

import com.baizhi.entity.Banner;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BannerDAO {
    List<Banner> queryAllBanner();
    //添加轮播图
    void addBanner(Banner banner);
    //通过id查询轮播图
    Banner queryBannerById(String id);
    //修改轮播图
    void updateBanner(Banner banner);
    //删除轮播图
    void deleteBannerById(String id);
}
