// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.bg.web;

import ee.itcollege.bg.entities.Piiripunkt;
import ee.itcollege.bg.entities.Vaeosa;
import ee.itcollege.bg.entities.Vahtkond;
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

privileged aspect PiiripunktController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String PiiripunktController.create(@Valid Piiripunkt piiripunkt, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("piiripunkt", piiripunkt);
            addDateTimeFormatPatterns(uiModel);
            return "piiripunkts/create";
        }
        uiModel.asMap().clear();
        piiripunkt.persist();
        return "redirect:/piiripunkts/" + encodeUrlPathSegment(piiripunkt.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PiiripunktController.createForm(Model uiModel) {
        uiModel.addAttribute("piiripunkt", new Piiripunkt());
        addDateTimeFormatPatterns(uiModel);
        List dependencies = new ArrayList();
        if (Vaeosa.countVaeosas() == 0) {
            dependencies.add(new String[]{"vaeosa", "vaeosas"});
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "piiripunkts/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PiiripunktController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("piiripunkt", Piiripunkt.findPiiripunkt(id));
        uiModel.addAttribute("itemId", id);
        return "piiripunkts/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PiiripunktController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("piiripunkts", Piiripunkt.findPiiripunktEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Piiripunkt.countPiiripunkts() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("piiripunkts", Piiripunkt.findAllPiiripunkts());
        }
        addDateTimeFormatPatterns(uiModel);
        return "piiripunkts/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PiiripunktController.update(@Valid Piiripunkt piiripunkt, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("piiripunkt", piiripunkt);
            addDateTimeFormatPatterns(uiModel);
            return "piiripunkts/update";
        }
        uiModel.asMap().clear();
        piiripunkt.merge();
        return "redirect:/piiripunkts/" + encodeUrlPathSegment(piiripunkt.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PiiripunktController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("piiripunkt", Piiripunkt.findPiiripunkt(id));
        addDateTimeFormatPatterns(uiModel);
        return "piiripunkts/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PiiripunktController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Piiripunkt.findPiiripunkt(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/piiripunkts";
    }
    
    @ModelAttribute("piiripunkts")
    public Collection<Piiripunkt> PiiripunktController.populatePiiripunkts() {
        return Piiripunkt.findAllPiiripunkts();
    }
    
    @ModelAttribute("vaeosas")
    public Collection<Vaeosa> PiiripunktController.populateVaeosas() {
        return Vaeosa.findAllVaeosas();
    }
    
    @ModelAttribute("vahtkonds")
    public Collection<Vahtkond> PiiripunktController.populateVahtkonds() {
        return Vahtkond.findAllVahtkonds();
    }
    
    void PiiripunktController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("piiripunkt_alates_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("piiripunkt_kuni_date_format", "yyyy-MM-dd");
    }
    
    String PiiripunktController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
