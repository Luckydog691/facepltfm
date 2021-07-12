package com.jeesite.modules.aipface.entity;

import lombok.Data;

import java.util.ArrayList;

@Data
public class FaceOperationRet
{
     private Long log_id;
     private String face_token;
     private FaceInfo_Location location;
}
