package com.abhishek.complaintbox;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan   // ⭐ VERY IMPORTANT
public class ComplaintBoxApplication {

    public static void main(String[] args) {
        SpringApplication.run(ComplaintBoxApplication.class, args);
    }
}