package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService {
   Admin login(Admin admin);

   void changePassword(Admin admin);

   Admin queryone(String id);
}
