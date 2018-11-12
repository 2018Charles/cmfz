package com.baizhi.dao;

import com.baizhi.entity.Guru;

import java.util.List;

public interface GuruDAO {
    List<Guru> queryAllGuru();

    Guru queryGuruById(String id);

    void deleteById(String id);

    void insertGuru(Guru guru);

    void updateGuru(Guru guru);
}
