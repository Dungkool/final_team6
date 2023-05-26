package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Contact {
    private int contactpin;
    private int custpin;
    private String custname;
    private String email;
    private String contacttitle;
    private String contactcontent;
    private Date contactdate;
    private String answer;
    private int 관리자번호;
    private String 답변관리자;
    private String 답변내용;
    private Date 답변등록일자;
}
