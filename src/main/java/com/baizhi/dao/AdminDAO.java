package com.baizhi.dao;

import com.baizhi.entity.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDAO {
    Admin queryLogin(Admin admin);

    void changePassword(Admin admin);

    Admin queryone(String id);
}
