// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.bg.web;

import ee.itcollege.bg.entities.PiiriloiguHaldaja;
import ee.itcollege.bg.entities.Piiriloik;
import ee.itcollege.bg.entities.Piiripunkt;
import ee.itcollege.bg.entities.Vaeosa;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PiiriloiguHaldajaController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String PiiriloiguHaldajaController.create(@Valid PiiriloiguHaldaja piiriloiguHaldaja, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("piiriloiguHaldaja", piiriloiguHaldaja);
            addDateTimeFormatPatterns(uiModel);
            return "piiriloiguhaldajas/create";
        }
        uiModel.asMap().clear();
        piiriloiguHaldaja.persist();
        return "redirect:/piiriloiguhaldajas/" + encodeUrlPathSegment(piiriloiguHaldaja.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PiiriloiguHaldajaController.createForm(Model uiModel) {
        uiModel.addAttribute("piiriloiguHaldaja", new PiiriloiguHaldaja());
        addDateTimeFormatPatterns(uiModel);
        List dependencies = new ArrayList();
        if (Piiripunkt.countPiiripunkts() == 0) {
            dependencies.add(new String[]{"piiripunkt", "piiripunkts"});
        }
        if (Vaeosa.countVaeosas() == 0) {
            dependencies.add(new String[]{"vaeosa", "vaeosas"});
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "piiriloiguhaldajas/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PiiriloiguHaldajaController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("piiriloiguhaldaja", PiiriloiguHaldaja.findPiiriloiguHaldaja(id));
        uiModel.addAttribute("itemId", id);
        return "piiriloiguhaldajas/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PiiriloiguHaldajaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("piiriloiguhaldajas", PiiriloiguHaldaja.findPiiriloiguHaldajaEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) PiiriloiguHaldaja.countPiiriloiguHaldajas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("piiriloiguhaldajas", PiiriloiguHaldaja.findAllPiiriloiguHaldajas());
        }
        addDateTimeFormatPatterns(uiModel);
        return "piiriloiguhaldajas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PiiriloiguHaldajaController.update(@Valid PiiriloiguHaldaja piiriloiguHaldaja, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("piiriloiguHaldaja", piiriloiguHaldaja);
            addDateTimeFormatPatterns(uiModel);
            return "piiriloiguhaldajas/update";
        }
        uiModel.asMap().clear();
        piiriloiguHaldaja.merge();
        return "redirect:/piiriloiguhaldajas/" + encodeUrlPathSegment(piiriloiguHaldaja.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PiiriloiguHaldajaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("piiriloiguHaldaja", PiiriloiguHaldaja.findPiiriloiguHaldaja(id));
        addDateTimeFormatPatterns(uiModel);
        return "piiriloiguhaldajas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PiiriloiguHaldajaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PiiriloiguHaldaja.findPiiriloiguHaldaja(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/piiriloiguhaldajas";
    }
    
    @ModelAttribute("piiriloiguhaldajas")
    public Collection<PiiriloiguHaldaja> PiiriloiguHaldajaController.populatePiiriloiguHaldajas() {
        return PiiriloiguHaldaja.findAllPiiriloiguHaldajas();
    }
    
    @ModelAttribute("piiriloiks")
    public Collection<Piiriloik> PiiriloiguHaldajaController.populatePiiriloiks() {
        return Piiriloik.findAllPiiriloiks();
    }
    
    @ModelAttribute("piiripunkts")
    public Collection<Piiripunkt> PiiriloiguHaldajaController.populatePiiripunkts() {
        return Piiripunkt.findAllPiiripunkts();
    }
    
    @ModelAttribute("vaeosas")
    public Collection<Vaeosa> PiiriloiguHaldajaController.populateVaeosas() {
        return Vaeosa.findAllVaeosas();
    }
    
    void PiiriloiguHaldajaController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("piiriloiguHaldaja_avatud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("piiriloiguHaldaja_muudetud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("piiriloiguHaldaja_suletud_date_format", "yyyy-MM-dd");
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
