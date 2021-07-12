package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_FaceShape
{
      private String type;
      private double probability;

      public FaceInfo_FaceShape(String s, double d)
      {
            type = s;
            probability = d;
      }
}
