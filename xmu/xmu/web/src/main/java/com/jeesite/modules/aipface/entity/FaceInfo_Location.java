package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_Location
{
      private double top;
      private double left;
      private Long rotation;
      private double width;
      private double height;


      public FaceInfo_Location(double tp, double le, Long rot, double wi, double he)
      {
            top = tp;
            left = le;
            rotation = rot;
            width = wi;
            height = he;
      }
}
