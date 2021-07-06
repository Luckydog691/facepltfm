package com.jeesite.modules.test.entity.facedatabase;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Table(name="alterfeature", alias="a", columns={
        @Column(name="id", attrName="id", label="编号", isPK=true),
        @Column(name="feature", attrName="feature"),
        @Column(name="featureid", attrName="featureId"),
        @Column(name="alterType", attrName="alterType"),
        @Column(name="alterTime", attrName="alterTime"),
})
public class AlterFeature extends DataEntity<AlterFeature>{
    private byte[] feature;
    private String featureId;
    private String alterType;
    private Date alterTime;

    public byte[] getFeature() {
        return feature;
    }

    public void setFeature(byte[] feature) {
        this.feature = feature;
    }

    public String getFeatureId() {
        return featureId;
    }

    public void setFeatureId(String featureId) {
        this.featureId = featureId;
    }

    public String getAlterType() {
        return alterType;
    }

    public void setAlterType(String alterType) {
        this.alterType = alterType;
    }

    public Date getAlterTime() {
        return alterTime;
    }

    public void setAlterTime(Date alterTime) {
        this.alterTime = alterTime;
    }
}
