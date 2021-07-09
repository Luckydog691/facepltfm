package com.jeesite.modules.aipface.entity;

import lombok.Data;

import java.util.ArrayList;

@Data
public class Group
{
      private String group_id;
      private ArrayList<User> user_array;
}
