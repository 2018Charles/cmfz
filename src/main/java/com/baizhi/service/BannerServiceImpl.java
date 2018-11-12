package com.baizhi.service;

import com.baizhi.dao.BannerDAO;
import com.baizhi.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDAO bannerDAO;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Banner> findAllBanner() {
        List<Banner> banners = bannerDAO.queryAllBanner();
        return banners;
    }

    @Override
    public void addBanner(Banner banner) {
        banner.setId(UUID.randomUUID().toString());
        banner.setCreateDate(new Date());
        bannerDAO.addBanner(banner);
    }

    @Override
    public Banner findBannerById(String id) {
        Banner byId = bannerDAO.queryBannerById(id);
        return byId;
    }

    @Override
    public void modifyBanner(Banner banner) {
            banner.setCreateDate(new Date());
        bannerDAO.updateBanner(banner);
    }

    @Override
    public void removeBannerById(String id) {
        bannerDAO.deleteBannerById(id);
    }
}
