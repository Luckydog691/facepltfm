package com.jeesite.modules.test.entity;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;


@Table(name="client", alias="a", columns= {
        @Column(name = "id", attrName = "id", label = "编号", isPK = true),
        @Column(name = "name", attrName = "name"),
        @Column(name = "gender", attrName = "gender"),
        @Column(name = "birthday", attrName = "birthday"),
        @Column(name = "height", attrName = "height"),
        @Column(name = "weight", attrName = "weight")
})
public class Client extends DataEntity<Client> {
    private String name;
    private String gender;
    private String birthday;
    private double height;
    private double weight;

    public Client() {
        this(null);
    }

    public Client(String id){
        super(id);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

}
