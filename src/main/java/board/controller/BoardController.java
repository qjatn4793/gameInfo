package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

    @RequestMapping("/mainBoard")
    public String board(){
        return "/board/board";
    }
}
