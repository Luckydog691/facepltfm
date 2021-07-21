package com.jeesite.modules.aipface.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

@Data
public class SimpleFaceInfo implements Serializable
{
      private String face_token;
      private Date ctime;
      private String time_string;
}
