package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_Gender
{
      private String type;
      private double probability;

      public FaceInfo_Gender(String s, double d)
      {
            type = s;
            probability = d;
      }
}
