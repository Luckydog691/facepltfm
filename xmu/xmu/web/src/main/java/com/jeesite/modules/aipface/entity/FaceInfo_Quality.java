package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_Quality
{
      private double illumination;
      private FaceInfo_Quality_Occlusion occlusion;
      private double blur;
      private Long completeness;

      public FaceInfo_Quality(double i, FaceInfo_Quality_Occlusion o, double b, Long c)
      {
            illumination = i;
            occlusion = o;
            blur = b;
            completeness = c;
      }
}
