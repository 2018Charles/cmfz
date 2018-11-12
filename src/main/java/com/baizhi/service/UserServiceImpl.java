package com.baizhi.service;

import com.baizhi.dao.UserDAO;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<User> findAllUser() {
        List<User> users = userDAO.queryAllUser();
        return users;
    }

    @Override
    public void modifyUser(User user) {
        user.setOnlineDate(new Date());
        userDAO.updateUser(user);
    }

    @Override
    public User findUserById(String id) {
        User user = userDAO.queryUserById(id);
        return user;
    }
}
