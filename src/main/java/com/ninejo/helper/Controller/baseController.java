package com.ninejo.helper.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;

@Controller
@SessionAttributes("id")
public class baseController {

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
    public String mainWindow(Model model) throws IOException, SAXException, ParserConfigurationException{
        return "main";
    }

    @RequestMapping(value = "/requestRegist") //요청 페이지
    public String requestRegist(Model model) throws IOException, SAXException, ParserConfigurationException{
        return "requestRegist";
    }

    @RequestMapping(value = "/requestList") //의뢰 목록
    public String requestList(Model model) throws IOException, SAXException, ParserConfigurationException{
        return "requestList";
    }

    @RequestMapping(value = "/progress") //현재 진행중인 의뢰목록
    public String progress(Model model) throws IOException, SAXException, ParserConfigurationException{
        return "progress";
    }

    @RequestMapping(value = "/myInfo") //내정보
    public String myInfo(Model model) throws IOException, SAXException, ParserConfigurationException{
        return "myInfo";
    }

}
