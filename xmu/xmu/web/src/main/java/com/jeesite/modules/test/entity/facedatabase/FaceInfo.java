package com.jeesite.modules.test.entity.facedatabase;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;


@Table(name="faceinfo", alias="a", columns={
        @Column(name="id", attrName="id", label="编号", isPK=true),
        @Column(name="centerX", attrName="centerx"),
        @Column(name="centerY", attrName="centery"),
        @Column(name="width", attrName="width"),
        @Column(name="height", attrName="height"),
        @Column(name="angle", attrName="angle"),
        @Column(name="score", attrName="score"),
        @Column(name="yaw", attrName="yaw"),
        @Column(name="roll", attrName="roll"),
        @Column(name="pitch", attrName="pitch"),
        @Column(name="bluriness", attrName="bluriness"),
        @Column(name="illum", attrName="illum"),
        @Column(name="age", attrName="age"),
        @Column(name="mouthclose", attrName="mouthclose"),
        @Column(name="leftEyeclose", attrName="lefteyeclose"),
        @Column(name="rightEyeclose", attrName="righteyeclose"),
        @Column(name="occlusion", attrName="occlusion"),
        @Column(name="race", attrName="race"),
        @Column(name="glasses", attrName="glasses"),
        @Column(name="gender", attrName="gender"),
        @Column(name="clientID", attrName="clientid"),
        @Column(name="isalter", attrName="isalter")
})
public class FaceInfo extends DataEntity<FaceInfo> {
    private float centerx;
    private float centery;
    private float width;
    private float height;
    private float angle;
    private float score;
    private float yaw;
    private float roll;
    private float pitch;
    private float bluriness;
    private String illum;
    private int age;
    private float mouthclose;
    private float lefteyeclose;
    private float righteyeclose;
    private String occlusion;
    private String race;
    private String glasses;
    private String gender;
    private String clientid;
    private boolean isalter;

    public FaceInfo() {
        this(null);
    }

    public FaceInfo(String id){
        super(id);
    }

    public float getCenterx() {
        return centerx;
    }

    public void setCenterx(float centerx) {
        this.centerx = centerx;
    }

    public float getCentery() {
        return centery;
    }

    public void setCentery(float centery) {
        this.centery = centery;
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

    public float getLefteyeclose() {
        return lefteyeclose;
    }

    public void setLefteyeclose(float lefteyeclose) {
        this.lefteyeclose = lefteyeclose;
    }

    public float getRighteyeclose() {
        return righteyeclose;
    }

    public void setRighteyeclose(float righteyeclose) {
        this.righteyeclose = righteyeclose;
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

    public String getGlasses() {
        return glasses;
    }

    public void setGlasses(String glasses) {
        this.glasses = glasses;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getClientid() {
        return clientid;
    }

    public void setClientid(String clientid) {
        this.clientid = clientid;
    }

    public boolean isIsalter() {
        return isalter;
    }

    public void setIsalter(boolean isalter) {
        this.isalter = isalter;
    }

    @Override
    public String toString() {
        return "FaceInfo{" +
                "centerx=" + centerx +
                ", centery=" + centery +
                ", width=" + width +
                ", height=" + height +
                ", angle=" + angle +
                ", score=" + score +
                ", yaw=" + yaw +
                ", roll=" + roll +
                ", pitch=" + pitch +
                ", bluriness=" + bluriness +
                ", illum='" + illum + '\'' +
                ", age=" + age +
                ", mouthclose=" + mouthclose +
                ", lefteyeclose=" + lefteyeclose +
                ", righteyeclose=" + righteyeclose +
                ", occlusion='" + occlusion + '\'' +
                ", race='" + race + '\'' +
                ", glasses='" + glasses + '\'' +
                ", gender='" + gender + '\'' +
                ", clientid='" + clientid + '\'' +
                ", isalter=" + isalter +
                '}';
    }
}
