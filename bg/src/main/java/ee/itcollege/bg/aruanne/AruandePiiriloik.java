package ee.itcollege.bg.aruanne;

import ee.itcollege.bg.entities.Piiriloik;

public class AruandePiiriloik {

	public String kood;
	public int vahtkondi;
	
	public AruandePiiriloik(Piiriloik p, String date)
	{
		kood = p.getKood();
		vahtkondi = p.getVahtkonnad().size();
	}
}
