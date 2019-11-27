package com.ninejo.helper.Controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class BaseRestController {

    @RequestMapping(value = "/loginValid" , method = RequestMethod.GET) //로그인
    public boolean loginValid(@RequestParam("loginID")String id, @RequestParam("loginPW")String pw)
    {
        //db에서 검색해서 true나 false 리턴한다.

        return false;
    }

    @RequestMapping(value = "/registValid" , method = RequestMethod.GET) //회원가입
    public boolean registValid(@RequestParam("registID")String id, @RequestParam("registPW")String pw, @RequestParam("registPN")String pn)
    {
        //db에서 검색해서 true나 false 리턴한다.

        return false;
    }



}
