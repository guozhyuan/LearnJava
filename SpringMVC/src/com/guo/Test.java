package com.guo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by jugg
 * Date : 2018/6/7
 */

@RestController
public class Test {
    private JdbcTemplate jdbcTemplate;


    @RequestMapping("/test")
    public String test(){
//        jdbcTemplate.update("")
        return "TEST";
    }

    @Autowired
    private void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }
}
