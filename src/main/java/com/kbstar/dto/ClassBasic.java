package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ClassBasic {
    private int classpin;
    private int custpin;
    private String custid;
    private String nickname;
    private String type;
    private String location;
    private String cooking;
    private String thumbnailimg;
    private int amount;
    private int classtime;
    private int personal;
    private String classtitle;
    private String classdesc;
    private String adderess;
    private Date classdate;

}
