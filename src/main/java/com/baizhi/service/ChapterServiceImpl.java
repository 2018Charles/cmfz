package com.baizhi.service;

import com.baizhi.dao.ChapterDAO;
import com.baizhi.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.UUID;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService {
    @Autowired
    private ChapterDAO chapterDAO;
    @Override
    public void saveChapter(Chapter chapter) {
        chapter.setUploadDate(new Date());
        chapter.setSize(4563);
        chapter.setDuration("4");
        chapterDAO.insertChapter(chapter);
    }

    @Override
    public void deleteChapterById(String id) {
        chapterDAO.deleteChapterById(id);
    }

    @Override
    public Chapter queryChapterById(String id) {
        Chapter chapter = chapterDAO.queryChapterById(id);
        return chapter;
    }

}
