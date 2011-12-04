// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.bg.web;

import ee.itcollege.bg.entities.PiiriloiguHaldaja;
import java.io.UnsupportedEncodingException;
import java.lang.String;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PiiriloiguHaldajaController_Roo_Controller {
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PiiriloiguHaldajaController.createForm(Model uiModel) {
        uiModel.addAttribute("piiriloiguHaldaja", new PiiriloiguHaldaja());
        addDateTimeFormatPatterns(uiModel);
        return "piiriloiguhaldajas/create";
    }
    
    void PiiriloiguHaldajaController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("piiriloiguHaldaja_alates_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("piiriloiguHaldaja_kuni_date_format", "yyyy-MM-dd");
    }
    
    String PiiriloiguHaldajaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
