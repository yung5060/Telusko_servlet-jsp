package com.kbank.yung.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WhitelistController {

    @RequestMapping("/")
    public String index() {
        return "index";
    }
}
