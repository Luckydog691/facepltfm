package com.jeesite.modules.aipface.entity;

import lombok.Data;

import java.util.ArrayList;

@Data
public class ImageInfo
{
      private Integer face_num;
      private ArrayList<FaceInfo> face_list;
}
