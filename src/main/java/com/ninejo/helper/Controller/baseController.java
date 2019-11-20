package com.ninejo.helper.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;

@Controller
public class baseController {

    //주소창에 localhost:1234/ 치면 이동
    @RequestMapping(value = "/test")
    public String testIndex(Model model) throws IOException, SAXException, ParserConfigurationException {
        model.addAttribute("temp","헬로");
        return "test";
    }
}
