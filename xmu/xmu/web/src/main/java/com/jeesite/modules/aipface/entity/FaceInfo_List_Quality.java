package com.jeesite.modules.aipface.entity;

import lombok.Data;

@Data
public class FaceInfo_List_Quality
{
      private FaceInfo_List_Quality_Occlusion occlusion;
      private double blur;
      private double illumination;
      private Long completeness;
}
