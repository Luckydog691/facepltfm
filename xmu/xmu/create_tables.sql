CREATE DATABASE IF NOT EXISTS face_detection DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

CREATE USER 'root'@'localhost' IDENTIFIED BY 'toor';
CREATE USER 'root'@'%' IDENTIFIED BY 'toor';

GRANT ALL ON face_detection.* TO 'root'@'localhost';
GRANT ALL ON face_detection.* TO 'root'@'%';

FLUSH PRIVILEGES;

use face_detection;
create table faceinfo
(
    id varchar(64),
    centerX float null,
    centerY float null,
    width float null,
    height float null,
    angle float null,
    score float null,
    yaw float null,
    roll float null,
    pitch float null,
    bluriness float null,
    illum varchar(128) null,
    age int null,
    mouthclose float null,
    leftEyeclose float null,
    rightEyeclose float null,
    occlusion varchar(128) null,
    race varchar(128) null,
    glasses varchar(128) null,
    gender varchar(128) null,
    clientID varchar(128) null,
    isAlter tinyint null,
    constraint faceinfo_pk
        primary key (id)
);


create table feature
(
    id varchar(64),
    faceinfoID varchar(128),
    feature blob,
    constraint featire_pk
        primary key (id)
);


create table calresult
(
    id varchar(64),
    startTime datetime,
    finishTime datetime,
    operateType varchar(64),
    operateUserID varchar(64),
    result varchar(45),
    context text,
    constraint calresult_pk
        primary key (id)
);


create table facepicture
(
    id varchar(45),
    faceinfoid varchar(45),
    filepath varchar(255),
    filename varchar(255),

    constraint facepicture_pk
        primary key (id)
);


create table video
(
    id varchar(45),
    videopath varchar(255),
    videoname varchar(255),

    constraint video_pk
        primary key (id)
);


create table facegroup
(
    id varchar(45),
    groupid int,
    remarks varchar(255),

    constraint facegroup_pk
        primary key (id)
);


create table faceinfo_facegroup
(
    id varchar(45),
    faceinfoid varchar(45),
    groupid int,

    constraint faceinfo_facegroup_pk
        primary key (id)
);


create table public_security_verification
(
    id varchar(45),
    user_id varchar(45),
    user_name varchar(255),
    filepath varchar(255),
    filename varchar(255),

    constraint public_security_verification_pk
        primary key (id)
);


create table doc
(
    id varchar(45),
    title text,
    context text,
    filepath text,
    filename text,
    upload_user_code varchar(100),
    uploadtime datetime,

    constraint doc_pk
        primary key (id)
);

