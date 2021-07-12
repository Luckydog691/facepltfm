package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_Expression
{
      private String type;
      private double probability;

      public FaceInfo_Expression(String s, double d)
      {
            type = s;
            probability = d;
      }
}
