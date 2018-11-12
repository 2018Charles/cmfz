package com.baizhi.service;

import com.baizhi.dao.AdminDAO;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDAO adminDAO;
    @Override
    @Transactional(propagation =Propagation.SUPPORTS)
    public Admin login(Admin admin) {
        //Admin login = adminService.login(admin);
        Admin login = adminDAO.queryLogin(admin);
        return login;
    }

    @Override
    public void changePassword(Admin admin) {
        adminDAO.changePassword(admin);
    }

    @Override
    public Admin queryone(String id) {
        Admin queryone = adminDAO.queryone(id);
        return queryone;
    }
}
