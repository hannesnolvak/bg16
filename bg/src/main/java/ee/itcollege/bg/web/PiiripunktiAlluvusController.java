package ee.itcollege.bg.web;

import ee.itcollege.bg.entities.PiiripunktiAlluvus;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "piiripunktialluvuses", formBackingObject = PiiripunktiAlluvus.class)
@RequestMapping("/piiripunktialluvuses")
@Controller
public class PiiripunktiAlluvusController {
}
