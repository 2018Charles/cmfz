package com.baizhi.service;

import com.baizhi.dao.AlbumDAO;
import com.baizhi.dao.ChapterDAO;
import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import com.baizhi.entity.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    private AlbumDAO albumDAO;
    @Autowired
    private ChapterDAO chapterDAO;
    @Override
    public void addAlbumDAO(Album album) {
        album.setId(UUID.randomUUID().toString());
        album.setPublishDate(new Date());
        albumDAO.insertAlbumDAO(album);
    }

    @Override
    public void removeAlbumById(String id) {
        try {
            List<Chapter> chapters = chapterDAO.queryAllChapter(id);
            for (Chapter chapter : chapters) {
                chapterDAO.deleteChapterById(chapter.getId());
                System.out.println(chapters.size());

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        albumDAO.deleteAlbumById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Album findAlbumById(String id) {

        Album album = albumDAO.queryAlbumById(id);
        return album;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findAllAlbum() {
        List<Album> albums = albumDAO.queryAllAlbum();
        return albums;
    }

    @Override
    @Transactional
    public List<Album> findAllName() {

        List<Album> albums = albumDAO.queryAllName();
        return albums;
    }


}
