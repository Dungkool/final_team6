package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {
    private int custpin;
    private String custid;
    private String custname;
    private String linkedlogin;
    private String nickname;
    private String password;
    private String gender;
    private String phone;
    private String email;
    private String location;
    private Date date;
    private String profileimgname;
}
