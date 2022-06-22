package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

    @RequestMapping("/mainProduct")
    public String product(){
        return "/product/product";
    }

    @RequestMapping("/popularProduct")
    public String popularProduct(){
        return "/product/popularProduct";
    }
}
