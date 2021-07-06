package com.jeesite.modules.test.entity;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;
import lombok.Data;

import java.util.Date;

@Table(name="doc", alias="a", columns= {
        @Column(name = "id", attrName = "id", label = "编号", isPK = true),
        @Column(name = "title", attrName = "title"),
        @Column(name = "filepath", attrName = "filepath"),
        @Column(name = "filename", attrName = "filename"),
        @Column(name = "context", attrName = "context"),
        @Column(name = "upload_user_code", attrName = "uploadUserCode"),
        @Column(name = "uploadtime", attrName = "uploadtime")
})
@Data
public class Doc extends DataEntity<Doc> {
    private String title;
    private String filepath;
    private String filename;
    private String context;
    private String upLoadUserCode;
    private String uploadtime;

    public Doc() {
        this(null);
    }

    public Doc(String id){
        super(id);
    }

    public String getUploadUserCode() {
        return upLoadUserCode;
    }

    public void setUploadUserCode(String upLoadUserCode) {
        this.upLoadUserCode = upLoadUserCode;
    }
}
