package com.jeesite.modules.test.entity.facedatabase;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;
@Table(name="faceinfo_facegroup", alias="a", columns= {
        @Column(name = "id", attrName = "id", label = "编号", isPK = true),
        @Column(name = "faceinfoID", attrName = "faceinfoId"),
        @Column(name = "groupID", attrName = "groupId")
})

public class Faceinfo_Facegroup extends DataEntity<Faceinfo_Facegroup> {
    private String faceinfoId;
    private String groupId;

    public Faceinfo_Facegroup(){this(null);}

    public Faceinfo_Facegroup(String id){super(id);}

    public String getFaceinfoId() {
        return faceinfoId;
    }

    public void setFaceinfoId(String faceinfoId) {
        this.faceinfoId = faceinfoId;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }
}

