package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_Quality_Occlusion
{
      private double left_eye;
      private double right_eye;
      private double nose;
      private double mouth;
      private double left_cheek;
      private double right_cheek;
      private double chin_contour;

      public FaceInfo_Quality_Occlusion(double le, double re, double no, double mo, double lc, double rc, double ch)
      {
            left_eye = le;
            right_eye = re;
            nose = no;
            mouth = mo;
            left_cheek = lc;
            right_cheek = rc;
            chin_contour = ch;
      }
}
