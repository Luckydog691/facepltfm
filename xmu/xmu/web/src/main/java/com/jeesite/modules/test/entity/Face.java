package com.jeesite.modules.test.entity;

import com.jeesite.common.entity.DataEntity;

public class Face extends DataEntity<Face> {
    private String id;
    private float centerX;
    private float centerY;
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
    private float leftEyeclose;
    private float rightEyeclose;
    private String occlusion;
    private String race;
    private String glasses;
    private String gender;
    private String clientName;
    private boolean isAlter;
    private byte[] feature;
    private String filepath;


    public Face() {
        this(null);
    }

    public Face(String id){
        super(id);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public byte[] getFeature() {
        return feature;
    }

    public void setFeature(byte[] feature) {
        this.feature = feature;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public boolean isAlter() {
        return isAlter;
    }

    public void setAlter(boolean alter) {
        isAlter = alter;
    }
}
