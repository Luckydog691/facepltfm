package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_Location
{
      private double left;
      private double top;
      private double width;
      private double height;
      private Long rotation;

      public FaceInfo_Location(double tp, double le, Long rot, double wi, double he)
      {
            top = tp;
            left = le;
            rotation = rot;
            width = wi;
            height = he;
      }
}
