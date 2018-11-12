package com.baizhi.service;

import com.baizhi.entity.Guru;

import java.util.List;

public interface GuruService {

    List<Guru> findAllGuru();

    Guru findGuruById(String id);

    void removeGuruById(String id);

    void addGuru(Guru guru);

    void modifyGuru(Guru guru);
}
