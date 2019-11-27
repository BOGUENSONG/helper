package com.ninejo.helper.Controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class BaseRestController {

    @RequestMapping(value = "/loginCheck" , method = RequestMethod.GET)
    public boolean loginCheck(@RequestParam("loginID")String id, @RequestParam("loginPW")String pw)
    {
        //db에서 검색해서 true나 false 리턴한다.

        return false;
    }
}
