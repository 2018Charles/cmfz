package com.baizhi.service;

import com.baizhi.entity.Chapter;

public interface ChapterService {
    void saveChapter(Chapter chapter);

    void deleteChapterById(String id);

    Chapter queryChapterById(String id);


}
