package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_LandMarkPoint
{
      private double x;
      private double y;

      public FaceInfo_LandMarkPoint(double a, double b)
      {
            x = a;
            y = b;
      }
}
