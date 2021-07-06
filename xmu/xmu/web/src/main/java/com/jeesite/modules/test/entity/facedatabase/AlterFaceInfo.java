package com.jeesite.modules.test.entity.facedatabase;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;

import java.util.Date;

@Table(name="alterfaceinfo", alias="a", columns={
        @Column(name="id", attrName="id", label="编号", isPK=true),
        @Column(name="FaceID", attrName="faceID"),
        @Column(name="centerX", attrName="centerX"),
        @Column(name="centerY", attrName="centerY"),
        @Column(name="width", attrName="width"),
        @Column(name="height", attrName="height"),
        @Column(name="angle", attrName="angle"),
        @Column(name="score", attrName="score"),
        @Column(name="landmarks", attrName="landmarks"),
        @Column(name="yaw", attrName="yaw"),
        @Column(name="roll", attrName="roll"),
        @Column(name="pitch", attrName="pitch"),
        @Column(name="bluriness", attrName="bluriness"),
        @Column(name="illum", attrName="illum"),
        @Column(name="age", attrName="age"),
        @Column(name="mouthclose", attrName="mouthclose"),
        @Column(name="leftEyeclose", attrName="leftEyeclose"),
        @Column(name="rightEyeclose", attrName="rightEyeclose"),
        @Column(name="occlusion", attrName="occlusion"),
        @Column(name="race", attrName="race"),
        @Column(name="galsses", attrName="galsses"),
        @Column(name="gender", attrName="gender"),
        @Column(name="FaceInfoid", attrName="faceInfoId"),
        @Column(name="alterType", attrName="alterType"),
        @Column(name="alterTime", attrName="alterTime"),
})
public class AlterFaceInfo extends DataEntity<AlterFaceInfo>{

    private float faceId;
    private float centerX;
    private float centerY;
    private float width;
    private float height;
    private float angle;
    private float score;
    private String landmarks;
    private float yaw;
    private float roll;
    private float pitch;
    private float bluriness;
    private String illum;
    private int age;
    private float mouthclose;
    private float leftEyeclose;
    private float rightEyeclose;
    private String occlusion;
    private String race;
    private String galsses;
    private String gender;
    private String faceInfoId;
    private String alterType;
    private Date alterTime;

    public float getFaceId() {
        return faceId;
    }

    public void setFaceId(float faceId) {
        this.faceId = faceId;
    }

    public float getCenterX() {
        return centerX;
    }

    public void setCenterX(float centerX) {
        this.centerX = centerX;
    }

    public float getCenterY() {
        return centerY;
    }

    public void setCenterY(float centerY) {
        this.centerY = centerY;
    }

    public float getWidth() {
        return width;
    }

    public void setWidth(float width) {
        this.width = width;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public float getAngle() {
        return angle;
    }

    public void setAngle(float angle) {
        this.angle = angle;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public String getLandmarks() {
        return landmarks;
    }

    public void setLandmarks(String landmarks) {
        this.landmarks = landmarks;
    }

    public float getYaw() {
        return yaw;
    }

    public void setYaw(float yaw) {
        this.yaw = yaw;
    }

    public float getRoll() {
        return roll;
    }

    public void setRoll(float roll) {
        this.roll = roll;
    }

    public float getPitch() {
        return pitch;
    }

    public void setPitch(float pitch) {
        this.pitch = pitch;
    }

    public float getBluriness() {
        return bluriness;
    }

    public void setBluriness(float bluriness) {
        this.bluriness = bluriness;
    }

    public String getIllum() {
        return illum;
    }

    public void setIllum(String illum) {
        this.illum = illum;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public float getMouthclose() {
        return mouthclose;
    }

    public void setMouthclose(float mouthclose) {
        this.mouthclose = mouthclose;
    }

    public float getLeftEyeclose() {
        return leftEyeclose;
    }

    public void setLeftEyeclose(float leftEyeclose) {
        this.leftEyeclose = leftEyeclose;
    }

    public float getRightEyeclose() {
        return rightEyeclose;
    }

    public void setRightEyeclose(float rightEyeclose) {
        this.rightEyeclose = rightEyeclose;
    }

    public String getOcclusion() {
        return occlusion;
    }

    public void setOcclusion(String occlusion) {
        this.occlusion = occlusion;
    }

    public String getRace() {
        return race;
    }

    public void setRace(String race) {
        this.race = race;
    }

    public String getGalsses() {
        return galsses;
    }

    public void setGalsses(String galsses) {
        this.galsses = galsses;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getFaceInfoId() {
        return faceInfoId;
    }

    public void setFaceInfoId(String faceInfoId) {
        this.faceInfoId = faceInfoId;
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
