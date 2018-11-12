package com.baizhi.dao;

import com.baizhi.entity.Album;

import java.util.List;

public interface AlbumDAO {
    void insertAlbumDAO(Album album);

    void deleteAlbumById(String id);

    Album queryAlbumById(String id);

    List<Album> queryAllAlbum();

    List<Album> queryAllName();
}
