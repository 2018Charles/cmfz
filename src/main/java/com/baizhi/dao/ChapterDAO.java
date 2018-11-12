package com.baizhi.dao;

import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;

import java.util.List;

public interface ChapterDAO {
    void insertChapter(Chapter chapter);

    void deleteChapterById(String id);

    Chapter queryChapterById(String id);

    List<Chapter> queryAllChapter(String id);

    int queryChapterSize(Album album);
}
