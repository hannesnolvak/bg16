package ee.itcollege.bg.web;

import ee.itcollege.bg.entities.RiigiAdminYksus;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "riigiadminyksuses", formBackingObject = RiigiAdminYksus.class)
@RequestMapping("/riigiadminyksuses")
@Controller
public class RiigiAdminYksusController {
}
