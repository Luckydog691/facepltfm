package com.jeesite.modules.test.entity.facedatabase;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;

@Table(name="facepicture", alias="a", columns= {
        @Column(name = "id", attrName = "id", label = "编号", isPK = true),
        @Column(name = "faceinfoID", attrName = "faceinfoId"),
        @Column(name = "filename", attrName = "filename"),
        @Column(name = "filepath", attrName = "filepath")
})
public class FacePicture extends DataEntity<FacePicture> {
    private String faceinfoId;
    private String filename;
    private String filepath;

    public FacePicture(){this(null);}

    public FacePicture(String id){super(id);}

    public String getFaceinfoId() {
        return faceinfoId;
    }

    public void setFaceinfoId(String faceinfoId) {
        this.faceinfoId = faceinfoId;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }
}
