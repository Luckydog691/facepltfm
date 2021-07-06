package com.jeesite.modules.test.entity;


import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;

@Table(name="video", alias="a", columns= {
        @Column(name = "id", attrName = "id", label = "编号", isPK = true),
        @Column(name = "videoname", attrName = "videoname"),
        @Column(name = "videopath", attrName = "videopath")
})
public class Video extends DataEntity<Video> {
    private String videoname;
    private String videopath;

    public Video(){this(null);}

    public Video(String id){super(id);}

    public String getVideoname() {
        return videoname;
    }

    public void setVideoname(String videoname) {
        this.videoname = videoname;
    }

    public String getVideopath() {
        return videopath;
    }

    public void setVideopath(String videopath) {
        this.videopath = videopath;
    }
}
