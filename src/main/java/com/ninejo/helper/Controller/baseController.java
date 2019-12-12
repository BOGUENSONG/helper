package com.ninejo.helper.Controller;

import com.ninejo.helper.Service.DBControl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
public class baseController {
    DBControl dbc = new DBControl();

    //주소창에 localhost:1234/ 치면 이동
    @RequestMapping(value = "/test")
    public String testIndex(Model model) throws IOException, SAXException, ParserConfigurationException {
        model.addAttribute("temp","헬로");
        return "test";
    }

    @RequestMapping(value = "/") //시작화면
    public String index(Model model) throws IOException, SAXException, ParserConfigurationException{
        return "index";
    }

    @RequestMapping(value = "/main") //메인화면
    public String mainWindow(@RequestParam("id") String id , Model model) throws IOException, SAXException, ParserConfigurationException{
        model.addAttribute("id",id);
        return "main";
    }

    @RequestMapping(value = "/requestRegist") //요청 페이지
    public String requestRegist(@RequestParam("id") String id , Model model) throws IOException, SAXException, ParserConfigurationException, SQLException {
        HashMap list = dbc.getMemberInfo(id);
        model.addAttribute("list",list);
        return "requestRegist";
    }

    @RequestMapping(value = "/requestList") //의뢰 목록
    public String requestList(@RequestParam("id") String id , Model model) throws IOException, SAXException, ParserConfigurationException, SQLException {
        ArrayList rlist = dbc.getRequestList(id);
        model.addAttribute("list",rlist);
        return "requestList";
    }

    @RequestMapping(value = "/progress") //현재 진행중인 의뢰목록
    public String progress(@RequestParam("id") String id , Model model) throws IOException, SAXException, ParserConfigurationException, SQLException {
        HashMap rlist = dbc.getPostRequest(id); //요청중인 의뢰
        model.addAttribute("rlist",rlist);
        HashMap alist = dbc.getAcptRequest(id); //해결중인 의뢰
        model.addAttribute("alist",alist);
        return "progress";
    }

    @RequestMapping(value = "/myInfo") //내정보
    public String myInfo(@RequestParam("id") String id , Model model) throws IOException, SAXException, ParserConfigurationException, SQLException {
        ArrayList rlist = dbc.getSolvedRequestList(id);
        model.addAttribute("rlist",rlist);
        HashMap mlist = dbc.getMemberInfo(id);
        model.addAttribute("mlist",mlist);
        return "myInfo";
    }

}
