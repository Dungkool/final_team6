package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Goodlist {
    private int custpin;
    private int recipepin;
    private Date gooddate;
}
