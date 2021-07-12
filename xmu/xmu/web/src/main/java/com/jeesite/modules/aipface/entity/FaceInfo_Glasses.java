package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_Glasses
{
      private String type;
      private double probability;

      public FaceInfo_Glasses(String s, double d)
      {
            type = s;
            probability = d;
      }
}
