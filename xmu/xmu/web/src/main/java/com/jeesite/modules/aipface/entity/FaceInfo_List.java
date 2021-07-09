package com.jeesite.modules.aipface.entity;

import lombok.Data;

import java.util.ArrayList;

@Data
public class FaceInfo_List
{
      private String face_token;
      private FaceInfo_List_Location location;
      private double face_probability;
      private FaceInfo_List_Angel angel;
      private double age;
      private Long beauty;
      private FaceInfo_List_Expression expression;
      private FaceInfo_List_FaceShape face_shape;
      private FaceInfo_List_Gender gender;
      private FaceInfo_List_Glasses glasses;
      private FaceInfo_List_EyeStatus eye_status;
      private FaceInfo_List_Emotion emotion;
      private FaceInfo_List_FaceType face_type;
      private ArrayList<FaceInfo_List_LandMarkPoint>landmark;
      private ArrayList<FaceInfo_List_LandMarkPoint>landmark72;
      private ArrayList<FaceInfo_List_LandMarkPoint>landmark150;
      private FaceInfo_List_Quality quality;
}
