package com.jeesite.modules.test.entity.facedatabase;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;

@Table(name="feature", alias="a", columns={
        @Column(name="id", attrName="id", label="编号", isPK=true),
        @Column(name="feature", attrName="feature"),
        @Column(name="FaceInfoid", attrName="faceInfoId")
})
public class Feature extends DataEntity<Feature>{

    private byte[] feature;
    private String faceInfoId;

    public byte[] getFeature() {
        return feature;
    }

    public void setFeature(byte[] feature) {
        this.feature = feature;
    }

    public String getFaceInfoId() {
        return faceInfoId;
    }

    public void setFaceInfoId(String faceInfoId) {
        this.faceInfoId = faceInfoId;
    }
}
