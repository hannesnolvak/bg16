// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.bg.web;

import ee.itcollege.bg.entities.Piiriloik;
import ee.itcollege.bg.entities.Vahtkond;
import ee.itcollege.bg.entities.VahtkondPiiriloigul;
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

privileged aspect VahtkondPiiriloigulController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String VahtkondPiiriloigulController.create(@Valid VahtkondPiiriloigul vahtkondPiiriloigul, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vahtkondPiiriloigul", vahtkondPiiriloigul);
            addDateTimeFormatPatterns(uiModel);
            return "vahtkondpiiriloiguls/create";
        }
        uiModel.asMap().clear();
        vahtkondPiiriloigul.persist();
        return "redirect:/vahtkondpiiriloiguls/" + encodeUrlPathSegment(vahtkondPiiriloigul.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String VahtkondPiiriloigulController.createForm(Model uiModel) {
        uiModel.addAttribute("vahtkondPiiriloigul", new VahtkondPiiriloigul());
        addDateTimeFormatPatterns(uiModel);
        List dependencies = new ArrayList();
        if (Vahtkond.countVahtkonds() == 0) {
            dependencies.add(new String[]{"vahtkond", "vahtkonds"});
        }
        if (Piiriloik.countPiiriloiks() == 0) {
            dependencies.add(new String[]{"piiriloik", "piiriloiks"});
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "vahtkondpiiriloiguls/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String VahtkondPiiriloigulController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("vahtkondpiiriloigul", VahtkondPiiriloigul.findVahtkondPiiriloigul(id));
        uiModel.addAttribute("itemId", id);
        return "vahtkondpiiriloiguls/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String VahtkondPiiriloigulController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("vahtkondpiiriloiguls", VahtkondPiiriloigul.findVahtkondPiiriloigulEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) VahtkondPiiriloigul.countVahtkondPiiriloiguls() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("vahtkondpiiriloiguls", VahtkondPiiriloigul.findAllVahtkondPiiriloiguls());
        }
        addDateTimeFormatPatterns(uiModel);
        return "vahtkondpiiriloiguls/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String VahtkondPiiriloigulController.update(@Valid VahtkondPiiriloigul vahtkondPiiriloigul, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vahtkondPiiriloigul", vahtkondPiiriloigul);
            addDateTimeFormatPatterns(uiModel);
            return "vahtkondpiiriloiguls/update";
        }
        uiModel.asMap().clear();
        vahtkondPiiriloigul.merge();
        return "redirect:/vahtkondpiiriloiguls/" + encodeUrlPathSegment(vahtkondPiiriloigul.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String VahtkondPiiriloigulController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("vahtkondPiiriloigul", VahtkondPiiriloigul.findVahtkondPiiriloigul(id));
        addDateTimeFormatPatterns(uiModel);
        return "vahtkondpiiriloiguls/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String VahtkondPiiriloigulController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        VahtkondPiiriloigul.findVahtkondPiiriloigul(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/vahtkondpiiriloiguls";
    }
    
    @ModelAttribute("piiriloiks")
    public Collection<Piiriloik> VahtkondPiiriloigulController.populatePiiriloiks() {
        return Piiriloik.findAllPiiriloiks();
    }
    
    @ModelAttribute("vahtkonds")
    public Collection<Vahtkond> VahtkondPiiriloigulController.populateVahtkonds() {
        return Vahtkond.findAllVahtkonds();
    }
    
    @ModelAttribute("vahtkondpiiriloiguls")
    public Collection<VahtkondPiiriloigul> VahtkondPiiriloigulController.populateVahtkondPiiriloiguls() {
        return VahtkondPiiriloigul.findAllVahtkondPiiriloiguls();
    }
    
    void VahtkondPiiriloigulController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("vahtkondPiiriloigul_avatud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("vahtkondPiiriloigul_muudetud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("vahtkondPiiriloigul_suletud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("vahtkondPiiriloigul_alates_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("vahtkondPiiriloigul_kuni_date_format", "yyyy-MM-dd");
    }
    
    String VahtkondPiiriloigulController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
