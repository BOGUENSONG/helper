package com.ninejo.helper.Controller;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ninejo.helper.Service.DBControl;

import java.sql.SQLException;


@RestController
public class BaseRestController {
    DBControl dbc = new DBControl();

    @Value("${spring.datasource.driver-class-name}")
    private String driver;

    @RequestMapping(value = "/loginValid" , method = RequestMethod.GET) //로그인
    public boolean loginValid(@RequestParam("ID")String id, @RequestParam("PW")String pw) throws SQLException {

        return !dbc.isIdExist(id);

    }

    @RequestMapping(value = "/registValid" , method = RequestMethod.GET) //회원가입
    public boolean registValid(@RequestParam("ID")String id, @RequestParam("PW")String pw, @RequestParam("PN")String pn)
    {
        // isIdExist -> 사용 이미 존재시 알림 출력
        // -> 없을시 resister 사용
        return false;
    }

    @RequestMapping(value = "/changepw" , method = RequestMethod.GET) //내정보 변경
    public boolean changePW(@RequestParam("ID")String id, @RequestParam("PW")String pw, @RequestParam("PN")String pn)
    {
        // changeInfo - id pw pn 매개변수로 받아서 해당 id

        return false;
    }

    @RequestMapping(value = "/pointadd" , method = RequestMethod.GET) //포인트충전
    public boolean pointAdd(@RequestParam("ID")String id)
    {
        // addPoint <- id, 증가시킬 point

        return false;
    }
    @RequestMapping(value = "/pointsub" , method = RequestMethod.GET) //포인트회수
    public boolean pointSub(@RequestParam("ID")String id)
    {
        // subPoint <- id, 감소시킬 point

        return false;
    }
    @RequestMapping(value = "/solvedrequest" , method = RequestMethod.GET) //나의 완료된 의뢰 리턴
    public boolean solvedRequest(@RequestParam("ID")String id)
    {
        //db에서 검색해서 true나 false 리턴한다.

        return false;
    }
    @RequestMapping(value = "/requestRegist" , method = RequestMethod.GET) //의뢰 등록
    public boolean requestRegist(@RequestParam("ID")String id, @RequestParam("Title")String title, @RequestParam("Date")String date, @RequestParam("Point")String point, @RequestParam("Place")String place, @RequestParam("Text")String text)
    {
        // postRequest <- 등록자id, 보상point, 제목, 장소, 내용 -> 이미 등록했으면 false, 아니면 수행 후 true 리턴

        return false;
    }
    @RequestMapping(value = "/mysolving" , method = RequestMethod.GET) //내가 해결중인 의뢰
    public boolean mysolve(@RequestParam("ID")String id)
    {

        //db에서 검색해서 true나 false 리턴한다.

        return false;
    }
    @RequestMapping(value = "/myrequesting" , method = RequestMethod.GET) //내가 등록하고 해결되지 않은 의뢰
    public boolean myrequest(@RequestParam("ID")String id)
    {
        //db에서 검색해서 true나 false 리턴한다.

        return false;
    }
    /*
    의뢰 수락

     */
}
