package ee.itcollege.bg.web;

import ee.itcollege.bg.entities.VahtkondPiiriloigul;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "vahtkondpiiriloiguls", formBackingObject = VahtkondPiiriloigul.class)
@RequestMapping("/vahtkondpiiriloiguls")
@Controller
public class VahtkondPiiriloigulController {
}
