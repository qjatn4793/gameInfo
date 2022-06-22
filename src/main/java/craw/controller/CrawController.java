package craw.controller;

        import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CrawController {

    @RequestMapping("/mainCraw")
    public String craw(){
        return "/craw/craw";
    }
}
