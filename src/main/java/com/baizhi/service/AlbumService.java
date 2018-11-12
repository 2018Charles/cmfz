package com.baizhi.service;

import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;

import java.util.List;

public interface AlbumService {
    void addAlbumDAO(Album album);

    void removeAlbumById(String id);

    Album findAlbumById(String id);

    List<Album> findAllAlbum();

    List<Album> findAllName();


}
