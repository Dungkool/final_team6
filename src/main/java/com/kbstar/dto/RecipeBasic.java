package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class RecipeBasic {
    private int recipepin;
    private int custpin;
    private String custid;
    private String nickname;
    private String type;
    private String situation;
    private String ingredients1;
    private String ingredients2;
    private String ingredients3;
    private String cooking;
    private String thumbnailimg;
    private String finishedimg;
    private int time;
    private String recipelevel;
    private String recipetitle;
    private String recipedesc;
    private Date recipedate;
}
