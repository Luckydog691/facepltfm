package com.jeesite.modules.aipface.entity;

import lombok.Data;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.ArrayList;

@Data
public class Group implements Serializable
{
      private String group_id;
      private ArrayList<User> user_array;
}
