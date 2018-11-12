package com.baizhi.service;

import com.baizhi.entity.User;

import java.util.List;

public interface UserService {

    List<User> findAllUser();
    void  modifyUser(User user);

    User findUserById(String id);

}
