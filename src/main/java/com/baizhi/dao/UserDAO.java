package com.baizhi.dao;

import com.baizhi.entity.User;

import java.util.List;

public interface UserDAO {
    List<User> queryAllUser();
    void  updateUser(User user);

    User queryUserById(String id);
}
