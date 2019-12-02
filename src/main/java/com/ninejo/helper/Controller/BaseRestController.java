package com.ninejo.helper.Controller;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class BaseRestController {
    @Value("${spring.datasource.driver-class-name}")
    private String driver;

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

    @RequestMapping(value = "/changepw" , method = RequestMethod.GET) //내정보 변경
    public boolean changePW(@RequestParam("ID")String id, @RequestParam("newPW")String pw, @RequestParam("newPN")String pn)
    {
        //db에서 검색해서 true나 false 리턴한다.

        return false;
    }

    @RequestMapping(value = "/pointadd" , method = RequestMethod.GET) //포인트충전
    public boolean pointAdd(@RequestParam("ID")String id)
    {
        //db에서 검색해서 true나 false 리턴한다.

        return false;
    }
    @RequestMapping(value = "/pointsub" , method = RequestMethod.GET) //포인트회수
    public boolean pointSub(@RequestParam("ID")String id)
    {
        //db에서 검색해서 true나 false 리턴한다.

        return false;
    }
    @RequestMapping(value = "/solvedrequest" , method = RequestMethod.GET) //나의 완료된 의뢰 리턴
    public boolean solvedRequest(@RequestParam("ID")String id)
    {
        //db에서 검색해서 true나 false 리턴한다.

        return false;
    }

}
