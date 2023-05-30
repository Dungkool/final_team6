package com.kbstar.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class RecipeIngredient {
    private int ingredientnumber;
    private int recipepin;
    private String name;
    private String quantity;
}
