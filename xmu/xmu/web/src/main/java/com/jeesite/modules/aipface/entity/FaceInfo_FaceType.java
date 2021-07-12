package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_FaceType
{
      private String type;
      private double probability;

      public FaceInfo_FaceType(String s, double d)
      {
            type = s;
            probability = d;
      }
}
