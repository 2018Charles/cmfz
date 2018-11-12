package com.baizhi.service;

import com.baizhi.dao.GuruDAO;
import com.baizhi.entity.Guru;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class GuruServiceImpl implements GuruService {
    @Autowired
    private GuruDAO guruDAO;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findAllGuru() {
        List<Guru> gurus = guruDAO.queryAllGuru();
        return gurus;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Guru findGuruById(String id) {
        Guru guru = guruDAO.queryGuruById(id);
        return guru;
    }

    @Override
    public void removeGuruById(String id) {
        guruDAO.deleteById(id);
    }

    @Override
    public void addGuru(Guru guru) {
        guru.setId(UUID.randomUUID().toString());
        guruDAO.insertGuru(guru);
    }

    @Override
    public void modifyGuru(Guru guru) {

        guruDAO.updateGuru(guru);
    }

}
