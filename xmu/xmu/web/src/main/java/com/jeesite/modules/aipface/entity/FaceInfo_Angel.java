package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_Angel
{
      private double yaw;
      private double pitch;
      private double roll;

      public FaceInfo_Angel(double ro, double pit, double ya)
      {
            roll = ro;
            pitch = pit;
            yaw = ya;
      }
}
