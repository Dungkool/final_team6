package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Subscribe {
    private int custpin;
    private int subcustpin;
    private Date subdate;
}
