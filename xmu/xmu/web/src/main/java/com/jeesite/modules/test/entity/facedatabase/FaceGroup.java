package com.jeesite.modules.test.entity.facedatabase;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;
import com.jeesite.common.mybatis.mapper.query.QueryType;

@Table(name="facegroup", alias="a", columns={
        @Column(name="id", attrName="id", label="编号", isPK=true),
        @Column(name="groupID", attrName="groupId", label="组号", queryType= QueryType.LIKE),
        @Column(name="remarks", attrName="remarks", label="注释", queryType=QueryType.LIKE),
}
)
public class FaceGroup extends DataEntity<FaceGroup> {
    private int groupId;
    private String remarks;

    public FaceGroup(){this(null);}

    public FaceGroup(String id){super(id);}

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
