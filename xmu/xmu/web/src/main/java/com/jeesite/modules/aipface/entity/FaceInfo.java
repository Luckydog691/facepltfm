package com.jeesite.modules.aipface.entity;

import lombok.Data;

import java.util.ArrayList;

@Data
public class FaceInfo
{
      private String face_token;
      private FaceInfo_Location location;
      private double face_probability;
      private FaceInfo_Angel angel;
      private double age;
      private double beauty;
      private FaceInfo_Expression expression;
      private FaceInfo_FaceShape face_shape;
      private FaceInfo_Gender gender;
      private FaceInfo_Glasses glasses;
      private FaceInfo_EyeStatus eye_status;
      private FaceInfo_Emotion emotion;
      private FaceInfo_FaceType face_type;
      private ArrayList<FaceInfo_LandMarkPoint>landmark;
      private ArrayList<FaceInfo_LandMarkPoint>landmark72;
      private ArrayList<FaceInfo_LandMarkPoint>landmark150;
      private FaceInfo_Quality quality;
}
