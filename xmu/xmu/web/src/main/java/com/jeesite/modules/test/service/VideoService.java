package com.jeesite.modules.test.service;

import com.jeesite.common.service.CrudService;
import com.jeesite.modules.test.dao.VideoDao;
import com.jeesite.modules.test.entity.Video;
import org.springframework.stereotype.Service;

@Service
public class VideoService extends CrudService<VideoDao, Video> {
}
