package ee.itcollege.bg.web;

import ee.itcollege.bg.entities.Piiriloik;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "piiriloiks", formBackingObject = Piiriloik.class, update=false)
@RequestMapping("/piiriloiks")
@Controller
public class PiiriloikController {
}
