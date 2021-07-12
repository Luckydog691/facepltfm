package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_EyeStatus
{
      private double left_eye;
      private double right_eye;

      public FaceInfo_EyeStatus(double a, double b)
      {
            left_eye = a;
            right_eye = b;
      }
}
