package com.jeesite.modules.aipface.entity;

import lombok.Data;

import java.util.ArrayList;

@Data
public class User
{
      private String group_id;
      private String user_id;
      private String user_info;
      private ArrayList<ImageInfo> image_array;
      private float score;
}
