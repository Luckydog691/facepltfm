package com.jeesite.modules.test.entity;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;

@Table(name="client_group", alias="a", columns= {
        @Column(name = "id", attrName = "id", label = "编号", isPK = true),
        @Column(name = "name", attrName = "name")
})
public class ClientGroup extends DataEntity<ClientGroup> {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
