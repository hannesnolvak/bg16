package ee.itcollege.bg.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ee.itcollege.bg.entities.Piiriloik;
import ee.itcollege.bg.entities.Piiripunkt;
import ee.itcollege.bg.entities.Vaeosa;

@Controller
@RequestMapping("/aruanne")
public class AruandeController {

	@RequestMapping("/aruanne")
	public String vaata(
			@RequestParam(value = "vaeosa", required = false) String vaeosa,
			@RequestParam(value = "kp", required = false) String kp,
			ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {

		model.addAttribute("vaeosa", vaeosa);
		model.addAttribute("kp", kp == null ? "2011-11-11" : kp);

		model.addAttribute("vaeosad", Vaeosa.findAllVaeosas());
		model.addAttribute("piiriloigud", Piiriloik.find(vaeosa, kp));
		model.addAttribute("piiripunkt", Piiripunkt.find(vaeosa, kp));

		return "aruanne/index";
	}
}
