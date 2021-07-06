package com.jeesite.modules.test.entity.facedatabase;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;
import com.jeesite.common.mybatis.mapper.query.QueryType;

@Table(name="public_security_verification", alias="a", columns={
        @Column(name="id", attrName="id", label="编号", isPK=true),
        @Column(name="userId", attrName="userId", label="身份证号", queryType= QueryType.LIKE),
        @Column(name="userName", attrName="userName", label="姓名", queryType=QueryType.LIKE),
        @Column(name="filepath", attrName="filepath", label="图片路径", queryType=QueryType.LIKE),
        @Column(name="filename", attrName="filename", label="图片名字", queryType=QueryType.LIKE)
}
)
public class Public_Security_Verification extends DataEntity<Public_Security_Verification> {
    private String userId;
    private String userName;
    private String filepath;
    private String filename;

    public Public_Security_Verification(){this(null);}

    public Public_Security_Verification(String id){super(id);}

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
