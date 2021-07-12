package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_Emotion
{
      private String type;
      private double probability;

      public FaceInfo_Emotion(String s, double d)
      {
            type = s;
            probability = d;
      }
}
