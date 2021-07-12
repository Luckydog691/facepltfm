package com.jeesite.modules.aipface.entity;

import lombok.Data;

import java.util.ArrayList;

@Data
public class FaceSearchRet
{
     private String face_token;
     ArrayList<User>user_list;
}
