package ee.itcollege.bg.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.classic.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ee.itcollege.bg.aruanne.AruandePiiriloik;
import ee.itcollege.bg.entities.BaseEntity;
import ee.itcollege.bg.entities.Piiriloik;
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

		if(kp == null)
		{
			kp = "2011-12-04";
		}

		model.addAttribute("vaeosa", vaeosa);
		model.addAttribute("kp", kp);

		Session sess = ((Session) BaseEntity.entityManager().getDelegate());
		sess.disableFilter("suletud");
		sess.enableFilter("aeg").setParameter("aeg", kp);
		
		List<AruandePiiriloik> apl = new ArrayList<AruandePiiriloik>();
		for(Piiriloik p : Piiriloik.find(vaeosa, kp))
		{
			apl.add(new AruandePiiriloik(p, kp));
		}

		List<AruandePiiriloik> app = new ArrayList<AruandePiiriloik>();
		for(Piiriloik p : Piiriloik.find(vaeosa, kp))
		{
			app.add(new AruandePiiriloik(p, kp));
		}
		
		model.addAttribute("vaeosad", Vaeosa.findAllVaeosas());
		model.addAttribute("piiriloigud", apl);
		model.addAttribute("piiripunkt", app);

		return "aruanne/index";
	}
}
